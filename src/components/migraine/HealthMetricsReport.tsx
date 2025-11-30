"use client";

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
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

    return (
        <>
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
