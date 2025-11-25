"use client";

import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, Cell } from 'recharts';

interface BeforeAfterChartProps {
    data: {
        beforeTreatment: {
            migrainesPerMonth: number;
            averageIntensity: number;
            averageDuration: number;
        };
        afterTreatment: {
            migrainesPerMonth: number;
            averageIntensity: number;
            averageDuration: number;
        };
        improvement: {
            frequencyReduction: number;
            intensityReduction: number;
            durationReduction: number;
        };
    };
}

export function BeforeAfterChart({ data }: BeforeAfterChartProps) {
    const chartData = [
        {
            metric: 'Fréquence\n(crises/mois)',
            'Avant traitement': Number(data.beforeTreatment.migrainesPerMonth.toFixed(1)),
            'Après traitement': Number(data.afterTreatment.migrainesPerMonth.toFixed(1)),
            improvement: data.improvement.frequencyReduction
        },
        {
            metric: 'Intensité\nmoyenne (/10)',
            'Avant traitement': Number(data.beforeTreatment.averageIntensity.toFixed(1)),
            'Après traitement': Number(data.afterTreatment.averageIntensity.toFixed(1)),
            improvement: data.improvement.intensityReduction
        },
        {
            metric: 'Durée\nmoyenne (min)',
            'Avant traitement': Number(data.beforeTreatment.averageDuration.toFixed(0)),
            'Après traitement': Number(data.afterTreatment.averageDuration.toFixed(0)),
            improvement: data.improvement.durationReduction
        }
    ];

    return (
        <div className="w-full space-y-4">
            <ResponsiveContainer width="100%" height={400}>
                <BarChart data={chartData} margin={{ top: 20, right: 30, left: 20, bottom: 60 }}>
                    <CartesianGrid strokeDasharray="3 3" opacity={0.3} />
                    <XAxis
                        dataKey="metric"
                        tick={{ fontSize: 12 }}
                        interval={0}
                    />
                    <YAxis tick={{ fontSize: 12 }} />
                    <Tooltip
                        contentStyle={{
                            backgroundColor: 'hsl(var(--card))',
                            border: '1px solid hsl(var(--border))',
                            borderRadius: '8px'
                        }}
                    />
                    <Legend
                        wrapperStyle={{ paddingTop: '20px' }}
                        iconType="circle"
                    />
                    <Bar
                        dataKey="Avant traitement"
                        fill="#ef4444"
                        radius={[8, 8, 0, 0]}
                        maxBarSize={80}
                    />
                    <Bar
                        dataKey="Après traitement"
                        fill="#10b981"
                        radius={[8, 8, 0, 0]}
                        maxBarSize={80}
                    />
                </BarChart>
            </ResponsiveContainer>

            {/* Improvement Summary */}
            <div className="grid grid-cols-3 gap-4 mt-6">
                {chartData.map((item, index) => (
                    <div key={index} className="text-center p-4 rounded-lg bg-muted">
                        <div className={`text-2xl font-bold ${item.improvement > 0 ? 'text-green-600' : 'text-red-600'}`}>
                            {item.improvement > 0 ? '-' : '+'}{Math.abs(item.improvement).toFixed(0)}%
                        </div>
                        <div className="text-xs text-muted-foreground mt-1">
                            {item.metric.replace('\n', ' ')}
                        </div>
                    </div>
                ))}
            </div>
        </div>
    );
}
