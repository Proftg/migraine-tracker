"use client";

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { StravaEvolutionChart } from "@/components/charts/StravaEvolutionChart";
import { StravaCorrelationChart } from "@/components/charts/StravaCorrelationChart";
import { GarminHealthChart } from "@/components/charts/GarminHealthChart";
import { useState, useEffect } from "react";
import { JournalEntry } from "@/types";
import { analytics } from "@/lib/analytics";

interface HealthMetricsReportProps {
    entries: JournalEntry[];
}

export function HealthMetricsReport({ entries }: HealthMetricsReportProps) {
    const [garminMetrics, setGarminMetrics] = useState<any[]>([]);
    const [garminAnalysis, setGarminAnalysis] = useState<any>(null);

    useEffect(() => {
        // Load Garmin metrics
        fetch('/api/garmin/metrics')
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    setGarminMetrics(data.data);
                }
            });

        // Load Garmin analysis
        analytics.getGarminHealthAnalysis().then(setGarminAnalysis);
    }, []);

    const stravaAnalysis = analytics.getStravaAnalysis(entries);

    return (
        <>
            {/* Strava Training Load Analysis */}
            {stravaAnalysis.activitiesWithSufferScore > 0 && (
                <Card className="mb-8 border-orange-500/30 bg-gradient-to-br from-orange-500/5 to-red-500/5">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            🔥 Analyse de la Charge d'Entraînement (Strava)
                        </CardTitle>
                        <CardDescription>
                            Corrélation entre l'intensité des activités et les migraines
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-6">
                        {/* Summary Stats */}
                        <div className="grid grid-cols-3 gap-6">
                            <div className="text-center p-4 rounded-lg bg-white border">
                                <div className="text-3xl font-bold text-orange-600">
                                    {stravaAnalysis.avgScoreOnMigraineDays.toFixed(0)}
                                </div>
                                <div className="text-sm font-medium mt-2">Charge moyenne</div>
                                <div className="text-xs text-muted-foreground">Jours avec migraine</div>
                            </div>
                            <div className="text-center p-4 rounded-lg bg-white border">
                                <div className="text-3xl font-bold text-green-600">
                                    {stravaAnalysis.avgScoreOnNormalDays.toFixed(0)}
                                </div>
                                <div className="text-sm font-medium mt-2">Charge moyenne</div>
                                <div className="text-xs text-muted-foreground">Jours sans migraine</div>
                            </div>
                            <div className="text-center p-4 rounded-lg bg-white border">
                                <div className="text-3xl font-bold text-blue-600">
                                    {stravaAnalysis.activitiesWithSufferScore}
                                </div>
                                <div className="text-sm font-medium mt-2">Activités</div>
                                <div className="text-xs text-muted-foreground">Avec Suffer Score</div>
                            </div>
                        </div>

                        {/* Evolution Chart */}
                        {stravaAnalysis.sufferScoreEvolution.length > 0 && (
                            <div>
                                <h4 className="font-semibold mb-4">Évolution de la charge d'entraînement</h4>
                                <div className="min-h-[400px]">
                                    <StravaEvolutionChart data={stravaAnalysis} />
                                </div>
                                <p className="text-xs text-muted-foreground mt-2">
                                    Les points rouges indiquent les jours avec migraine
                                </p>
                            </div>
                        )}

                        {/* Correlation Chart */}
                        <div>
                            <h4 className="font-semibold mb-4">Risque de migraine par intensité d'effort</h4>
                            <div className="min-h-[400px]">
                                <StravaCorrelationChart data={stravaAnalysis} />
                            </div>
                        </div>

                        {/* Insights */}
                        <div className="p-4 bg-muted rounded-lg">
                            <h4 className="font-semibold mb-2">💡 Observations</h4>
                            <ul className="space-y-2 text-sm">
                                {stravaAnalysis.avgScoreOnMigraineDays > stravaAnalysis.avgScoreOnNormalDays * 1.2 && (
                                    <li className="flex items-start gap-2">
                                        <span className="text-orange-500">⚠️</span>
                                        <span>
                                            La charge d'entraînement est significativement plus élevée les jours avec migraine
                                            ({((stravaAnalysis.avgScoreOnMigraineDays / stravaAnalysis.avgScoreOnNormalDays - 1) * 100).toFixed(0)}% plus élevée)
                                        </span>
                                    </li>
                                )}
                                {stravaAnalysis.correlationByIntensity.find((c: any) => c.range.includes('120+') && c.riskPercentage > 50) && (
                                    <li className="flex items-start gap-2">
                                        <span className="text-red-500">🔴</span>
                                        <span>
                                            Les activités très intenses (Suffer Score 120+) présentent un risque élevé de migraine
                                        </span>
                                    </li>
                                )}
                            </ul>
                        </div>
                    </CardContent>
                </Card>
            )}

            {/* Garmin Health Data */}
            <Card className="mb-8">
                <CardHeader>
                    <CardTitle className="flex items-center gap-2">
                        ⌚ Métriques de Santé Garmin
                    </CardTitle>
                    <CardDescription>Analyse du sommeil, stress et fréquence cardiaque</CardDescription>
                </CardHeader>
                <CardContent className="space-y-6">
                    {garminAnalysis && (
                        <div className="grid grid-cols-4 gap-4 mb-6">
                            <div className="text-center p-4 rounded-lg bg-blue-50 border border-blue-200">
                                <div className="text-2xl font-bold text-blue-600">
                                    {garminAnalysis.avgSleepScore.toFixed(0)}
                                </div>
                                <div className="text-xs font-medium mt-1">Score sommeil</div>
                            </div>
                            <div className="text-center p-4 rounded-lg bg-purple-50 border border-purple-200">
                                <div className="text-2xl font-bold text-purple-600">
                                    {garminAnalysis.avgSleepHours.toFixed(1)}h
                                </div>
                                <div className="text-xs font-medium mt-1">Durée sommeil</div>
                            </div>
                            <div className="text-center p-4 rounded-lg bg-red-50 border border-red-200">
                                <div className="text-2xl font-bold text-red-600">
                                    {garminAnalysis.avgStress.toFixed(0)}
                                </div>
                                <div className="text-xs font-medium mt-1">Stress moyen</div>
                            </div>
                            <div className="text-center p-4 rounded-lg bg-green-50 border border-green-200">
                                <div className="text-2xl font-bold text-green-600">
                                    {garminAnalysis.avgRestingHR.toFixed(0)}
                                </div>
                                <div className="text-xs font-medium mt-1">FC repos</div>
                            </div>
                        </div>
                    )}

                    {garminMetrics.length > 0 && (
                        <div>
                            <h4 className="font-semibold mb-4">Évolution des métriques de santé</h4>
                            <div className="min-h-[400px]">
                                <GarminHealthChart metrics={garminMetrics} />
                            </div>
                        </div>
                    )}

                    {garminMetrics.length === 0 && (
                        <div className="text-center py-8 text-muted-foreground">
                            <p>Aucune donnée Garmin disponible</p>
                            <p className="text-sm mt-2">Synchronisez votre montre pour voir vos métriques de santé</p>
                        </div>
                    )}
                </CardContent>
            </Card>
        </>
    );
}
