"use client";

import { Line } from 'react-chartjs-2';
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Legend,
    Filler
} from 'chart.js';

ChartJS.register(
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Legend,
    Filler
);

interface StravaEvolutionChartProps {
    data: {
        sufferScoreEvolution: { date: string; score: number; hasMigraine: boolean }[];
    };
}

export function StravaEvolutionChart({ data }: StravaEvolutionChartProps) {
    const chartData = {
        labels: data.sufferScoreEvolution.map(d => {
            const date = new Date(d.date);
            return date.toLocaleDateString('fr-FR', { day: '2-digit', month: 'short' });
        }),
        datasets: [
            {
                label: 'Charge d\'entraînement (Suffer Score)',
                data: data.sufferScoreEvolution.map(d => d.score),
                borderColor: 'rgb(249, 115, 22)',
                backgroundColor: 'rgba(249, 115, 22, 0.1)',
                fill: true,
                tension: 0.4,
                pointBackgroundColor: data.sufferScoreEvolution.map(d =>
                    d.hasMigraine ? 'rgb(239, 68, 68)' : 'rgb(249, 115, 22)'
                ),
                pointBorderColor: data.sufferScoreEvolution.map(d =>
                    d.hasMigraine ? 'rgb(239, 68, 68)' : 'rgb(249, 115, 22)'
                ),
                pointRadius: data.sufferScoreEvolution.map(d => d.hasMigraine ? 8 : 4),
                pointHoverRadius: 10
            }
        ]
    };

    const options = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                display: true,
                position: 'top' as const
            },
            tooltip: {
                callbacks: {
                    afterLabel: (context: any) => {
                        const index = context.dataIndex;
                        const hasMigraine = data.sufferScoreEvolution[index].hasMigraine;
                        return hasMigraine ? '🔴 Migraine ce jour' : '';
                    }
                }
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Suffer Score'
                }
            },
            x: {
                title: {
                    display: true,
                    text: 'Date'
                }
            }
        }
    };

    return <Line data={chartData} options={options} />;
}
