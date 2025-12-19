import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { X, FileDown, Calendar, Stethoscope, Activity, RefreshCw } from "lucide-react";
import { useState } from "react";
import { JournalEntry } from "@/types";
import { analytics } from "@/lib/analytics";
import { TriggerComparisonChart } from "@/components/charts/TriggerComparisonChart";
import { FrequencyTrendChart } from "@/components/charts/FrequencyTrendChart";
import { ScreenTimeChart } from "@/components/charts/ScreenTimeChart";
import { SportsAnalysisChart } from "@/components/charts/SportsAnalysisChart";
import { BeforeAfterChart } from "@/components/charts/BeforeAfterChart";
import { CalorieCorrelationChart } from "@/components/charts/CalorieCorrelationChart";
import { MigraineLocationMap } from "@/components/charts/MigraineLocationMap";
import { HealthMetricsReport } from "@/components/migraine/HealthMetricsReport";
import { subDays, subMonths, format } from "date-fns";

interface MedicalReportProps {
    entries: JournalEntry[];
    onClose: () => void;
}

type DateRangePreset = 'week' | 'month' | '3months' | '6months' | 'year' | 'all';

export function MedicalReport({ entries, onClose }: MedicalReportProps) {
    const [dateRange, setDateRange] = useState<DateRangePreset>('3months');
    const [isDoctorMode, setIsDoctorMode] = useState(false);

    const getDateRange = () => {
        const end = new Date();
        let start: Date;

        switch (dateRange) {
            case 'week':
                start = subDays(end, 7);
                break;
            case 'month':
                start = subMonths(end, 1);
                break;
            case '3months':
                start = subMonths(end, 3);
                break;
            case '6months':
                start = subMonths(end, 6);
                break;
            case 'year':
                start = subMonths(end, 12);
                break;
            default:
                return undefined;
        }

        return { start, end };
    };

    const range = getDateRange();

    // Filter entries based on range
    const filteredEntries = range
        ? entries.filter(e => {
            const date = new Date(e.date);
            return date >= range.start && date <= range.end;
        })
        : entries;

    const stats = analytics.getBasicStats(filteredEntries, range);
    const frequencyData = analytics.getFrequencyByPeriod(filteredEntries, 'week', range);
    const sportsAnalysis = analytics.getSportsAnalysis(filteredEntries);
    const screenTimeAnalysis = analytics.getScreenTimeAnalysis(filteredEntries);
    const medicationData = analytics.getMedicationEffectiveness(filteredEntries);
    const calorieAnalysis = analytics.getCalorieAnalysis(filteredEntries);
    const beforeAfterAnalysis = analytics.getBeforeAfterAnalysis(entries); // Use all entries for before/after
    const triggerAnalysis = analytics.getPotentialTriggers(filteredEntries);
    const locationStats = analytics.getLocationAnalysis(filteredEntries);

    // Prepare trigger comparison data
    const triggerComparisonData = [
        {
            trigger: 'Sport',
            withTrigger: sportsAnalysis.migrainesAfterSports,
            withoutTrigger: sportsAnalysis.migrainesWithoutSports,
            avgIntensityWith: 0,
            avgIntensityWithout: 0
        },
        {
            trigger: 'Temps d\'écran élevé',
            withTrigger: screenTimeAnalysis.riskByDuration.slice(3).reduce((sum, r) => sum + r.count, 0),
            withoutTrigger: screenTimeAnalysis.riskByDuration.slice(0, 3).reduce((sum, r) => sum + r.count, 0),
            avgIntensityWith: 0,
            avgIntensityWithout: 0
        }
    ];

    return (
        <div className="fixed inset-0 z-50 bg-background overflow-y-auto">
            <div className="max-w-7xl mx-auto p-8 pb-16">
                {/* Header */}
                <div className="flex justify-between items-start mb-8">
                    <div>
                        <h1 className="text-4xl font-bold mb-2">Rapport Médical</h1>
                        <p className="text-muted-foreground">
                            Généré le {format(new Date(), 'dd/MM/yyyy à HH:mm')}
                        </p>
                    </div>
                    <div className="flex gap-2">
                        <Button
                            variant={isDoctorMode ? "default" : "outline"}
                            onClick={() => setIsDoctorMode(!isDoctorMode)}
                            className="gap-2"
                        >
                            <Stethoscope className="h-4 w-4" />
                            {isDoctorMode ? "Mode Médecin" : "Vue Patient"}
                        </Button>
                        <Button variant="outline" onClick={() => window.print()}>
                            <FileDown className="h-4 w-4 mr-2" />
                            Exporter PDF
                        </Button>
                        <Button variant="ghost" size="icon" onClick={onClose}>
                            <X className="h-6 w-6" />
                        </Button>
                    </div>
                </div>

                {/* Content View Switcher */}
                {isDoctorMode ? (
                    <div className="space-y-8 animate-in fade-in duration-500">
                        <div className="p-4 bg-muted/50 border border-border rounded-lg text-sm mb-4">
                            ℹ️ <strong>Rapport d&apos;Expertise :</strong> Cette vue synthétise l&apos;efficacité du traitement et les corrélations identifiées par l&apos;IA pour faciliter l&apos;analyse clinique.
                        </div>

                        {/* 1. Aimovig Efficacy */}
                        {beforeAfterAnalysis ? (
                            <Card className="border-l-4 border-l-purple-500 shadow-lg">
                                <CardHeader className="bg-purple-50/50">
                                    <div className="flex justify-between items-start">
                                        <div>
                                            <CardTitle className="flex items-center gap-2 text-xl text-purple-900">
                                                <Activity className="h-5 w-5 text-purple-600" />
                                                Bilan Thérapeutique : Aimovig 140mg
                                            </CardTitle>
                                            <CardDescription className="text-purple-700/70">
                                                Analyse comparative sur {beforeAfterAnalysis.daysOnTreatment} jours d&apos;exposition
                                            </CardDescription>
                                        </div>
                                        <div className="px-3 py-1 bg-purple-100 text-purple-700 rounded-full text-xs font-bold uppercase">
                                            Usage Clinique
                                        </div>
                                    </div>
                                </CardHeader>
                                <CardContent className="pt-6">
                                    {/* Detailed Comparison Table */}
                                    <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                                        {/* Frequency */}
                                        <div className="p-6 bg-white border rounded-xl shadow-sm space-y-2">
                                            <h4 className="text-xs font-semibold text-muted-foreground uppercase tracking-widest text-center">Fréquence Mensuelle</h4>
                                            <div className="flex justify-around items-end h-16">
                                                <div className="text-center">
                                                    <div className="text-xs text-muted-foreground">Avant</div>
                                                    <div className="text-lg font-medium">{beforeAfterAnalysis.beforeTreatment.migrainesPerMonth.toFixed(1)}</div>
                                                </div>
                                                <div className="h-full w-px bg-slate-100" />
                                                <div className="text-center">
                                                    <div className="text-xs text-muted-foreground">Après</div>
                                                    <div className="text-lg font-bold text-green-600">{beforeAfterAnalysis.afterTreatment.migrainesPerMonth.toFixed(1)}</div>
                                                </div>
                                            </div>
                                            <div className="text-center pt-2 border-t">
                                                <span className="text-2xl font-black text-green-600">-{Math.abs(beforeAfterAnalysis.improvement.frequencyReduction).toFixed(0)}%</span>
                                            </div>
                                        </div>

                                        {/* Intensity */}
                                        <div className="p-6 bg-white border rounded-xl shadow-sm space-y-2">
                                            <h4 className="text-xs font-semibold text-muted-foreground uppercase tracking-widest text-center">Intensité (VAS)</h4>
                                            <div className="flex justify-around items-end h-16">
                                                <div className="text-center">
                                                    <div className="text-xs text-muted-foreground">Avant</div>
                                                    <div className="text-lg font-medium">{beforeAfterAnalysis.beforeTreatment.averageIntensity.toFixed(1)}</div>
                                                </div>
                                                <div className="h-full w-px bg-slate-100" />
                                                <div className="text-center">
                                                    <div className="text-xs text-muted-foreground">Après</div>
                                                    <div className="text-lg font-bold text-green-600">{beforeAfterAnalysis.afterTreatment.averageIntensity.toFixed(1)}</div>
                                                </div>
                                            </div>
                                            <div className="text-center pt-2 border-t">
                                                <span className="text-2xl font-black text-green-600">-{Math.abs(beforeAfterAnalysis.improvement.intensityReduction).toFixed(0)}%</span>
                                            </div>
                                        </div>

                                        {/* Total Counts */}
                                        <div className="p-6 bg-white border rounded-xl shadow-sm space-y-2">
                                            <h4 className="text-xs font-semibold text-muted-foreground uppercase tracking-widest text-center">Nombre de Crises</h4>
                                            <div className="flex justify-around items-end h-16">
                                                <div className="text-center text-slate-400">
                                                    <div className="text-xs">Initiales</div>
                                                    <div className="text-lg font-medium">{beforeAfterAnalysis.beforeTreatment.totalMigraines}</div>
                                                </div>
                                                <div className="h-full w-px bg-slate-100" />
                                                <div className="text-center">
                                                    <div className="text-xs text-muted-foreground">Actuelles</div>
                                                    <div className="text-lg font-bold text-green-600">{beforeAfterAnalysis.afterTreatment.totalMigraines}</div>
                                                </div>
                                            </div>
                                            <div className="text-center pt-2 border-t">
                                                <span className="text-sm font-semibold text-muted-foreground">Réduction effective</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="text-sm text-slate-600 bg-slate-50 p-4 rounded-lg italic border-l-2 border-slate-300">
                                        💡 <strong>Résumé clinique :</strong> Depuis l&apos;instauration du traitement ({format(new Date(beforeAfterAnalysis.treatmentStartDate), 'dd/MM/yyyy')}),
                                        on observe une amélioration clinique majeure. Le nombre total de crises est passé de <strong>{beforeAfterAnalysis.beforeTreatment.totalMigraines}</strong> à <strong>{beforeAfterAnalysis.afterTreatment.totalMigraines}</strong>,
                                        avec une diminution corrélative de l&apos;intensité douloureuse moyenne ({beforeAfterAnalysis.afterTreatment.averageIntensity.toFixed(1)}/10 vs {beforeAfterAnalysis.beforeTreatment.averageIntensity.toFixed(1)}/10).
                                    </div>
                                </CardContent>
                            </Card>
                        ) : (
                            <Card>
                                <CardContent className="pt-6">
                                    <p className="text-muted-foreground text-center italic">Données Aimovig insuffisantes pour cette période.</p>
                                </CardContent>
                            </Card>
                        )}

                        {/* 2. Pain Map Comparison Section (Before vs After) */}
                        <Card className="border-l-4 border-l-orange-500 shadow-lg break-inside-avoid">
                            <CardHeader className="bg-orange-50/50">
                                <CardTitle className="flex items-center gap-2 text-xl text-orange-900">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="text-orange-600"><path d="M12 22a7 7 0 0 0 7-7c0-2-1-3.9-3-5.5s-3.5-4-4-6.5c-.5 2.5-2 4.9-4 6.5C6 11.1 5 13 5 15a7 7 0 0 0 7 7z" /></svg>
                                    Comparaison Topographique (Pré vs Post Traitement)
                                </CardTitle>
                                <CardDescription className="text-orange-700/70">
                                    Évolution de la localisation et de l&apos;intensité des douleurs
                                </CardDescription>
                            </CardHeader>
                            <CardContent className="pt-6">
                                <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                                    <MigraineLocationMap
                                        data={beforeAfterAnalysis?.locationStatsBefore || []}
                                        totalEntries={beforeAfterAnalysis?.beforeTreatment?.totalMigraines}
                                        title="SITUATION INITIALE"
                                        subtitle="Analyse avant début Aimovig"
                                        hideLegend
                                    />
                                    <MigraineLocationMap
                                        data={beforeAfterAnalysis?.locationStatsAfter || []}
                                        totalEntries={beforeAfterAnalysis?.afterTreatment?.totalMigraines}
                                        title="SITUATION ACTUELLE"
                                        subtitle="Sous couverture Aimovig"
                                    />
                                </div>
                                <div className="mt-6 bg-orange-50/50 p-4 rounded-lg text-[11px] text-slate-600 italic border border-orange-100">
                                    Nota : Ces cartographies permettent de visualiser non seulement la réduction du nombre de crises (chiffres centraux) mais aussi l&apos;éventuelle migration ou atténuation de l&apos;intensité (nuances chromatiques) suite à l&apos;injection.
                                </div>
                            </CardContent>
                        </Card>

                        {/* 3. AI Trigger Analysis */}
                        {triggerAnalysis && (
                            <Card className="border-l-4 border-l-blue-500">
                                <CardHeader>
                                    <CardTitle className="flex items-center gap-2">
                                        <RefreshCw className="h-5 w-5 text-blue-500" />
                                        Analyse Prédictive des Déclencheurs (IA)
                                    </CardTitle>
                                    <CardDescription>Identification des corrélations basées sur les données environnementales et comportementales</CardDescription>
                                </CardHeader>
                                <CardContent className="space-y-6">
                                    <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                        <div className="p-4 border rounded-lg">
                                            <h4 className="font-semibold mb-1 text-sm">Facteur Météo</h4>
                                            <p className="text-sm text-muted-foreground">{triggerAnalysis.weatherFactor.sensitivity}</p>
                                            <div className="mt-2 text-xs font-bold text-blue-600">Corrélation : {triggerAnalysis.weatherFactor.riskLevel.toFixed(0)}%</div>
                                        </div>
                                        <div className="p-4 border rounded-lg">
                                            <h4 className="font-semibold mb-1 text-sm">Facteur Temporel</h4>
                                            <div className="space-y-1">
                                                <div className="flex justify-between text-xs">
                                                    <span>Week-end</span>
                                                    <span className="font-bold">{triggerAnalysis.timeFactor.weekendRisk.toFixed(0)}%</span>
                                                </div>
                                                <div className="flex justify-between text-xs">
                                                    <span>Matin</span>
                                                    <span className="font-bold">{triggerAnalysis.timeFactor.morningRisk.toFixed(0)}%</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div>
                                        <h4 className="font-semibold mb-3 text-sm">Déclencheurs Probables Détectés</h4>
                                        <div className="space-y-2">
                                            {triggerAnalysis.identifiedTriggers.length > 0 ? (
                                                triggerAnalysis.identifiedTriggers.map((t: any) => (
                                                    <div key={t.name} className="flex items-center justify-between p-2 bg-muted/30 rounded text-sm">
                                                        <span>{t.name}</span>
                                                        <div className="flex items-center gap-3">
                                                            <div className="w-16 h-1 bg-gray-200 rounded-full">
                                                                <div className="h-full bg-blue-500 rounded-full" style={{ width: `${t.probability}%` }} />
                                                            </div>
                                                            <span className="font-bold text-blue-600">{t.probability.toFixed(0)}%</span>
                                                        </div>
                                                    </div>
                                                ))
                                            ) : (
                                                <p className="text-xs text-center text-muted-foreground italic">Aucun déclencheur majeur identifié.</p>
                                            )}
                                        </div>
                                    </div>

                                    <div className="p-3 bg-blue-50 border border-blue-100 rounded text-blue-800 text-sm italic">
                                        💡 {triggerAnalysis.recommendation}
                                    </div>
                                </CardContent>
                            </Card>
                        )}
                    </div>
                ) : (
                    <>
                        {/* Date Range Selector */}
                        <Card className="mb-8">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <Calendar className="h-5 w-5" />
                                    Période d&apos;analyse
                                </CardTitle>
                            </CardHeader>
                            <CardContent>
                                <div className="flex flex-wrap gap-2">
                                    {[
                                        { value: 'week', label: 'Dernière semaine' },
                                        { value: 'month', label: 'Dernier mois' },
                                        { value: '3months', label: '3 derniers mois' },
                                        { value: '6months', label: '6 derniers mois' },
                                        { value: 'year', label: 'Dernière année' },
                                        { value: 'all', label: 'Tout l\'historique' }
                                    ].map(({ value, label }) => (
                                        <Button
                                            key={value}
                                            variant={dateRange === value ? 'default' : 'outline'}
                                            onClick={() => setDateRange(value as DateRangePreset)}
                                        >
                                            {label}
                                        </Button>
                                    ))}
                                </div>
                            </CardContent>
                        </Card>

                        {/* Executive Summary */}
                        <Card className="mb-8">
                            <CardHeader>
                                <CardTitle>Résumé Exécutif</CardTitle>
                                <CardDescription>Vue d&apos;ensemble de votre période d&apos;analyse</CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                                    <div>
                                        <div className="text-3xl font-bold text-primary">{stats.totalMigraines}</div>
                                        <div className="text-sm text-muted-foreground">Crises totales</div>
                                    </div>
                                    <div>
                                        <div className="text-3xl font-bold text-primary">{stats.averageIntensity.toFixed(1)}/10</div>
                                        <div className="text-sm text-muted-foreground">Intensité moyenne</div>
                                    </div>
                                    <div>
                                        <div className="text-3xl font-bold text-primary">{stats.averageDuration.toFixed(0)} min</div>
                                        <div className="text-sm text-muted-foreground">Durée moyenne</div>
                                    </div>
                                    <div>
                                        <div className="text-3xl font-bold text-primary">{stats.mostCommonLocation}</div>
                                        <div className="text-sm text-muted-foreground">Localisation fréquente</div>
                                    </div>
                                </div>
                                {stats.mostCommonSymptoms.length > 0 && (
                                    <div className="mt-6">
                                        <div className="text-sm font-medium mb-2">Symptômes les plus fréquents:</div>
                                        <div className="flex flex-wrap gap-2">
                                            {stats.mostCommonSymptoms.map(symptom => (
                                                <span key={symptom} className="px-3 py-1 bg-primary/20 text-primary rounded-full text-sm">
                                                    {symptom}
                                                </span>
                                            ))}
                                        </div>
                                    </div>
                                )}
                            </CardContent>
                        </Card>

                        {/* Treatment Effectiveness Analysis */}
                        {beforeAfterAnalysis && (
                            <Card className="mb-8 border-purple-500/30 bg-gradient-to-br from-purple-500/5 to-pink-500/5">
                                <CardHeader>
                                    <CardTitle className="flex items-center gap-2">
                                        💉 Efficacité du Traitement Préventif Aimovig
                                    </CardTitle>
                                    <CardDescription>
                                        Comparaison avant/après traitement - {beforeAfterAnalysis.daysOnTreatment} jours sous traitement
                                    </CardDescription>
                                </CardHeader>
                                <CardContent className="space-y-6">
                                    {/* Summary Stats */}
                                    <div className="grid grid-cols-3 gap-6 mb-8">
                                        <div className="text-center p-6 rounded-lg bg-gradient-to-br from-green-500/10 to-emerald-500/10 border border-green-500/20">
                                            <div className="text-4xl font-bold text-green-600">
                                                {beforeAfterAnalysis.improvement.frequencyReduction > 0 ? '-' : '+'}
                                                {Math.abs(beforeAfterAnalysis.improvement.frequencyReduction).toFixed(0)}%
                                            </div>
                                            <div className="text-sm font-medium mt-2">Réduction fréquence</div>
                                            <div className="text-xs text-muted-foreground mt-1">
                                                {beforeAfterAnalysis.beforeTreatment.migrainesPerMonth.toFixed(1)} → {beforeAfterAnalysis.afterTreatment.migrainesPerMonth.toFixed(1)} crises/mois
                                            </div>
                                        </div>
                                        <div className="text-center p-6 rounded-lg bg-gradient-to-br from-green-500/10 to-emerald-500/10 border border-green-500/20">
                                            <div className="text-4xl font-bold text-green-600">
                                                {beforeAfterAnalysis.improvement.intensityReduction > 0 ? '-' : '+'}
                                                {Math.abs(beforeAfterAnalysis.improvement.intensityReduction).toFixed(0)}%
                                            </div>
                                            <div className="text-sm font-medium mt-2">Réduction intensité</div>
                                            <div className="text-xs text-muted-foreground mt-1">
                                                {beforeAfterAnalysis.beforeTreatment.averageIntensity.toFixed(1)} → {beforeAfterAnalysis.afterTreatment.averageIntensity.toFixed(1)}/10
                                            </div>
                                        </div>
                                        <div className="text-center p-6 rounded-lg bg-gradient-to-br from-green-500/10 to-emerald-500/10 border border-green-500/20">
                                            <div className="text-4xl font-bold text-green-600">
                                                {beforeAfterAnalysis.improvement.durationReduction > 0 ? '-' : '+'}
                                                {Math.abs(beforeAfterAnalysis.improvement.durationReduction).toFixed(0)}%
                                            </div>
                                            <div className="text-sm font-medium mt-2">Réduction durée</div>
                                            <div className="text-xs text-muted-foreground mt-1">
                                                {beforeAfterAnalysis.beforeTreatment.averageDuration.toFixed(0)} → {beforeAfterAnalysis.afterTreatment.averageDuration.toFixed(0)} min
                                            </div>
                                        </div>
                                    </div>

                                    {/* Chart */}
                                    <div className="min-h-[480px] pb-8">
                                        <h4 className="font-semibold mb-4 text-center">Comparaison détaillée</h4>
                                        <BeforeAfterChart data={beforeAfterAnalysis} />
                                    </div>

                                    {/* Treatment Info */}
                                    <div className="p-4 bg-muted rounded-lg">
                                        <p className="text-sm">
                                            <strong>Date de début du traitement:</strong> {format(new Date(beforeAfterAnalysis.treatmentStartDate), 'dd/MM/yyyy')}
                                        </p>
                                        <p className="text-sm mt-2">
                                            <strong>Durée sous traitement:</strong> {beforeAfterAnalysis.daysOnTreatment} jours
                                        </p>
                                        <p className="text-sm mt-2">
                                            <strong>Crises avant traitement:</strong> {beforeAfterAnalysis.beforeTreatment.totalMigraines} crises
                                        </p>
                                        <p className="text-sm mt-2">
                                            <strong>Crises après traitement:</strong> {beforeAfterAnalysis.afterTreatment.totalMigraines} crises
                                        </p>
                                    </div>
                                </CardContent>
                            </Card>
                        )}

                        {/* Frequency Analysis */}
                        <Card className="mb-8">
                            <CardHeader>
                                <CardTitle>Analyse de Fréquence</CardTitle>
                                <CardDescription>Évolution du nombre de crises dans le temps</CardDescription>
                            </CardHeader>
                            <CardContent className="min-h-[480px] pb-8">
                                <FrequencyTrendChart data={frequencyData} />
                            </CardContent>
                        </Card>

                        {/* Trigger Analysis */}
                        <Card className="mb-8">
                            <CardHeader>
                                <CardTitle>Analyse des Déclencheurs</CardTitle>
                                <CardDescription>Comparaison des crises avec et sans déclencheurs identifiés</CardDescription>
                            </CardHeader>
                            <CardContent className="space-y-12 pb-8">
                                <div className="min-h-[480px]">
                                    <TriggerComparisonChart data={triggerComparisonData} />
                                </div>

                                <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
                                    <div className="space-y-4">
                                        <h4 className="font-semibold mb-4">📱 Impact du Temps d&apos;Écran</h4>
                                        <div className="min-h-[480px]">
                                            <ScreenTimeChart data={screenTimeAnalysis.riskByDuration} />
                                        </div>
                                        {screenTimeAnalysis.averageScreenTimeBeforeCrisis > 0 && (
                                            <div className="mt-6 p-4 bg-muted rounded-lg">
                                                <p className="text-sm">
                                                    <strong>Temps d&apos;écran moyen avant crise:</strong>{' '}
                                                    {screenTimeAnalysis.averageScreenTimeBeforeCrisis.toFixed(1)}h
                                                </p>
                                                {screenTimeAnalysis.breaksImpact.riskIncrease > 0 && (
                                                    <p className="text-sm mt-2 text-destructive">
                                                        ⚠️ Les pauses régulières réduisent le risque de {screenTimeAnalysis.breaksImpact.riskIncrease.toFixed(0)}%
                                                    </p>
                                                )}
                                            </div>
                                        )}
                                    </div>

                                    <div className="space-y-4">
                                        <h4 className="font-semibold mb-4">🏃 Impact du Sport</h4>
                                        {sportsAnalysis.riskBySportType.length > 0 ? (
                                            <>
                                                <div className="min-h-[480px]">
                                                    <SportsAnalysisChart data={sportsAnalysis.riskBySportType} />
                                                </div>
                                                <div className="mt-6 p-4 bg-muted rounded-lg">
                                                    <p className="text-sm">
                                                        <strong>Crises après sport:</strong> {sportsAnalysis.migrainesAfterSports} ({((sportsAnalysis.migrainesAfterSports / (sportsAnalysis.migrainesAfterSports + sportsAnalysis.migrainesWithoutSports)) * 100).toFixed(0)}%)
                                                    </p>
                                                    <p className="text-sm mt-2">
                                                        <strong>Crises sans sport:</strong> {sportsAnalysis.migrainesWithoutSports} ({((sportsAnalysis.migrainesWithoutSports / (sportsAnalysis.migrainesAfterSports + sportsAnalysis.migrainesWithoutSports)) * 100).toFixed(0)}%)
                                                    </p>
                                                </div>
                                            </>
                                        ) : (
                                            <div className="p-8 text-center text-muted-foreground">
                                                Pas assez de données sur les activités sportives
                                            </div>
                                        )}
                                    </div>
                                </div>
                            </CardContent>
                        </Card>

                        {/* Calorie Analysis */}
                        <Card className="mb-8">
                            <CardHeader>
                                <CardTitle>Analyse Calorique</CardTitle>
                                <CardDescription>Corrélation entre alimentation, activité et migraines</CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
                                    <div className="p-4 bg-muted rounded-lg text-center">
                                        <div className="text-2xl font-bold">{calorieAnalysis.averageDailyIntake} kcal</div>
                                        <div className="text-sm text-muted-foreground">Apport moyen / jour</div>
                                    </div>
                                    <div className="p-4 bg-muted rounded-lg text-center">
                                        <div className="text-2xl font-bold">{calorieAnalysis.averageDailyBurn} kcal</div>
                                        <div className="text-sm text-muted-foreground">Dépense moyenne / jour</div>
                                    </div>
                                </div>
                                <div className="min-h-[400px]">
                                    <CalorieCorrelationChart analysis={calorieAnalysis} />
                                </div>
                            </CardContent>
                        </Card>

                        {/* Medication Analysis */}
                        {medicationData.withMedication > 0 && (
                            <Card className="mb-8">
                                <CardHeader>
                                    <CardTitle>Efficacité des Médicaments</CardTitle>
                                    <CardDescription>Analyse de l&apos;efficacité des traitements</CardDescription>
                                </CardHeader>
                                <CardContent>
                                    <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                                        <div>
                                            <div className="text-2xl font-bold">{medicationData.withMedication}</div>
                                            <div className="text-sm text-muted-foreground">Crises avec médicament</div>
                                        </div>
                                        <div>
                                            <div className="text-2xl font-bold">{medicationData.avgReliefTime.toFixed(0)} min</div>
                                            <div className="text-sm text-muted-foreground">Temps moyen de soulagement</div>
                                        </div>
                                        <div>
                                            <div className="text-2xl font-bold">
                                                {((medicationData.withMedication / (medicationData.withMedication + medicationData.withoutMedication)) * 100).toFixed(0)}%
                                            </div>
                                            <div className="text-sm text-muted-foreground">Taux d&apos;utilisation</div>
                                        </div>
                                    </div>

                                    {medicationData.byMedication.length > 0 && (
                                        <div>
                                            <h4 className="font-semibold mb-4">Par type de médicament:</h4>
                                            <div className="space-y-3">
                                                {medicationData.byMedication.map(med => (
                                                    <div key={med.name} className="p-4 bg-muted rounded-lg">
                                                        <div className="flex justify-between items-center">
                                                            <span className="font-medium">{med.name}</span>
                                                            <span className="text-sm text-muted-foreground">{med.count} utilisations</span>
                                                        </div>
                                                        <div className="mt-2 grid grid-cols-2 gap-4 text-sm">
                                                            <div>
                                                                <span className="text-muted-foreground">Soulagement moyen: </span>
                                                                <span className="font-medium">{med.avgReliefTime.toFixed(0)} min</span>
                                                            </div>
                                                            <div>
                                                                <span className="text-muted-foreground">Taux de succès: </span>
                                                                <span className="font-medium">{(med.successRate * 100).toFixed(0)}%</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                ))}
                                            </div>
                                        </div>
                                    )}
                                </CardContent>
                            </Card>
                        )}

                        {/* Health Metrics (Strava & Garmin) */}
                        <HealthMetricsReport entries={filteredEntries} />

                        {/* Key Insights */}
                        <Card className="mb-8">
                            <CardHeader>
                                <CardTitle>💡 Insights Clés pour Votre Médecin</CardTitle>
                            </CardHeader>
                            <CardContent>
                                <div className="space-y-3">
                                    {sportsAnalysis.migrainesAfterSports > sportsAnalysis.migrainesWithoutSports && (
                                        <div className="p-4 bg-destructive/10 border border-destructive/20 rounded-lg">
                                            <p className="text-sm">
                                                ⚠️ <strong>Sport comme déclencheur:</strong> Vous avez plus de crises après une activité sportive.
                                                Discutez avec votre médecin de l&apos;importance de l&apos;hydratation et de l&apos;échauffement.
                                            </p>
                                        </div>
                                    )}

                                    {screenTimeAnalysis.averageScreenTimeBeforeCrisis > 6 && (
                                        <div className="p-4 bg-destructive/10 border border-destructive/20 rounded-lg">
                                            <p className="text-sm">
                                                ⚠️ <strong>Temps d&apos;écran élevé:</strong> Moyenne de {screenTimeAnalysis.averageScreenTimeBeforeCrisis.toFixed(1)}h avant les crises.
                                                Envisagez des pauses régulières (règle 20-20-20) et des filtres de lumière bleue.
                                            </p>
                                        </div>
                                    )}

                                    {stats.averageIntensity > 7 && (
                                        <div className="p-4 bg-destructive/10 border border-destructive/20 rounded-lg">
                                            <p className="text-sm">
                                                ⚠️ <strong>Intensité élevée:</strong> Vos crises ont une intensité moyenne de {stats.averageIntensity.toFixed(1)}/10.
                                                Discutez avec votre médecin d&apos;un traitement préventif.
                                            </p>
                                        </div>
                                    )}

                                    {medicationData.avgReliefTime > 120 && (
                                        <div className="p-4 bg-yellow-500/10 border border-yellow-500/20 rounded-lg">
                                            <p className="text-sm">
                                                💊 <strong>Efficacité médicamenteuse:</strong> Temps de soulagement moyen de {medicationData.avgReliefTime.toFixed(0)} minutes.
                                                Votre médecin pourrait ajuster le traitement.
                                            </p>
                                        </div>
                                    )}
                                </div>
                            </CardContent>
                        </Card>
                    </>
                )}

                {/* Print Footer */}
                <div className="print:block hidden mt-8 pt-4 border-t text-sm text-muted-foreground text-center">
                    <p>Rapport généré par Migraine - {format(new Date(), 'dd/MM/yyyy')}</p>
                    <p className="mt-1">Ce rapport est destiné à faciliter la communication avec votre professionnel de santé</p>
                </div>
            </div>
        </div>
    );
}
