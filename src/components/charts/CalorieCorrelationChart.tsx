import { Bar, BarChart, CartesianGrid, Legend, ResponsiveContainer, Tooltip, XAxis, YAxis } from "recharts";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { CalorieAnalysis } from "@/lib/analytics";

interface CalorieCorrelationChartProps {
    analysis: CalorieAnalysis;
}

export function CalorieCorrelationChart({ analysis }: CalorieCorrelationChartProps) {
    const intakeData = analysis.intakeCorrelation.map(item => ({
        range: item.range,
        risk: item.risk,
        count: item.migraineCount
    }));

    const burnData = analysis.burnCorrelation.map(item => ({
        range: item.range,
        risk: item.risk,
        count: item.migraineCount
    }));

    return (
        <div className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <Card>
                    <CardHeader>
                        <CardTitle>Impact Apport Calorique</CardTitle>
                        <CardDescription>Risque de migraine par niveau d'apport</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div className="h-[300px]">
                            <ResponsiveContainer width="100%" height="100%">
                                <BarChart data={intakeData}>
                                    <CartesianGrid strokeDasharray="3 3" />
                                    <XAxis dataKey="range" />
                                    <YAxis unit="%" />
                                    <Tooltip
                                        formatter={(value: number) => [`${value}%`, 'Risque']}
                                        labelStyle={{ color: 'black' }}
                                    />
                                    <Legend />
                                    <Bar dataKey="risk" name="Risque (%)" fill="#f97316" radius={[4, 4, 0, 0]} />
                                </BarChart>
                            </ResponsiveContainer>
                        </div>
                    </CardContent>
                </Card>

                <Card>
                    <CardHeader>
                        <CardTitle>Impact Dépense Calorique</CardTitle>
                        <CardDescription>Risque de migraine par niveau d'activité</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div className="h-[300px]">
                            <ResponsiveContainer width="100%" height="100%">
                                <BarChart data={burnData}>
                                    <CartesianGrid strokeDasharray="3 3" />
                                    <XAxis dataKey="range" />
                                    <YAxis unit="%" />
                                    <Tooltip
                                        formatter={(value: number) => [`${value}%`, 'Risque']}
                                        labelStyle={{ color: 'black' }}
                                    />
                                    <Legend />
                                    <Bar dataKey="risk" name="Risque (%)" fill="#10b981" radius={[4, 4, 0, 0]} />
                                </BarChart>
                            </ResponsiveContainer>
                        </div>
                    </CardContent>
                </Card>
            </div>

            <Card>
                <CardHeader>
                    <CardTitle>Déficit vs Surplus Calorique</CardTitle>
                    <CardDescription>Comparaison du risque selon la balance énergétique</CardDescription>
                </CardHeader>
                <CardContent>
                    <div className="flex justify-around items-center py-4">
                        <div className="text-center">
                            <div className="text-3xl font-bold text-orange-500">
                                {analysis.netCalorieImpact.withTrigger.toFixed(1)}%
                            </div>
                            <div className="text-sm text-muted-foreground mt-1">
                                Risque en Déficit
                            </div>
                        </div>
                        <div className="text-2xl text-muted-foreground">vs</div>
                        <div className="text-center">
                            <div className="text-3xl font-bold text-blue-500">
                                {analysis.netCalorieImpact.withoutTrigger.toFixed(1)}%
                            </div>
                            <div className="text-sm text-muted-foreground mt-1">
                                Risque en Surplus
                            </div>
                        </div>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
