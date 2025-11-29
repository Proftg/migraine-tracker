import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, Cell } from 'recharts';

interface ScreenTimeChartProps {
    data: {
        range: string;
        count: number;
        percentage: number;
    }[];
}

const COLORS = ['#10b981', '#3b82f6', '#f59e0b', '#ef4444', '#dc2626'];

export function ScreenTimeChart({ data }: ScreenTimeChartProps) {
    return (
        <div className="w-full h-[400px]">
            <h3 className="text-lg font-semibold mb-4">Crises par Durée de Temps d&apos;Écran</h3>
            <p className="text-sm text-muted-foreground mb-4">
                Corrélation entre le temps passé devant l&apos;écran et la fréquence des migraines
            </p>
            <ResponsiveContainer width="100%" height="100%">
                <BarChart data={data} margin={{ top: 20, right: 30, left: 20, bottom: 5 }}>
                    <CartesianGrid strokeDasharray="3 3" className="stroke-muted" />
                    <XAxis dataKey="range" className="text-sm" />
                    <YAxis className="text-sm" label={{ value: 'Nombre de crises', angle: -90, position: 'insideLeft' }} />
                    <Tooltip
                        contentStyle={{
                            backgroundColor: 'hsl(var(--background))',
                            border: '1px solid hsl(var(--border))',
                            borderRadius: '8px'
                        }}
                        formatter={(value: number, name: string, props: any) => [
                            `${value} crises (${props.payload.percentage.toFixed(1)}%)`,
                            'Fréquence'
                        ]}
                    />
                    <Legend />
                    <Bar dataKey="count" name="Nombre de crises" radius={[8, 8, 0, 0]}>
                        {data.map((entry, index) => (
                            <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                        ))}
                    </Bar>
                </BarChart>
            </ResponsiveContainer>
        </div>
    );
}
