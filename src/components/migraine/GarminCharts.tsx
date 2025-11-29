"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    BarElement,
    Title,
    Tooltip,
    Legend,
    Filler
} from 'chart.js';
import { Line, Bar } from 'react-chartjs-2';
import { Activity, Moon, Heart, Zap, RefreshCw } from "lucide-react";
import { Button } from "@/components/ui/button";

ChartJS.register(
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    BarElement,
    Title,
    Tooltip,
    Legend,
    Filler
);

interface GarminMetric {
    date: string;
    sleep_score: number;
    sleep_seconds: number;
    stress_avg: number;
    resting_hr: number;
    training_load: number;
    steps: number;
}

export function GarminCharts() {
    const [metrics, setMetrics] = useState<GarminMetric[]>([]);
    const [loading, setLoading] = useState(true);
    const [syncing, setSyncing] = useState(false);

    useEffect(() => {
        fetch('/api/garmin/metrics')
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    setMetrics(data.data.reverse()); // Oldest first for charts
                }
                setLoading(false);
            })
            .catch(err => {
                console.error("Failed to load Garmin data:", err);
                setLoading(false);
            });
    }, []);

    const handleSync = async () => {
        setSyncing(true);
        try {
            const res = await fetch('/api/garmin/sync', { method: 'POST' });
            const data = await res.json();
            if (data.success) {
                // Refresh data
                const metricsRes = await fetch('/api/garmin/metrics');
                const metricsData = await metricsRes.json();
                if (metricsData.success) {
                    setMetrics(metricsData.data.reverse());
                }
            } else {
                console.error('Sync error:', data);
            }
        } catch (e) {
            console.error("Sync failed:", e);
        } finally {
            setSyncing(false);
        }
    };

    if (loading) {
        return (
            <div className="grid gap-4 md:grid-cols-2">
                {[1, 2, 3, 4].map(i => (
                    <Card key={i} className="animate-pulse">
                        <CardHeader className="h-20 bg-slate-100" />
                        <CardContent className="h-64 bg-slate-50" />
                    </Card>
                ))}
            </div>
        );
    }

    if (metrics.length === 0) {
        return (
            <Card>
                <CardContent className="py-12 text-center text-muted-foreground">
                    <Activity className="h-12 w-12 mx-auto mb-4 opacity-50" />
                    <p>Aucune donnée Garmin disponible.</p>
                    <p className="text-sm mt-2 mb-4">Exécutez la synchronisation pour importer vos données.</p>
                    <Button
                        variant="outline"
                        onClick={handleSync}
                        disabled={syncing}
                        className="gap-2"
                    >
                        <RefreshCw className={`h-4 w-4 ${syncing ? 'animate-spin' : ''}`} />
                        {syncing ? 'Synchronisation...' : 'Synchroniser maintenant'}
                    </Button>
                </CardContent>
            </Card>
        );
    }

    const dates = metrics.map(m => new Date(m.date).toLocaleDateString('fr-FR', { day: '2-digit', month: 'short' }));

    // Sleep Score Chart
    const sleepData = {
        labels: dates,
        datasets: [{
            label: 'Score de Sommeil',
            data: metrics.map(m => m.sleep_score),
            borderColor: 'rgb(59, 130, 246)',
            backgroundColor: 'rgba(59, 130, 246, 0.1)',
            fill: true,
            tension: 0.4
        }]
    };

    // Stress Chart
    const stressData = {
        labels: dates,
        datasets: [{
            label: 'Stress Moyen',
            data: metrics.map(m => m.stress_avg),
            borderColor: 'rgb(239, 68, 68)',
            backgroundColor: 'rgba(239, 68, 68, 0.1)',
            fill: true,
            tension: 0.4
        }]
    };

    // Resting HR Chart
    const hrData = {
        labels: dates,
        datasets: [{
            label: 'FC au Repos (bpm)',
            data: metrics.map(m => m.resting_hr),
            borderColor: 'rgb(236, 72, 153)',
            backgroundColor: 'rgba(236, 72, 153, 0.1)',
            fill: true,
            tension: 0.4
        }]
    };

    // Training Load Chart
    const trainingData = {
        labels: dates,
        datasets: [{
            label: 'Charge d\'Entraînement',
            data: metrics.map(m => m.training_load),
            backgroundColor: 'rgb(34, 197, 94)',
        }]
    };

    const chartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                display: false
            }
        },
        scales: {
            y: {
                beginAtZero: true
            }
        }
    };

    // Calculate averages
    const avgSleep = Math.round(metrics.reduce((sum, m) => sum + m.sleep_score, 0) / metrics.length);
    const avgStress = Math.round(metrics.reduce((sum, m) => sum + m.stress_avg, 0) / metrics.length);

    return (
        <div className="space-y-6">
            <div className="flex justify-end">
                <Button
                    variant="outline"
                    size="sm"
                    onClick={handleSync}
                    disabled={syncing}
                    className="gap-2"
                >
                    <RefreshCw className={`h-4 w-4 ${syncing ? 'animate-spin' : ''}`} />
                    {syncing ? 'Synchronisation...' : 'Synchroniser Garmin'}
                </Button>
            </div>

            {/* Summary Cards */}
            <div className="grid gap-4 md:grid-cols-2">
                <Card>
                    <CardHeader className="flex flex-row items-center justify-between pb-2">
                        <CardTitle className="text-sm font-medium">Sommeil Moyen</CardTitle>
                        <Moon className="h-4 w-4 text-blue-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{avgSleep}/100</div>
                        <p className="text-xs text-muted-foreground mt-1">
                            {avgSleep >= 70 ? "Bon" : avgSleep >= 50 ? "Moyen" : "Faible"}
                        </p>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader className="flex flex-row items-center justify-between pb-2">
                        <CardTitle className="text-sm font-medium">Stress Moyen</CardTitle>
                        <Zap className="h-4 w-4 text-red-600" />
                    </CardHeader>
                    <CardContent>
                        <div className="text-2xl font-bold">{avgStress}/100</div>
                        <p className="text-xs text-muted-foreground mt-1">
                            {avgStress <= 25 ? "Faible" : avgStress <= 50 ? "Modéré" : "Élevé"}
                        </p>
                    </CardContent>
                </Card>
            </div>

            {/* Charts */}
            <div className="grid gap-4 md:grid-cols-2">
                <Card>
                    <CardHeader>
                        <CardTitle className="text-base flex items-center gap-2">
                            <Moon className="h-5 w-5 text-blue-600" />
                            Score de Sommeil
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="h-64">
                            <Line data={sleepData} options={chartOptions} />
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader>
                        <CardTitle className="text-base flex items-center gap-2">
                            <Zap className="h-5 w-5 text-red-600" />
                            Niveau de Stress
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="h-64">
                            <Line data={stressData} options={chartOptions} />
                        </div>
                    </CardContent>
                </Card>

                <Card className="md:col-span-2">
                    <CardHeader>
                        <CardTitle className="text-base flex items-center gap-2">
                            <Activity className="h-5 w-5 text-green-600" />
                            Charge d'Entraînement
                        </CardTitle>
                    </CardHeader>
                    <CardContent>
                        <div className="h-64">
                            <Bar data={trainingData} options={chartOptions} />
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
