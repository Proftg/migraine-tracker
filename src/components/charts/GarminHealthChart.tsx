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
    Legend
} from 'chart.js';

ChartJS.register(
    CategoryScale,
    LinearScale,
    PointElement,
    LineElement,
    Title,
    Tooltip,
    Legend
);

interface GarminHealthChartProps {
    metrics: any[];
}

export function GarminHealthChart({ metrics }: GarminHealthChartProps) {
    const chartData = {
        labels: metrics.map(m => {
            const date = new Date(m.date);
            return date.toLocaleDateString('fr-FR', { day: '2-digit', month: 'short' });
        }),
        datasets: [
            {
                label: 'Score de sommeil',
                data: metrics.map(m => m.sleep_score || 0),
                borderColor: 'rgb(59, 130, 246)',
                backgroundColor: 'rgba(59, 130, 246, 0.1)',
                yAxisID: 'y',
                tension: 0.4
            },
            {
                label: 'Stress moyen',
                data: metrics.map(m => m.stress_avg || 0),
                borderColor: 'rgb(239, 68, 68)',
                backgroundColor: 'rgba(239, 68, 68, 0.1)',
                yAxisID: 'y',
                tension: 0.4
            },
            {
                label: 'FC repos',
                data: metrics.map(m => m.resting_hr || 0),
                borderColor: 'rgb(34, 197, 94)',
                backgroundColor: 'rgba(34, 197, 94, 0.1)',
                yAxisID: 'y1',
                tension: 0.4
            }
        ]
    };

    const options = {
        responsive: true,
        maintainAspectRatio: false,
        interaction: {
            mode: 'index' as const,
            intersect: false
        },
        plugins: {
            legend: {
                display: true,
                position: 'top' as const
            }
        },
        scales: {
            y: {
                type: 'linear' as const,
                display: true,
                position: 'left' as const,
                title: {
                    display: true,
                    text: 'Score (0-100)'
                },
                min: 0,
                max: 100
            },
            y1: {
                type: 'linear' as const,
                display: true,
                position: 'right' as const,
                title: {
                    display: true,
                    text: 'FC (bpm)'
                },
                grid: {
                    drawOnChartArea: false
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
