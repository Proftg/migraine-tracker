import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';

interface SportsAnalysisChartProps {
    data: {
        sport: string;
        count: number;
        avgIntensity: number;
    }[];
}

export function SportsAnalysisChart({ data }: SportsAnalysisChartProps) {
    const chartData = data.map(item => ({
        sport: item.sport,
        'Nombre de crises': item.count,
        'Intensité moyenne': item.avgIntensity
    }));

    return (
        <div className="w-full h-[400px]">
            <h3 className="text-lg font-semibold mb-4">Crises par Type de Sport</h3>
            <p className="text-sm text-muted-foreground mb-4">
                Analyse des migraines survenant après différents types d&apos;activités sportives
            </p>
            <ResponsiveContainer width="100%" height="100%">
                <BarChart data={chartData} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
                    <CartesianGrid strokeDasharray="3 3" className="stroke-muted" />
                    <XAxis dataKey="sport" className="text-sm" />
                    <YAxis
                        yAxisId="left"
                        className="text-sm"
                        label={{ value: 'Nombre de crises', angle: -90, position: 'insideLeft' }}
                    />
                    <YAxis
                        yAxisId="right"
                        orientation="right"
                        className="text-sm"
                        label={{ value: 'Intensité (1-10)', angle: 90, position: 'insideRight' }}
                    />
                    <Tooltip
                        contentStyle={{
                            backgroundColor: 'hsl(var(--background))',
                            border: '1px solid hsl(var(--border))',
                            borderRadius: '8px'
                        }}
                    />
                    <Legend />
                    <Bar
                        yAxisId="left"
                        dataKey="Nombre de crises"
                        fill="hsl(var(--primary))"
                        radius={[8, 8, 0, 0]}
                    />
                    <Bar
                        yAxisId="right"
                        dataKey="Intensité moyenne"
                        fill="hsl(var(--destructive))"
                        radius={[8, 8, 0, 0]}
                    />
                </BarChart>
            </ResponsiveContainer>
        </div>
    );
}
