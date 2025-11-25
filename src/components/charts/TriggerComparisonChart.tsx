import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';

interface TriggerComparisonChartProps {
    data: {
        trigger: string;
        withTrigger: number;
        withoutTrigger: number;
        avgIntensityWith: number;
        avgIntensityWithout: number;
    }[];
}

export function TriggerComparisonChart({ data }: TriggerComparisonChartProps) {
    const chartData = data.map(item => ({
        name: item.trigger,
        'Avec déclencheur': item.withTrigger,
        'Sans déclencheur': item.withoutTrigger
    }));

    return (
        <div className="w-full h-[400px]">
            <h3 className="text-lg font-semibold mb-4">Comparaison des Crises avec/sans Déclencheurs</h3>
            <ResponsiveContainer width="100%" height="100%">
                <BarChart data={chartData} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
                    <CartesianGrid strokeDasharray="3 3" className="stroke-muted" />
                    <XAxis dataKey="name" className="text-sm" />
                    <YAxis className="text-sm" label={{ value: 'Nombre de crises', angle: -90, position: 'insideLeft' }} />
                    <Tooltip
                        contentStyle={{
                            backgroundColor: 'hsl(var(--background))',
                            border: '1px solid hsl(var(--border))',
                            borderRadius: '8px'
                        }}
                    />
                    <Legend />
                    <Bar dataKey="Avec déclencheur" fill="hsl(var(--destructive))" radius={[8, 8, 0, 0]} />
                    <Bar dataKey="Sans déclencheur" fill="hsl(var(--primary))" radius={[8, 8, 0, 0]} />
                </BarChart>
            </ResponsiveContainer>
        </div>
    );
}
