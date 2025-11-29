import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { format } from 'date-fns';

interface FrequencyTrendChartProps {
    data: {
        date: string;
        count: number;
    }[];
}

export function FrequencyTrendChart({ data }: FrequencyTrendChartProps) {
    const chartData = data.map(item => ({
        date: format(new Date(item.date), 'dd/MM'),
        crises: item.count
    }));

    return (
        <div className="w-full h-[400px]">
            <h3 className="text-lg font-semibold mb-4">Évolution de la Fréquence des Crises</h3>
            <ResponsiveContainer width="100%" height="100%">
                <LineChart data={chartData} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
                    <CartesianGrid strokeDasharray="3 3" className="stroke-muted" />
                    <XAxis dataKey="date" className="text-sm" />
                    <YAxis className="text-sm" label={{ value: 'Nombre de crises', angle: -90, position: 'insideLeft' }} />
                    <Tooltip
                        contentStyle={{
                            backgroundColor: 'hsl(var(--background))',
                            border: '1px solid hsl(var(--border))',
                            borderRadius: '8px'
                        }}
                    />
                    <Legend />
                    <Line
                        type="monotone"
                        dataKey="crises"
                        stroke="hsl(var(--primary))"
                        strokeWidth={3}
                        dot={{ fill: 'hsl(var(--primary))', r: 5 }}
                        activeDot={{ r: 8 }}
                    />
                </LineChart>
            </ResponsiveContainer>
        </div>
    );
}
