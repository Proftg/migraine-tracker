import { JournalEntry, MigraineEntry, ActivityEntry } from '@/types';
import { differenceInDays, differenceInHours, startOfDay, startOfWeek, startOfMonth, format } from 'date-fns';

export interface AnalyticsStats {
    totalMigraines: number;
    averageIntensity: number;
    averageDuration: number;
    mostCommonLocation: string;
    mostCommonSymptoms: string[];
    migraineFreeDays: number;
}

export interface TriggerCorrelation {
    withTrigger: number;
    withoutTrigger: number;
    averageIntensityWithTrigger: number;
    averageIntensityWithoutTrigger: number;
    riskIncrease: number; // Percentage
}

export interface SportsAnalysis {
    migrainesAfterSports: number;
    migrainesWithoutSports: number;
    riskBySportType: { sport: string; count: number; avgIntensity: number }[];
    hydrationImpact: TriggerCorrelation;
    warmupImpact: TriggerCorrelation;
    exertionCorrelation: { level: number; count: number }[];
}

export interface ScreenTimeAnalysis {
    riskByDuration: { range: string; count: number; percentage: number }[];
    breaksImpact: TriggerCorrelation;
    averageScreenTimeBeforeCrisis: number;
    criticalThreshold: number; // Hours
}

export interface StressAnalysis {
    correlation: { stressLevel: number; migraineCount: number }[];
    averageStressOnMigraineDays: number;
    averageStressOnNormalDays: number;
    letDownEffect: number; // Count of migraines after stress reduction
}

export interface CalorieAnalysis {
    averageDailyIntake: number;
    averageDailyBurn: number;
    intakeCorrelation: { range: string; migraineCount: number; totalDays: number; risk: number }[];
    burnCorrelation: { range: string; migraineCount: number; totalDays: number; risk: number }[];
    netCalorieImpact: TriggerCorrelation; // Deficit vs Surplus
}

export const analytics = {
    // Basic Statistics
    getBasicStats: (entries: JournalEntry[], dateRange?: { start: Date; end: Date }): AnalyticsStats => {
        let migraines = entries.filter(e => e.type === 'migraine') as MigraineEntry[];

        if (dateRange) {
            migraines = migraines.filter(m => {
                const date = new Date(m.date);
                return date >= dateRange.start && date <= dateRange.end;
            });
        }

        if (migraines.length === 0) {
            return {
                totalMigraines: 0,
                averageIntensity: 0,
                averageDuration: 0,
                mostCommonLocation: 'N/A',
                mostCommonSymptoms: [],
                migraineFreeDays: 0
            };
        }

        const totalIntensity = migraines.reduce((sum, m) => sum + m.intensity, 0);
        const totalDuration = migraines.reduce((sum, m) => sum + (m.duration || 0), 0);
        const migrainesWithDuration = migraines.filter(m => m.duration).length;

        // Most common location
        const locationCounts: Record<string, number> = {};
        migraines.forEach(m => {
            if (m.painLocation) {
                locationCounts[m.painLocation] = (locationCounts[m.painLocation] || 0) + 1;
            }
        });
        const mostCommonLocation = Object.keys(locationCounts).length > 0
            ? Object.entries(locationCounts).sort((a, b) => b[1] - a[1])[0][0]
            : 'N/A';

        // Most common symptoms
        const symptomCounts: Record<string, number> = {};
        migraines.forEach(m => {
            m.symptoms?.forEach(s => {
                symptomCounts[s] = (symptomCounts[s] || 0) + 1;
            });
        });
        const mostCommonSymptoms = Object.entries(symptomCounts)
            .sort((a, b) => b[1] - a[1])
            .slice(0, 3)
            .map(([symptom]) => symptom);

        return {
            totalMigraines: migraines.length,
            averageIntensity: totalIntensity / migraines.length,
            averageDuration: migrainesWithDuration > 0 ? totalDuration / migrainesWithDuration : 0,
            mostCommonLocation,
            mostCommonSymptoms,
            mostCommonSymptoms,
            migraineFreeDays: 0 // Will calculate based on date range
        };
    },

    // Frequency Analysis
    getFrequencyByPeriod: (entries: JournalEntry[], period: 'day' | 'week' | 'month', dateRange?: { start: Date; end: Date }) => {
        let migraines = entries.filter(e => e.type === 'migraine') as MigraineEntry[];

        if (dateRange) {
            migraines = migraines.filter(m => {
                const date = new Date(m.date);
                return date >= dateRange.start && date <= dateRange.end;
            });
        }

        const grouped: Record<string, number> = {};

        migraines.forEach(m => {
            const date = new Date(m.date);
            let key: string;

            if (period === 'day') {
                key = format(startOfDay(date), 'yyyy-MM-dd');
            } else if (period === 'week') {
                key = format(startOfWeek(date), 'yyyy-MM-dd');
            } else {
                key = format(startOfMonth(date), 'yyyy-MM');
            }

            grouped[key] = (grouped[key] || 0) + 1;
        });

        return Object.entries(grouped)
            .map(([date, count]) => ({ date, count }))
            .sort((a, b) => a.date.localeCompare(b.date));
    },

    // Sports Analysis
    getSportsAnalysis: (entries: JournalEntry[]): SportsAnalysis => {
        const migraines = entries.filter(e => e.type === 'migraine') as MigraineEntry[];
        const activities = entries.filter(e => e.type === 'activity') as ActivityEntry[];

        let migrainesAfterSports = 0;
        let totalIntensityAfterSports = 0;
        const sportTypeCounts: Record<string, { count: number; totalIntensity: number }> = {};

        migraines.forEach(migraine => {
            const migraineDate = new Date(migraine.date);

            // Check if there was sports activity in the 24 hours before migraine
            const recentActivity = activities.find(activity => {
                const activityDate = new Date(activity.date);
                const hoursDiff = differenceInHours(migraineDate, activityDate);
                return hoursDiff >= 0 && hoursDiff <= 24;
            });

            if (recentActivity) {
                migrainesAfterSports++;
                totalIntensityAfterSports += migraine.intensity;

                const sportType = recentActivity.activityType;
                if (!sportTypeCounts[sportType]) {
                    sportTypeCounts[sportType] = { count: 0, totalIntensity: 0 };
                }
                sportTypeCounts[sportType].count++;
                sportTypeCounts[sportType].totalIntensity += migraine.intensity;
            }
        });

        const migrainesWithoutSports = migraines.length - migrainesAfterSports;
        const avgIntensityWithSports = migrainesAfterSports > 0 ? totalIntensityAfterSports / migrainesAfterSports : 0;
        const avgIntensityWithoutSports = migrainesWithoutSports > 0
            ? (migraines.reduce((sum, m) => sum + m.intensity, 0) - totalIntensityAfterSports) / migrainesWithoutSports
            : 0;

        const riskBySportType = Object.entries(sportTypeCounts).map(([sport, data]) => ({
            sport,
            count: data.count,
            avgIntensity: data.totalIntensity / data.count
        })).sort((a, b) => b.count - a.count);

        // Hydration impact
        const activitiesWithHydration = activities.filter(a => a.hydrationLevel === 'high');
        const migrainesAfterGoodHydration = migraines.filter(m => {
            const migraineDate = new Date(m.date);
            return activitiesWithHydration.some(a => {
                const activityDate = new Date(a.date);
                const hoursDiff = differenceInHours(migraineDate, activityDate);
                return hoursDiff >= 0 && hoursDiff <= 24;
            });
        }).length;

        const hydrationImpact: TriggerCorrelation = {
            withTrigger: migrainesAfterSports - migrainesAfterGoodHydration,
            withoutTrigger: migrainesAfterGoodHydration,
            averageIntensityWithTrigger: 0,
            averageIntensityWithoutTrigger: 0,
            riskIncrease: 0
        };

        // Warmup impact
        const activitiesWithWarmup = activities.filter(a => (a.warmupDuration || 0) >= 5);
        const migrainesAfterWarmup = migraines.filter(m => {
            const migraineDate = new Date(m.date);
            return activitiesWithWarmup.some(a => {
                const activityDate = new Date(a.date);
                const hoursDiff = differenceInHours(migraineDate, activityDate);
                return hoursDiff >= 0 && hoursDiff <= 24;
            });
        }).length;

        const warmupImpact: TriggerCorrelation = {
            withTrigger: migrainesAfterSports - migrainesAfterWarmup,
            withoutTrigger: migrainesAfterWarmup,
            averageIntensityWithTrigger: 0,
            averageIntensityWithoutTrigger: 0,
            riskIncrease: 0
        };

        return {
            migrainesAfterSports,
            migrainesWithoutSports,
            riskBySportType,
            hydrationImpact,
            warmupImpact,
            exertionCorrelation: []
        };
    },

    // Screen Time Analysis
    getScreenTimeAnalysis: (entries: JournalEntry[]): ScreenTimeAnalysis => {
        const migraines = entries.filter(e => e.type === 'migraine') as MigraineEntry[];
        const screenTimeEntries = entries.filter(e => e.type === 'screentime') as any[]; // Cast to any to access ScreenTimeEntry props

        // If no dedicated screen time entries, fallback to legacy migraine.screenTimeBeforeCrisis
        if (screenTimeEntries.length === 0) {
            const migrainesWithScreenData = migraines.filter(m => m.screenTimeBeforeCrisis !== undefined);

            const ranges = [
                { range: '0-2h', min: 0, max: 2 },
                { range: '2-4h', min: 2, max: 4 },
                { range: '4-6h', min: 4, max: 6 },
                { range: '6-8h', min: 6, max: 8 },
                { range: '8h+', min: 8, max: Infinity }
            ];

            const riskByDuration = ranges.map(({ range, min, max }) => {
                const count = migrainesWithScreenData.filter(m =>
                    m.screenTimeBeforeCrisis! >= min && m.screenTimeBeforeCrisis! < max
                ).length;
                const percentage = migrainesWithScreenData.length > 0
                    ? (count / migrainesWithScreenData.length) * 100
                    : 0;
                return { range, count, percentage };
            });

            const migrainesWithBreaks = migrainesWithScreenData.filter(m => m.hadBreaks).length;
            const migrainesWithoutBreaks = migrainesWithScreenData.length - migrainesWithBreaks;

            const breaksImpact: TriggerCorrelation = {
                withTrigger: migrainesWithoutBreaks,
                withoutTrigger: migrainesWithBreaks,
                averageIntensityWithTrigger: 0,
                averageIntensityWithoutTrigger: 0,
                riskIncrease: migrainesWithBreaks > 0
                    ? ((migrainesWithoutBreaks - migrainesWithBreaks) / migrainesWithBreaks) * 100
                    : 0
            };

            const averageScreenTimeBeforeCrisis = migrainesWithScreenData.length > 0
                ? migrainesWithScreenData.reduce((sum, m) => sum + (m.screenTimeBeforeCrisis || 0), 0) / migrainesWithScreenData.length
                : 0;

            return {
                riskByDuration,
                breaksImpact,
                averageScreenTimeBeforeCrisis,
                criticalThreshold: 6
            };
        }

        // New Logic using ScreenTimeEntry
        const ranges = [
            { range: '0-4h', min: 0, max: 4 },
            { range: '4-6h', min: 4, max: 6 },
            { range: '6-8h', min: 6, max: 8 },
            { range: '8-10h', min: 8, max: 10 },
            { range: '10h+', min: 10, max: Infinity }
        ];

        const riskByDuration = ranges.map(({ range, min, max }) => {
            let daysInRange = 0;
            let migrainesInRange = 0;

            screenTimeEntries.forEach((entry: any) => {
                if (entry.duration >= min && entry.duration < max) {
                    daysInRange++;
                    const entryDate = new Date(entry.date).toDateString();
                    // Check if migraine occurred on the same day or next day
                    const hasMigraine = migraines.some(m => {
                        const mDate = new Date(m.date);
                        const diff = differenceInHours(mDate, new Date(entry.date));
                        return diff >= 0 && diff <= 24;
                    });
                    if (hasMigraine) migrainesInRange++;
                }
            });

            const percentage = daysInRange > 0 ? (migrainesInRange / daysInRange) * 100 : 0;
            return { range, count: migrainesInRange, percentage };
        });

        // Breaks impact (using breakFrequency)
        // Assume breakFrequency < 120 mins is "good"
        let daysWithBreaks = 0;
        let migrainesWithBreaks = 0;
        let daysWithoutBreaks = 0;
        let migrainesWithoutBreaks = 0;

        screenTimeEntries.forEach((entry: any) => {
            const hasGoodBreaks = entry.breakFrequency && entry.breakFrequency <= 120;
            const entryDate = new Date(entry.date).toDateString();
            const hasMigraine = migraines.some(m => {
                const mDate = new Date(m.date);
                const diff = differenceInHours(mDate, new Date(entry.date));
                return diff >= 0 && diff <= 24;
            });

            if (hasGoodBreaks) {
                daysWithBreaks++;
                if (hasMigraine) migrainesWithBreaks++;
            } else {
                daysWithoutBreaks++;
                if (hasMigraine) migrainesWithoutBreaks++;
            }
        });

        const riskWithBreaks = daysWithBreaks > 0 ? (migrainesWithBreaks / daysWithBreaks) : 0;
        const riskWithoutBreaks = daysWithoutBreaks > 0 ? (migrainesWithoutBreaks / daysWithoutBreaks) : 0;

        const breaksImpact: TriggerCorrelation = {
            withTrigger: migrainesWithoutBreaks,
            withoutTrigger: migrainesWithBreaks,
            averageIntensityWithTrigger: 0,
            averageIntensityWithoutTrigger: 0,
            riskIncrease: riskWithBreaks > 0
                ? ((riskWithoutBreaks - riskWithBreaks) / riskWithBreaks) * 100
                : 0
        };

        const averageScreenTimeBeforeCrisis = screenTimeEntries.reduce((sum: number, e: any) => sum + e.duration, 0) / screenTimeEntries.length;

        return {
            riskByDuration,
            breaksImpact,
            averageScreenTimeBeforeCrisis,
            criticalThreshold: 6
        };
    },

    // Stress Analysis
    getStressAnalysis: (entries: JournalEntry[]): StressAnalysis => {
        const migraines = entries.filter(e => e.type === 'migraine') as MigraineEntry[];
        const migrainesWithStress = migraines.filter(m => m.stressLevel !== undefined);

        const correlation = Array.from({ length: 10 }, (_, i) => {
            const level = i + 1;
            const count = migrainesWithStress.filter(m => m.stressLevel === level).length;
            return { stressLevel: level, migraineCount: count };
        });

        const averageStressOnMigraineDays = migrainesWithStress.length > 0
            ? migrainesWithStress.reduce((sum, m) => sum + (m.stressLevel || 0), 0) / migrainesWithStress.length
            : 0;

        return {
            correlation,
            averageStressOnMigraineDays,
            averageStressOnNormalDays: 0, // Would need all daily entries to calculate
            letDownEffect: 0 // Would need sequential stress tracking to detect
        };
    },

    // Medication Effectiveness
    getMedicationEffectiveness: (entries: JournalEntry[]) => {
        const migraines = entries.filter(e => e.type === 'migraine') as MigraineEntry[];

        let withMedicationCount = 0;
        let withoutMedicationCount = 0;
        let totalReliefTime = 0;
        let reliefCount = 0;

        const medicationTypes: Record<string, { count: number; totalRelief: number; reliefCount: number; successCount: number }> = {};

        migraines.forEach(m => {
            const hasAttempts = m.medicationAttempts && m.medicationAttempts.length > 0;
            const hasLegacy = !!m.medicationName;

            if (hasAttempts) {
                withMedicationCount++;
                m.medicationAttempts!.forEach(attempt => {
                    const name = attempt.medicationName;
                    if (!medicationTypes[name]) {
                        medicationTypes[name] = { count: 0, totalRelief: 0, reliefCount: 0, successCount: 0 };
                    }
                    medicationTypes[name].count++;

                    if (attempt.reliefAchieved) {
                        medicationTypes[name].successCount++;
                        if (attempt.reliefDuration) {
                            medicationTypes[name].totalRelief += attempt.reliefDuration;
                            medicationTypes[name].reliefCount++;
                            totalReliefTime += attempt.reliefDuration;
                            reliefCount++;
                        }
                    }
                });
            } else if (hasLegacy) {
                withMedicationCount++;
                const name = m.medicationName!;
                if (!medicationTypes[name]) {
                    medicationTypes[name] = { count: 0, totalRelief: 0, reliefCount: 0, successCount: 0 };
                }
                medicationTypes[name].count++;

                if (m.reliefDuration) {
                    medicationTypes[name].totalRelief += m.reliefDuration;
                    medicationTypes[name].reliefCount++;
                    totalReliefTime += m.reliefDuration;
                    reliefCount++;
                    medicationTypes[name].successCount++; // Assume relief duration implies some success
                }
            } else {
                withoutMedicationCount++;
            }
        });

        const avgReliefTime = reliefCount > 0 ? totalReliefTime / reliefCount : 0;

        const byMedication = Object.entries(medicationTypes).map(([name, data]) => ({
            name,
            count: data.count,
            avgReliefTime: data.reliefCount > 0 ? data.totalRelief / data.reliefCount : 0,
            successRate: data.count > 0 ? data.successCount / data.count : 0
        }));

        return {
            withMedication: withMedicationCount,
            withoutMedication: withoutMedicationCount,
            avgReliefTime,
            byMedication
        };
    },

    // Before/After Treatment Analysis
    getBeforeAfterAnalysis: (entries: JournalEntry[]) => {
        const treatments = entries.filter(e => e.type === 'treatment' && (e as any).isPreventive);

        if (treatments.length === 0) return null;

        // Use first treatment as baseline
        const firstTreatment = treatments.sort((a, b) =>
            new Date(a.date).getTime() - new Date(b.date).getTime()
        )[0];

        const treatmentDate = new Date(firstTreatment.date);
        const migraines = entries.filter(e => e.type === 'migraine') as MigraineEntry[];

        const before = migraines.filter(m => new Date(m.date) < treatmentDate);
        const after = migraines.filter(m => new Date(m.date) >= treatmentDate);

        // Calculate days in each period
        const today = new Date();
        const daysBeforeTreatment = before.length > 0
            ? differenceInDays(treatmentDate, new Date(before[0].date))
            : 0;
        const daysAfterTreatment = differenceInDays(today, treatmentDate);

        // Calculate stats for before period
        const beforeStats = {
            totalMigraines: before.length,
            averageIntensity: before.length > 0
                ? before.reduce((sum, m) => sum + m.intensity, 0) / before.length
                : 0,
            averageDuration: before.filter(m => m.duration).length > 0
                ? before.reduce((sum, m) => sum + (m.duration || 0), 0) / before.filter(m => m.duration).length
                : 0,
            migrainesPerMonth: daysBeforeTreatment > 0
                ? (before.length / daysBeforeTreatment) * 30
                : 0
        };

        // Calculate stats for after period
        const afterStats = {
            totalMigraines: after.length,
            averageIntensity: after.length > 0
                ? after.reduce((sum, m) => sum + m.intensity, 0) / after.length
                : 0,
            averageDuration: after.filter(m => m.duration).length > 0
                ? after.reduce((sum, m) => sum + (m.duration || 0), 0) / after.filter(m => m.duration).length
                : 0,
            migrainesPerMonth: daysAfterTreatment > 0
                ? (after.length / daysAfterTreatment) * 30
                : 0
        };

        // Calculate improvements
        const improvement = {
            frequencyReduction: beforeStats.migrainesPerMonth > 0
                ? ((beforeStats.migrainesPerMonth - afterStats.migrainesPerMonth) / beforeStats.migrainesPerMonth) * 100
                : 0,
            intensityReduction: beforeStats.averageIntensity > 0
                ? ((beforeStats.averageIntensity - afterStats.averageIntensity) / beforeStats.averageIntensity) * 100
                : 0,
            durationReduction: beforeStats.averageDuration > 0
                ? ((beforeStats.averageDuration - afterStats.averageDuration) / beforeStats.averageDuration) * 100
                : 0
        };

        return {
            beforeTreatment: beforeStats,
            afterTreatment: afterStats,
            improvement,
            treatmentStartDate: firstTreatment.date,
            daysOnTreatment: daysAfterTreatment
        };
    },

    // Calorie Analysis
    getCalorieAnalysis: (entries: JournalEntry[]): CalorieAnalysis => {
        const migraines = entries.filter(e => e.type === 'migraine') as MigraineEntry[];
        const calorieEntries = entries.filter(e => e.type === 'calories') as any[];
        const activityEntries = entries.filter(e => e.type === 'activity') as ActivityEntry[];

        // Helper to get daily stats
        const getDailyStats = (date: Date) => {
            const dayStr = date.toDateString();
            const intake = calorieEntries.find(e => new Date(e.date).toDateString() === dayStr)?.totalCalories || 0;
            const burn = activityEntries
                .filter(e => new Date(e.date).toDateString() === dayStr)
                .reduce((sum, e) => sum + (e.caloriesBurned || 0), 0);
            return { intake, burn, net: intake - burn };
        };

        // Calculate averages
        const totalIntake = calorieEntries.reduce((sum, e) => sum + e.totalCalories, 0);
        const totalBurn = activityEntries.reduce((sum, e) => sum + (e.caloriesBurned || 0), 0);
        const uniqueDays = new Set(entries.map(e => new Date(e.date).toDateString())).size || 1;

        const averageDailyIntake = Math.round(totalIntake / (calorieEntries.length || 1));
        const averageDailyBurn = Math.round(totalBurn / uniqueDays);

        // Analyze correlations
        const intakeRanges = [
            { min: 0, max: 1500, label: '< 1500' },
            { min: 1500, max: 2000, label: '1500-2000' },
            { min: 2000, max: 2500, label: '2000-2500' },
            { min: 2500, max: 9999, label: '> 2500' }
        ];

        const intakeCorrelation = intakeRanges.map(range => {
            let daysInRange = 0;
            let migrainesInRange = 0;

            // Iterate through all days with calorie data
            calorieEntries.forEach(entry => {
                if (entry.totalCalories >= range.min && entry.totalCalories < range.max) {
                    daysInRange++;
                    const entryDate = new Date(entry.date).toDateString();
                    const hasMigraine = migraines.some(m => new Date(m.date).toDateString() === entryDate);
                    if (hasMigraine) migrainesInRange++;
                }
            });

            return {
                range: range.label,
                migraineCount: migrainesInRange,
                totalDays: daysInRange,
                risk: daysInRange > 0 ? Math.round((migrainesInRange / daysInRange) * 100) : 0
            };
        });

        // Burn correlation (High burn vs Low burn)
        const burnRanges = [
            { min: 0, max: 300, label: 'Faible (<300)' },
            { min: 300, max: 600, label: 'Modéré (300-600)' },
            { min: 600, max: 9999, label: 'Intense (>600)' }
        ];

        const burnCorrelation = burnRanges.map(range => {
            let daysInRange = 0;
            let migrainesInRange = 0;

            // We need to group activities by day first
            const activitiesByDay = new Map<string, number>();
            activityEntries.forEach(e => {
                const day = new Date(e.date).toDateString();
                activitiesByDay.set(day, (activitiesByDay.get(day) || 0) + (e.caloriesBurned || 0));
            });

            activitiesByDay.forEach((burn, day) => {
                if (burn >= range.min && burn < range.max) {
                    daysInRange++;
                    const hasMigraine = migraines.some(m => new Date(m.date).toDateString() === day);
                    if (hasMigraine) migrainesInRange++;
                }
            });

            return {
                range: range.label,
                migraineCount: migrainesInRange,
                totalDays: daysInRange,
                risk: daysInRange > 0 ? Math.round((migrainesInRange / daysInRange) * 100) : 0
            };
        });

        // Net Calorie Impact (Deficit vs Surplus)
        let deficitDays = 0;
        let surplusDays = 0;
        let migrainesOnDeficit = 0;
        let migrainesOnSurplus = 0;

        // Group calories by day
        const caloriesByDay = new Map<string, number>();
        calorieEntries.forEach(e => {
            const day = new Date(e.date).toDateString();
            caloriesByDay.set(day, e.totalCalories);
        });

        // Group burn by day
        const burnByDay = new Map<string, number>();
        activityEntries.forEach(e => {
            const day = new Date(e.date).toDateString();
            burnByDay.set(day, (burnByDay.get(day) || 0) + (e.caloriesBurned || 0));
        });

        caloriesByDay.forEach((intake, day) => {
            const burn = burnByDay.get(day) || 0;
            const net = intake - burn;
            const hasMigraine = migraines.some(m => new Date(m.date).toDateString() === day);

            if (net < 0) {
                deficitDays++;
                if (hasMigraine) migrainesOnDeficit++;
            } else {
                surplusDays++;
                if (hasMigraine) migrainesOnSurplus++;
            }
        });

        const netCalorieImpact: TriggerCorrelation = {
            withTrigger: migrainesOnDeficit,
            withoutTrigger: migrainesOnSurplus,
            averageIntensityWithTrigger: 0,
            averageIntensityWithoutTrigger: 0,
            riskIncrease: surplusDays > 0 && deficitDays > 0
                ? ((migrainesOnDeficit / deficitDays) - (migrainesOnSurplus / surplusDays)) / (migrainesOnSurplus / surplusDays) * 100
                : 0
        };

        return {
            averageDailyIntake,
            averageDailyBurn,
            intakeCorrelation,
            burnCorrelation,
            netCalorieImpact
        };
    }
};
