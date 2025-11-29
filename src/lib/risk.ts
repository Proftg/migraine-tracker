
import { JournalEntry, MigraineEntry } from "@/types";
import { WeatherData } from "./weather";

export interface RiskFactor {
    name: string;
    impact: 'low' | 'medium' | 'high';
    description: string;
    score: number; // Contribution to total score
}

export interface RiskAssessment {
    score: number; // 0-10
    level: 'Faible' | 'Modéré' | 'Élevé' | 'Très Élevé';
    factors: RiskFactor[];
    recommendation: string;
}

export const riskService = {
    calculateRisk(entries: JournalEntry[], weather: WeatherData | null): RiskAssessment {
        let totalScore = 0;
        const factors: RiskFactor[] = [];

        // 1. Weather Analysis (Max 4 points)
        if (weather) {
            // Pressure check
            // Standard pressure is 1013 hPa. Low pressure is often a trigger.
            if (weather.pressure < 1000) {
                totalScore += 3;
                factors.push({
                    name: "Pression Atmosphérique",
                    impact: 'high',
                    description: "Basse pression détectée (< 1000 hPa), risque accru.",
                    score: 3
                });
            } else if (weather.pressure < 1010) {
                totalScore += 1;
                factors.push({
                    name: "Pression Atmosphérique",
                    impact: 'low',
                    description: "Pression légèrement basse.",
                    score: 1
                });
            }

            // Storm check (Weather codes 95-99)
            if (weather.weatherCode >= 95) {
                totalScore += 3;
                factors.push({
                    name: "Orage",
                    impact: 'high',
                    description: "Conditions orageuses détectées.",
                    score: 3
                });
            }

            // Temperature extremes
            if (weather.temperature > 30 || weather.temperature < -5) {
                totalScore += 1;
                factors.push({
                    name: "Température Extrême",
                    impact: 'medium',
                    description: "Températures extrêmes peuvent déclencher une crise.",
                    score: 1
                });
            }
        }

        // 2. History Analysis (Max 6 points)
        const migraines = entries
            .filter(e => e.type === 'migraine')
            .sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime()) as MigraineEntry[];

        if (migraines.length > 0) {
            const lastMigraine = migraines[0];
            const daysSinceLast = Math.floor((new Date().getTime() - new Date(lastMigraine.date).getTime()) / (1000 * 60 * 60 * 24));

            // Rebound risk (if medication was taken recently)
            if (daysSinceLast < 2 && lastMigraine.reliefWithMedication) {
                totalScore += 2;
                factors.push({
                    name: "Risque de Rebond",
                    impact: 'medium',
                    description: "Prise de médicaments récente, attention à l'effet rebond.",
                    score: 2
                });
            }

            // Cycle analysis (Simple version)
            // If average gap is X, and we are at day X, risk is high
            if (migraines.length >= 3) {
                // Calculate average gap
                let totalGap = 0;
                for (let i = 0; i < 3; i++) { // Look at last 3 gaps
                    if (migraines[i + 1]) {
                        const gap = (new Date(migraines[i].date).getTime() - new Date(migraines[i + 1].date).getTime()) / (1000 * 60 * 60 * 24);
                        totalGap += gap;
                    }
                }
                const avgGap = totalGap / Math.min(migraines.length - 1, 3);

                // If we are within 10% of the average gap
                if (Math.abs(daysSinceLast - avgGap) <= avgGap * 0.1) {
                    totalScore += 3;
                    factors.push({
                        name: "Cycle Migraineux",
                        impact: 'high',
                        description: `Vous approchez de votre intervalle moyen (${Math.round(avgGap)} jours).`,
                        score: 3
                    });
                }
            }
        }

        // Cap score at 10
        totalScore = Math.min(totalScore, 10);

        // Determine Level
        let level: RiskAssessment['level'] = 'Faible';
        let recommendation = "Tout semble calme. Profitez de votre journée !";

        if (totalScore >= 7) {
            level = 'Très Élevé';
            recommendation = "Risque important. Évitez vos déclencheurs connus et gardez vos médicaments à portée.";
        } else if (totalScore >= 5) {
            level = 'Élevé';
            recommendation = "Conditions favorables aux migraines. Soyez vigilant.";
        } else if (totalScore >= 3) {
            level = 'Modéré';
            recommendation = "Quelques facteurs de risque présents. Hydratez-vous bien.";
        }

        return {
            score: totalScore,
            level,
            factors,
            recommendation
        };
    }
};
