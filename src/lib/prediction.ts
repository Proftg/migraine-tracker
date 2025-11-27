
import * as tf from '@tensorflow/tfjs';
import { JournalEntry, MigraineEntry } from "@/types";
import { WeatherData } from "./weather";

export interface GarminData {
    sleep?: {
        sleep_time_seconds: number;
        sleep_score: number;
        deep_sleep_seconds: number;
        rem_sleep_seconds: number;
    };
    stress?: {
        average: number;
        max: number;
    };
    heart_rate?: {
        resting_hr: number;
        max_hr: number;
    };
    summary?: {
        steps: number;
        calories: number;
    };
}

export interface PredictionResult {
    probability: number; // 0-1
    confidence: number; // 0-1 (based on amount of data)
    predictedDate: string;
    contributingFactors: string[];
}

export class PredictionService {
    private model: tf.Sequential | null = null;
    private isTraining = false;
    private minDataPoints = 5;
    private useGarminData = false;

    constructor() {
        // Enhanced model with more features (now 8 input features instead of 4)
        this.model = tf.sequential();
        this.model.add(tf.layers.dense({ units: 16, activation: 'relu', inputShape: [8] }));
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
     * Prepares training data from journal entries with optional Garmin data
     * Features: [DaysSinceLastMigraine, Pressure, Temperature, YesterdayWasMigraine, 
     *            SleepHours, SleepQuality, StressLevel, RestingHR]
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
            if (lastMigraineDate) {
                daysSinceLast = (date - lastMigraineDate) / (1000 * 60 * 60 * 24);
            }
            if (prevEntry.type === 'migraine') {
                lastMigraineDate = new Date(prevEntry.date).getTime();
                daysSinceLast = 0;
            }

            // Feature 2: Pressure (Normalized 950-1050 -> 0-1)
            const pressure = entry.weather?.pressure ? (entry.weather.pressure - 950) / 100 : 0.63;

            // Feature 3: Temperature (Normalized -10 to 40 -> 0-1)
            const temp = entry.weather?.temperature ? (entry.weather.temperature + 10) / 50 : 0.5;

            // Feature 4: Yesterday was migraine?
            const yesterdayWasMigraine = prevEntry.type === 'migraine' ? 1 : 0;

            // Try to load Garmin data for this date
            const garminData = await this.loadGarminData(dateStr);

            // Feature 5: Sleep hours (Normalized 0-12 -> 0-1)
            let sleepHours = 0.6; // Default ~7h
            if (garminData?.sleep) {
                sleepHours = Math.min(garminData.sleep.sleep_time_seconds / (12 * 3600), 1);
                garminDataAvailable = true;
            }

            // Feature 6: Sleep quality (0-100 -> 0-1)
            let sleepQuality = 0.7; // Default good sleep
            if (garminData?.sleep?.sleep_score) {
                sleepQuality = garminData.sleep.sleep_score / 100;
            }

            // Feature 7: Stress level (0-100 -> 0-1)
            let stress = 0.3; // Default low stress
            if (garminData?.stress?.average) {
                stress = garminData.stress.average / 100;
            }

            // Feature 8: Resting HR (Normalized 40-100 -> 0-1)
            let restingHR = 0.5; // Default ~70 bpm
            if (garminData?.heart_rate?.resting_hr) {
                restingHR = (garminData.heart_rate.resting_hr - 40) / 60;
            }

            // Target: Is this entry a migraine?
            const isMigraine = entry.type === 'migraine' ? 1 : 0;

            xs.push([
                daysSinceLast / 30,
                pressure,
                temp,
                yesterdayWasMigraine,
                sleepHours,
                sleepQuality,
                stress,
                restingHR
            ]);
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
        const lastEntry = sortedEntries[0];
        const lastMigraine = sortedEntries.find(e => e.type === 'migraine');

        // Feature 1: Days since last migraine
        let daysSinceLast = 0;
        if (lastMigraine) {
            const now = new Date().getTime();
            const lastDate = new Date(lastMigraine.date).getTime();
            daysSinceLast = (now - lastDate) / (1000 * 60 * 60 * 24);
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

        // Features 5-8: Garmin data or defaults
        const sleepHours = garminData?.sleep ? Math.min(garminData.sleep.sleep_time_seconds / (12 * 3600), 1) : 0.6;
        const sleepQuality = garminData?.sleep?.sleep_score ? garminData.sleep.sleep_score / 100 : 0.7;
        const stress = garminData?.stress?.average ? garminData.stress.average / 100 : 0.3;
        const restingHR = garminData?.heart_rate?.resting_hr ? (garminData.heart_rate.resting_hr - 40) / 60 : 0.5;

        const input = tf.tensor2d([[
            daysSinceLast / 30,
            pressure,
            temp,
            isMigraineToday,
            sleepHours,
            sleepQuality,
            stress,
            restingHR
        ]]);

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
            if (sleepHours < 0.5) factors.push("Sommeil insuffisant");
            if (sleepQuality < 0.6) factors.push("Mauvaise qualité de sommeil");
            if (stress > 0.6) factors.push("Stress élevé");
            if (restingHR > 0.7) factors.push("FC au repos élevée");
        }

        return {
            probability,
            confidence: Math.min(entries.length / 20, 1) * (this.useGarminData ? 1.2 : 1), // Boost confidence with Garmin data
            predictedDate: "Demain",
            contributingFactors: factors
        };
    }

    hasGarminData(): boolean {
        return this.useGarminData;
    }
}

export const predictionService = new PredictionService();
