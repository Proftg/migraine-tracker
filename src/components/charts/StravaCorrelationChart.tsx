"use client";

import { Bar } from 'react-chartjs-2';
import {
    Chart as ChartJS,
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend
} from 'chart.js';

ChartJS.register(
    CategoryScale,
    LinearScale,
    BarElement,
    Title,
    Tooltip,
    Legend
);

interface StravaCorrelationChartProps {
    data: {
        correlationByIntensity: {
            range: string;
            totalActivities: number;
            migrainesAfter: number;
            riskPercentage: number;
        }[];
    };
}

export function StravaCorrelationChart({ data }: StravaCorrelationChartProps) {
    const chartData = {
        labels: data.correlationByIntensity.map(d => d.range),
        datasets: [
            {
                label: 'Activités totales',
                data: data.correlationByIntensity.map(d => d.totalActivities),
                backgroundColor: 'rgba(59, 130, 246, 0.5)',
                borderColor: 'rgb(59, 130, 246)',
                borderWidth: 1
            },
            {
                label: 'Migraines après activité',
                data: data.correlationByIntensity.map(d => d.migrainesAfter),
                backgroundColor: 'rgba(239, 68, 68, 0.5)',
                borderColor: 'rgb(239, 68, 68)',
                borderWidth: 1
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
                    afterBody: (context: any) => {
                        const index = context[0].dataIndex;
                        const risk = data.correlationByIntensity[index].riskPercentage;
                        return `Risque: ${risk.toFixed(1)}%`;
                    }
                }
            }
        },
        scales: {
            y: {
                beginAtZero: true,
                title: {
                    display: true,
                    text: 'Nombre'
                }
            },
            x: {
                title: {
                    display: true,
                    text: 'Intensité (Suffer Score)'
                }
            }
        }
    };

    return <Bar data={chartData} options={options} />;
}
