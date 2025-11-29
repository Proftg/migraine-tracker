
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { RiskAssessment } from "@/lib/risk";
import { AlertTriangle, CheckCircle, CloudLightning, Activity } from "lucide-react";

interface RiskIndicatorProps {
    assessment: RiskAssessment | null;
}

export function RiskIndicator({ assessment }: RiskIndicatorProps) {
    if (!assessment) return null;

    const getColor = (score: number) => {
        if (score >= 7) return "text-red-600 bg-red-100 border-red-200";
        if (score >= 5) return "text-orange-600 bg-orange-100 border-orange-200";
        if (score >= 3) return "text-yellow-600 bg-yellow-100 border-yellow-200";
        return "text-green-600 bg-green-100 border-green-200";
    };

    const getIcon = (score: number) => {
        if (score >= 5) return <AlertTriangle className="h-6 w-6" />;
        return <CheckCircle className="h-6 w-6" />;
    };

    return (
        <Card className="border-l-4 border-l-primary">
            <CardHeader className="pb-2">
                <CardTitle className="text-lg flex items-center justify-between">
                    <span className="flex items-center gap-2">
                        <Activity className="h-5 w-5 text-primary" />
                        Score de Risque Quotidien
                    </span>
                    <span className={`px-3 py-1 rounded-full text-sm font-bold border ${getColor(assessment.score)}`}>
                        {assessment.level} ({assessment.score}/10)
                    </span>
                </CardTitle>
            </CardHeader>
            <CardContent>
                <div className="space-y-4">
                    <p className="text-sm text-muted-foreground italic">
                        "{assessment.recommendation}"
                    </p>

                    {assessment.factors.length > 0 && (
                        <div className="space-y-2">
                            <h4 className="text-xs font-semibold uppercase text-muted-foreground tracking-wider">Facteurs détectés</h4>
                            <div className="grid gap-2">
                                {assessment.factors.map((factor, index) => (
                                    <div key={index} className="flex items-start gap-2 text-sm bg-accent/50 p-2 rounded">
                                        {factor.name === "Pression Atmosphérique" || factor.name === "Orage" ? (
                                            <CloudLightning className="h-4 w-4 mt-0.5 text-blue-500" />
                                        ) : (
                                            <Activity className="h-4 w-4 mt-0.5 text-orange-500" />
                                        )}
                                        <div>
                                            <span className="font-medium block">{factor.name}</span>
                                            <span className="text-xs text-muted-foreground">{factor.description}</span>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>
                    )}
                </div>
            </CardContent>
        </Card>
    );
}
