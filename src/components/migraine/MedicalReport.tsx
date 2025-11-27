import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { X, FileDown, Calendar } from "lucide-react";
import { useState } from "react";
import { JournalEntry } from "@/types";
import { analytics } from "@/lib/analytics";
import { TriggerComparisonChart } from "@/components/charts/TriggerComparisonChart";
import { FrequencyTrendChart } from "@/components/charts/FrequencyTrendChart";
import { ScreenTimeChart } from "@/components/charts/ScreenTimeChart";
import { SportsAnalysisChart } from "@/components/charts/SportsAnalysisChart";
import { BeforeAfterChart } from "@/components/charts/BeforeAfterChart";
import { CalorieCorrelationChart } from "@/components/charts/CalorieCorrelationChart";
import { GarminCharts } from "@/components/migraine/GarminCharts";
import { subDays, subMonths, format } from "date-fns";

interface MedicalReportProps {
    entries: JournalEntry[];
    onClose: () => void;
}

type DateRangePreset = 'week' | 'month' | '3months' | '6months' | 'year' | 'all';

export function MedicalReport({ entries, onClose }: MedicalReportProps) {
    const [dateRange, setDateRange] = useState<DateRangePreset>('3months');

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
                        <Button variant="outline" onClick={() => window.print()}>
                            <FileDown className="h-4 w-4 mr-2" />
                            Exporter PDF
                        </Button>
                        <Button variant="ghost" size="icon" onClick={onClose}>
                            <X className="h-6 w-6" />
                        </Button>
                    </div>
                </div>

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

                {/* Garmin Health Data */}
                <Card className="mb-8">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            ⌚ Données de Santé Garmin
                        </CardTitle>
                        <CardDescription>Analyse du sommeil et du stress</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <GarminCharts />
                    </CardContent>
                </Card>

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

                {/* Print Footer */}
                <div className="print:block hidden mt-8 pt-4 border-t text-sm text-muted-foreground text-center">
                    <p>Rapport généré par Migraine - {format(new Date(), 'dd/MM/yyyy')}</p>
                    <p className="mt-1">Ce rapport est destiné à faciliter la communication avec votre professionnel de santé</p>
                </div>
            </div>
        </div>
    );
}
