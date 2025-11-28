
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
    private numFeatures = 11; // Updated to 11 features

    constructor() {
        // Enhanced model with 11 input features:
        // [DaysSinceLast, Pressure, Temp, YesterdayMigraine, 
        //  SleepHours, SleepQuality, Stress, 
        //  ScreenTimeDuration, ScreenTimeBreaks, BlueLightFilter, DailyCalories]
        this.model = tf.sequential();
        this.model.add(tf.layers.dense({ units: 12, activation: 'relu', inputShape: [this.numFeatures] }));
        this.model.add(tf.layers.dropout({ rate: 0.3 }));
        this.model.add(tf.layers.dense({ units: 6, activation: 'relu' }));
        this.model.add(tf.layers.dropout({ rate: 0.2 }));
        this.model.add(tf.layers.dense({ units: 1, activation: 'sigmoid' }));

        this.model.compile({
            optimizer: tf.train.adam(0.003),
            loss: 'binaryCrossentropy',
            metrics: ['accuracy']
        });
    }

    /**
     * Extract screen time data from entries for a specific date
     */
    private getScreenTimeForDate(entries: JournalEntry[], dateStr: string): { duration: number; hasBreaks: boolean; hasBlueLight: boolean; hasData: boolean } {
        const screenTimeEntries = entries.filter(e =>
            e.type === 'screentime' &&
            e.date.startsWith(dateStr)
        );

        if (screenTimeEntries.length === 0) {
            return { duration: 0, hasBreaks: false, hasBlueLight: false, hasData: false };
        }

        // Use the most recent entry for that date
        const entry = screenTimeEntries[0] as any;
        return {
            duration: entry.duration || 0,
            hasBreaks: (entry.breakFrequency && entry.breakFrequency > 0) || false,
            hasBlueLight: entry.blueLightFilter || false,
            hasData: true
        };
    }

    /**
     * Extract calorie data from entries for a specific date
     */
    private getCaloriesForDate(entries: JournalEntry[], dateStr: string): { calories: number; hasData: boolean } {
        const calorieEntries = entries.filter(e =>
            e.type === 'calories' &&
            e.date.startsWith(dateStr)
        );

        if (calorieEntries.length === 0) {
            return { calories: 0, hasData: false };
        }

        const entry = calorieEntries[0] as any;
        return {
            calories: entry.totalCalories || 0,
            hasData: true
        };
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
     * Helper to clamp values between 0 and 1
     */
    private clamp(value: number): number {
        return Math.max(0, Math.min(1, value));
    }

    /**
     * Prepares training data from journal entries with optional Garmin data
     * Features: [DaysSinceLastMigraine, Pressure, Temperature, YesterdayWasMigraine, 
     *            SleepHours, SleepQuality, StressLevel,
     *            ScreenTimeDuration, ScreenTimeBreaks, BlueLightFilter, DailyCalories]
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

            // Feature 1: Days since last migraine (Normalized 0-30 -> 0-1)
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

            // Features 5-7: Garmin data
            const garminData = await this.loadGarminData(dateStr);
            const metrics = this.extractGarminMetrics(garminData);
            if (metrics.hasData) garminDataAvailable = true;

            // Features 8-10: Screen time data
            const screenTime = this.getScreenTimeForDate(entries, dateStr);
            const screenDuration = this.clamp(screenTime.duration / 16); // Normalize 0-16h -> 0-1
            const hasBreaks = screenTime.hasBreaks ? 1 : 0;
            const hasBlueLight = screenTime.hasBlueLight ? 1 : 0;

            // Feature 11: Daily calories (Normalized 0-3000 -> 0-1)
            const calorieData = this.getCaloriesForDate(entries, dateStr);
            const calories = this.clamp(calorieData.calories / 3000);

            // Target: Is this entry a migraine?
            const isMigraine = entry.type === 'migraine' ? 1 : 0;

            // Build feature vector with all 11 features
            const features = [
                this.clamp(isNaN(daysSinceLast) ? 0 : daysSinceLast / 30),
                this.clamp(isNaN(pressure) ? 0.63 : pressure),
                this.clamp(isNaN(temp) ? 0.5 : temp),
                yesterdayWasMigraine,
                this.clamp(isNaN(metrics.sleepHours) ? 0.6 : metrics.sleepHours),
                this.clamp(isNaN(metrics.sleepQuality) ? 0.7 : metrics.sleepQuality),
                this.clamp(isNaN(metrics.stress) ? 0.3 : metrics.stress),
                screenDuration,
                hasBreaks,
                hasBlueLight,
                calories
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
                epochs: 50, // Reduced epochs
                shuffle: true,
                batchSize: 4,
                verbose: 0,
                validationSplit: 0.1
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
        const yesterday = new Date(Date.now() - 86400000).toISOString().split('T')[0];
        let garminData = await this.loadGarminData(yesterday);

        // If not found, try to get the absolute latest available data
        if (!garminData) {
            try {
                const response = await fetch('/api/garmin/latest');
                if (response.ok) {
                    const result = await response.json();
                    const dataDate = new Date(result.date).getTime();
                    const threeDaysAgo = Date.now() - (3 * 86400000);
                    if (dataDate > threeDaysAgo) {
                        garminData = result.data;
                    }
                }
            } catch (e) {
                console.error("Failed to fetch latest Garmin data fallback", e);
            }
        }

        // Features 5-7: Garmin data or defaults
        const metrics = this.extractGarminMetrics(garminData);

        // Features 8-10: Screen time data (use today's data for tomorrow's prediction)
        const screenTime = this.getScreenTimeForDate(entries, today);
        const screenDuration = this.clamp(screenTime.duration / 16);
        const hasBreaks = screenTime.hasBreaks ? 1 : 0;
        const hasBlueLight = screenTime.hasBlueLight ? 1 : 0;

        // Feature 11: Daily calories (use today's data)
        const calorieData = this.getCaloriesForDate(entries, today);
        const calories = this.clamp(calorieData.calories / 3000);

        // Build feature vector with all 11 features
        const features = [
            this.clamp(isNaN(daysSinceLast) ? 0 : daysSinceLast / 30),
            this.clamp(isNaN(pressure) ? 0.63 : pressure),
            this.clamp(isNaN(temp) ? 0.5 : temp),
            isMigraineToday,
            this.clamp(isNaN(metrics.sleepHours) ? 0.6 : metrics.sleepHours),
            this.clamp(isNaN(metrics.sleepQuality) ? 0.7 : metrics.sleepQuality),
            this.clamp(isNaN(metrics.stress) ? 0.3 : metrics.stress),
            screenDuration,
            hasBreaks,
            hasBlueLight,
            calories
        ];

        const input = tf.tensor2d([features]);

        const prediction = this.model.predict(input) as tf.Tensor;
        let probability = (await prediction.data())[0];

        input.dispose();
        prediction.dispose();

        // Clamp probability to avoid unrealistic 100% certainty
        probability = Math.min(0.95, Math.max(0.05, probability));

        // Determine contributing factors with enhanced analysis
        const factors = [];
        if (daysSinceLast > 14) factors.push("Cycle long détecté");
        if (pressure < 0.5) factors.push("Basse pression");
        if (isMigraineToday) factors.push("Suite de crise");

        // Garmin factors
        if (garminData) {
            if (metrics.sleepHours < 0.5) factors.push("Sommeil insuffisant");
            if (metrics.sleepQuality < 0.6) factors.push("Mauvaise qualité de sommeil");
            if (metrics.stress > 0.6) factors.push("Stress élevé");
        }

        // Screen time factors
        if (screenTime.hasData) {
            if (screenTime.duration > 8) factors.push("Temps d'écran élevé");
            if (!screenTime.hasBreaks && screenTime.duration > 4) factors.push("Pas de pauses régulières");
            if (!screenTime.hasBlueLight && screenTime.duration > 6) factors.push("Pas de filtre lumière bleue");
        }

        // Calorie factors
        if (calorieData.hasData) {
            if (calorieData.calories < 1200) factors.push("Apport calorique faible");
            if (calorieData.calories > 2500) factors.push("Apport calorique élevé");
        }

        return {
            probability: isNaN(probability) ? 0 : probability,
            confidence: Math.min(entries.length / 20, 1) * (this.useGarminData ? 1.2 : 1),
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
