
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { PredictionResult } from "@/lib/prediction";
import { Brain, Sparkles, AlertCircle, Watch } from "lucide-react";
import { Progress } from "@/components/ui/progress";

interface PredictionWidgetProps {
    prediction: PredictionResult | null;
    isLoading: boolean;
    dataCount: number;
    hasGarminData?: boolean;
}

export function PredictionWidget({ prediction, isLoading, dataCount, hasGarminData }: PredictionWidgetProps) {
    if (dataCount < 5) {
        return (
            <Card className="bg-slate-50 border-slate-200">
                <CardHeader className="pb-2">
                    <CardTitle className="text-lg flex items-center gap-2 text-slate-500">
                        <Brain className="h-5 w-5" />
                        Prédiction IA
                    </CardTitle>
                </CardHeader>
                <CardContent>
                    <div className="flex items-center gap-3 text-sm text-muted-foreground">
                        <AlertCircle className="h-8 w-8 text-slate-300" />
                        <p>L'IA a besoin de plus de données pour apprendre. Continuez à utiliser le journal ! ({dataCount}/5 entrées min)</p>
                    </div>
                </CardContent>
            </Card>
        );
    }

    if (isLoading || !prediction) {
        return (
            <Card>
                <CardContent className="p-6 flex items-center justify-center gap-3">
                    <Brain className="h-5 w-5 animate-pulse text-primary" />
                    <span className="text-sm text-muted-foreground">L'IA analyse vos données...</span>
                </CardContent>
            </Card>
        );
    }

    const percentage = Math.round(prediction.probability * 100);
    const isHighRisk = percentage > 50;

    return (
        <Card className={`border-l-4 ${isHighRisk ? 'border-l-red-500' : 'border-l-green-500'}`}>
            <CardHeader className="pb-2">
                <CardTitle className="text-lg flex items-center justify-between">
                    <span className="flex items-center gap-2">
                        <Sparkles className="h-5 w-5 text-purple-600" />
                        Prédiction pour Demain
                        {hasGarminData && (
                            <span className="text-xs px-2 py-0.5 rounded-full bg-blue-500/10 text-blue-600 flex items-center gap-1" title="Utilise les données Garmin">
                                <Watch className="h-3 w-3" />
                                Garmin
                            </span>
                        )}
                    </span>
                    <span className={`text-2xl font-bold ${isHighRisk ? 'text-red-600' : 'text-green-600'}`}>
                        {percentage}%
                    </span>
                </CardTitle>
            </CardHeader>
            <CardContent>
                <div className="space-y-4">
                    <div className="space-y-1">
                        <div className="flex justify-between text-xs text-muted-foreground">
                            <span>Probabilité de crise</span>
                            <span>Confiance: {Math.round(prediction.confidence * 100)}%</span>
                        </div>
                        <Progress value={percentage} className={`h-2 ${isHighRisk ? 'bg-red-100' : 'bg-green-100'}`} />
                    </div>

                    {prediction.contributingFactors.length > 0 && (
                        <div className="text-xs text-muted-foreground">
                            <span className="font-semibold">Facteurs : </span>
                            {prediction.contributingFactors.join(", ")}
                        </div>
                    )}

                    <p className="text-sm italic text-slate-600">
                        {isHighRisk
                            ? "L'IA détecte un risque élevé. Préparez-vous."
                            : "Les signaux sont au vert. Profitez !"}
                    </p>
                </div>
            </CardContent>
        </Card>
    );
}
