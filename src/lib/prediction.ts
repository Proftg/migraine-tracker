
import * as tf from '@tensorflow/tfjs';
import { JournalEntry, MigraineEntry } from "@/types";
import { WeatherData } from "./weather";

export interface GarminData {
    // Flat structure from new python script
    sleep_seconds?: number;
    sleep_score?: number;
    stress_avg?: number;
    resting_hr?: number;
    steps?: number;
    total_calories?: number;

    // Legacy nested structure support (optional)
    sleep?: {
        sleep_time_seconds: number;
        sleep_score: number;
    };
    stress?: {
        average: number;
    };
    heart_rate?: {
        resting_hr: number;
    };
}

export interface PredictionResult {
    probability: number; // 0-1
    confidence: number; // 0-1 (based on amount of data)
    predictedDate: string;
    contributingFactors: string[];
    usedGarminData?: boolean;
}



export class PredictionService {
    private model: tf.Sequential | null = null;
    private isTraining = false;
    private minDataPoints = 5;
    private useGarminData = false;

    constructor() {
        // Enhanced model with more features (now 7 input features instead of 8)
        this.model = tf.sequential();
        this.model.add(tf.layers.dense({ units: 16, activation: 'relu', inputShape: [7] }));
        this.model.add(tf.layers.dropout({ rate: 0.2 }));
        this.model.add(tf.layers.dense({ units: 8, activation: 'relu' }));
        this.model.add(tf.layers.dense({ units: 1, activation: 'sigmoid' }));

        this.model.compile({
            optimizer: tf.train.adam(0.01),
            loss: 'binaryCrossentropy',
            metrics: ['accuracy']
        });
    }

    /**
     * Load Garmin data from API
     */
    private async loadGarminData(date: string): Promise<GarminData | null> {
        try {
            const response = await fetch(`/api/garmin/${date}`);
            if (!response.ok) return null;
            const result = await response.json();
            return result.data;
        } catch (error) {
            console.error("Failed to load Garmin data:", error);
            return null;
        }
    }

    /**
     * Helper to extract metrics from Garmin data (handling both flat and nested structures)
     */
    private extractGarminMetrics(data: GarminData | null) {
        if (!data) return { sleepHours: 0.6, sleepQuality: 0.7, stress: 0.3, hasData: false };

        // Sleep Hours (Normalized 0-12 -> 0-1)
        let sleepSeconds = data.sleep_seconds;
        if (sleepSeconds === undefined && data.sleep?.sleep_time_seconds) {
            sleepSeconds = data.sleep.sleep_time_seconds;
        }
        const sleepHours = sleepSeconds ? Math.min(sleepSeconds / (12 * 3600), 1) : 0.6;

        // Sleep Quality (0-100 -> 0-1)
        let sleepScore = data.sleep_score;
        if (sleepScore === undefined && data.sleep?.sleep_score) {
            sleepScore = data.sleep.sleep_score;
        }
        const sleepQuality = sleepScore ? sleepScore / 100 : 0.7;

        // Stress level (0-100 -> 0-1)
        let stressAvg = data.stress_avg;
        if (stressAvg === undefined && data.stress?.average) {
            stressAvg = data.stress.average;
        }
        const stress = stressAvg ? stressAvg / 100 : 0.3;

        return { sleepHours, sleepQuality, stress, hasData: true };
    }

    /**
     * Prepares training data from journal entries with optional Garmin data
     * Features: [DaysSinceLastMigraine, Pressure, Temperature, YesterdayWasMigraine, 
     *            SleepHours, SleepQuality, StressLevel]
     */
    private async prepareData(entries: JournalEntry[]) {
        const sortedEntries = [...entries].sort((a, b) => new Date(a.date).getTime() - new Date(b.date).getTime());

        const xs: number[][] = [];
        const ys: number[] = [];

        let lastMigraineDate: number | null = null;
        let garminDataAvailable = false;

        for (let i = 1; i < sortedEntries.length; i++) {
            const entry = sortedEntries[i];
            const prevEntry = sortedEntries[i - 1];
            const date = new Date(entry.date).getTime();
            const dateStr = entry.date.split('T')[0]; // YYYY-MM-DD

            // Feature 1: Days since last migraine
            let daysSinceLast = 0;
            if (lastMigraineDate && !isNaN(lastMigraineDate)) {
                daysSinceLast = (date - lastMigraineDate) / (1000 * 60 * 60 * 24);
            }
            if (prevEntry.type === 'migraine') {
                const prevDate = new Date(prevEntry.date).getTime();
                if (!isNaN(prevDate)) {
                    lastMigraineDate = prevDate;
                    daysSinceLast = 0;
                }
            }

            // Feature 2: Pressure (Normalized 950-1050 -> 0-1)
            const pressure = entry.weather?.pressure ? (entry.weather.pressure - 950) / 100 : 0.63;

            // Feature 3: Temperature (Normalized -10 to 40 -> 0-1)
            const temp = entry.weather?.temperature ? (entry.weather.temperature + 10) / 50 : 0.5;

            // Feature 4: Yesterday was migraine?
            const yesterdayWasMigraine = prevEntry.type === 'migraine' ? 1 : 0;

            // Try to load Garmin data for this date
            const garminData = await this.loadGarminData(dateStr);
            const metrics = this.extractGarminMetrics(garminData);
            if (metrics.hasData) garminDataAvailable = true;

            // Target: Is this entry a migraine?
            const isMigraine = entry.type === 'migraine' ? 1 : 0;

            // Ensure no NaNs
            const features = [
                isNaN(daysSinceLast) ? 0 : daysSinceLast / 30,
                isNaN(pressure) ? 0.63 : pressure,
                isNaN(temp) ? 0.5 : temp,
                yesterdayWasMigraine,
                isNaN(metrics.sleepHours) ? 0.6 : metrics.sleepHours,
                isNaN(metrics.sleepQuality) ? 0.7 : metrics.sleepQuality,
                isNaN(metrics.stress) ? 0.3 : metrics.stress
            ];

            xs.push(features);
            ys.push(isMigraine);
        }

        this.useGarminData = garminDataAvailable;

        return {
            xs: tf.tensor2d(xs),
            ys: tf.tensor2d(ys, [ys.length, 1])
        };
    }

    async train(entries: JournalEntry[]) {
        if (entries.length < this.minDataPoints || this.isTraining || !this.model) {
            return false;
        }

        this.isTraining = true;
        try {
            const { xs, ys } = await this.prepareData(entries);

            await this.model.fit(xs, ys, {
                epochs: 100, // Increased epochs for better learning
                shuffle: true,
                batchSize: 4,
                verbose: 0,
                validationSplit: 0.2 // Use 20% for validation
            });

            xs.dispose();
            ys.dispose();
            return true;
        } catch (error) {
            console.error("Training error:", error);
            return false;
        } finally {
            this.isTraining = false;
        }
    }

    async predictNextDay(entries: JournalEntry[], currentWeather: WeatherData | null): Promise<PredictionResult | null> {
        if (!this.model || entries.length < this.minDataPoints) {
            return null;
        }

        const sortedEntries = [...entries].sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime());
        const lastMigraine = sortedEntries.find(e => e.type === 'migraine');

        // Feature 1: Days since last migraine
        let daysSinceLast = 0;
        if (lastMigraine) {
            const now = new Date().getTime();
            const lastDate = new Date(lastMigraine.date).getTime();
            if (!isNaN(lastDate)) {
                daysSinceLast = (now - lastDate) / (1000 * 60 * 60 * 24);
            }
        }

        // Feature 2-3: Weather
        const pressure = currentWeather ? (currentWeather.pressure - 950) / 100 : 0.63;
        const temp = currentWeather ? (currentWeather.temperature + 10) / 50 : 0.5;

        // Feature 4: Yesterday was migraine?
        const today = new Date().toISOString().split('T')[0];
        const isMigraineToday = entries.some(e => e.type === 'migraine' && e.date.startsWith(today)) ? 1 : 0;

        // Try to get latest Garmin data
        // First try yesterday (ideal)
        const yesterday = new Date(Date.now() - 86400000).toISOString().split('T')[0];
        let garminData = await this.loadGarminData(yesterday);

        // If not found, try to get the absolute latest available data
        if (!garminData) {
            try {
                const response = await fetch('/api/garmin/latest');
                if (response.ok) {
                    const result = await response.json();
                    // Only use if it's recent (less than 3 days old)
                    const dataDate = new Date(result.date).getTime();
                    const threeDaysAgo = Date.now() - (3 * 86400000);
                    if (dataDate > threeDaysAgo) {
                        garminData = result.data;
                        console.log(`Using fallback Garmin data from ${result.date}`);
                    }
                }
            } catch (e) {
                console.error("Failed to fetch latest Garmin data fallback", e);
            }
        }

        // Features 5-7: Garmin data or defaults
        const metrics = this.extractGarminMetrics(garminData);

        // Ensure no NaNs in input
        const features = [
            isNaN(daysSinceLast) ? 0 : daysSinceLast / 30,
            isNaN(pressure) ? 0.63 : pressure,
            isNaN(temp) ? 0.5 : temp,
            isMigraineToday,
            isNaN(metrics.sleepHours) ? 0.6 : metrics.sleepHours,
            isNaN(metrics.sleepQuality) ? 0.7 : metrics.sleepQuality,
            isNaN(metrics.stress) ? 0.3 : metrics.stress
        ];

        const input = tf.tensor2d([features]);

        const prediction = this.model.predict(input) as tf.Tensor;
        const probability = (await prediction.data())[0];

        input.dispose();
        prediction.dispose();

        // Determine contributing factors
        const factors = [];
        if (daysSinceLast > 14) factors.push("Cycle long détecté");
        if (pressure < 0.5) factors.push("Basse pression");
        if (isMigraineToday) factors.push("Suite de crise");
        if (garminData) {
            if (metrics.sleepHours < 0.5) factors.push("Sommeil insuffisant");
            if (metrics.sleepQuality < 0.6) factors.push("Mauvaise qualité de sommeil");
            if (metrics.stress > 0.6) factors.push("Stress élevé");
        }

        return {
            probability: isNaN(probability) ? 0 : probability, // Final safety check
            confidence: Math.min(entries.length / 20, 1) * (this.useGarminData ? 1.2 : 1), // Boost confidence with Garmin data
            predictedDate: "Demain",
            contributingFactors: factors,
            usedGarminData: this.useGarminData
        };
    }

    hasGarminData(): boolean {
        return this.useGarminData;
    }
}

export const predictionService = new PredictionService();
