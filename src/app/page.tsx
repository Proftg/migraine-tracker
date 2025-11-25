"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Activity, Plus, TrendingDown, TrendingUp, FileDown, Trash2, FileText, AlertTriangle, Syringe, Calendar as CalendarIcon } from "lucide-react";
import { useState, useEffect } from "react";
import { storage } from "@/lib/storage";
import { JournalEntry } from "@/types";
import { formatDistanceToNow, format } from "date-fns";
import { fr } from "date-fns/locale";
import { exportService } from "@/lib/export";
import { CrisisMode } from "@/components/migraine/CrisisMode";
import { SportsQuickEntry } from "@/components/migraine/SportsQuickEntry";
import { DailyCalorieReminder } from "@/components/migraine/DailyCalorieReminder";
import { MedicalReport } from "@/components/migraine/MedicalReport";

export default function Home() {
    const [entries, setEntries] = useState<JournalEntry[]>([]);
    const [inputText, setInputText] = useState("");
    const [showCrisisMode, setShowCrisisMode] = useState(false);
    const [showSportsEntry, setShowSportsEntry] = useState(false);
    const [showCalorieReminder, setShowCalorieReminder] = useState(false);
    const [showMedicalReport, setShowMedicalReport] = useState(false);
    const [showClearConfirm, setShowClearConfirm] = useState(false);
    const [crisisFreeDays, setCrisisFreeDays] = useState(0);
    const [lastTreatment, setLastTreatment] = useState<any>(null);
    const [daysUntilNextInjection, setDaysUntilNextInjection] = useState<number | null>(null);

    useEffect(() => {
    }, []);

    const handleAddEntry = () => {
        if (!inputText.trim()) return;

        const analysis = storage.analyzeText(inputText);
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: analysis.type as any || 'note',
            ...analysis
        } as JournalEntry;

        const updatedEntries = storage.addEntry(newEntry);
        setEntries(updatedEntries);
        setCrisisFreeDays(storage.getCrisisFreeDays());
        setInputText("");
    };

    const handleQuickAction = (type: 'migraine' | 'activity' | 'medication') => {
        let text = "";
        let entryType = type;

        switch (type) {
            case 'migraine':
                text = "Crise signalée (Rapide)";
                break;
            case 'activity':
                text = "Activité sportive (Rapide)";
                break;
            case 'medication':
                text = "Prise de médicament (Rapide)";
                break;
        }

        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: entryType,
            notes: text,
            ...(type === 'migraine' ? { intensity: 5 } : {}),
            ...(type === 'activity' ? { activityType: 'Sport', duration: 30, intensity: 'medium' } : {}),
            ...(type === 'medication' ? { name: 'Médicament habituel', dosage: '1 dose' } : {})
        } as JournalEntry;

        const updatedEntries = storage.addEntry(newEntry);
        setEntries(updatedEntries);
        setCrisisFreeDays(storage.getCrisisFreeDays());
    };

    const handleCrisisLog = (data: {
        intensity: number;
        location: string;
        symptoms: string[];
        exactTime: string;
        endTime?: string;
        duration?: number;
        medicationAttempts?: any[];
        // Legacy fields
        medicationName?: string;
        medicationDosage?: number;
        medicationTime?: string;
        reliefDuration?: number;
        reliefWithMedication?: boolean;
    }) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: 'migraine',
            intensity: data.intensity,
            painLocation: data.location,
            symptoms: data.symptoms,
            exactTime: data.exactTime,
            endTime: data.endTime,
            duration: data.duration,
            medicationAttempts: data.medicationAttempts,
            // Legacy fields mapping
            medicationName: data.medicationName,
            medicationDosage: data.medicationDosage,
            medicationTime: data.medicationTime,
            reliefDuration: data.reliefDuration,
            reliefWithMedication: data.reliefWithMedication,
            notes: `Crise ${data.intensity}/10 - ${data.location} à ${data.exactTime}${data.duration ? ` (${data.duration}min)` : ''}`
        } as JournalEntry;

        const updatedEntries = storage.addEntry(newEntry);
        setEntries(updatedEntries);
        setCrisisFreeDays(storage.getCrisisFreeDays());
        setShowCrisisMode(false);
    };

    const handleSportsLog = (data: {
        activityType: string;
        exactTime: string;
        duration: number;
        intensity: 'low' | 'medium' | 'high';
        caloriesBurned?: number;
    }) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: 'activity',
            activityType: data.activityType,
            exactTime: data.exactTime,
            duration: data.duration,
            intensity: data.intensity,
            caloriesBurned: data.caloriesBurned,
            notes: `${data.activityType} - ${data.duration}min (${data.intensity})`
        } as JournalEntry;

        const updatedEntries = storage.addEntry(newEntry);
        setEntries(updatedEntries);
        setShowSportsEntry(false);
    };

    const handleCalorieLog = (data: {
        totalCalories: number;
        mealBreakdown?: {
            breakfast?: number;
            lunch?: number;
            dinner?: number;
            snacks?: number;
        };
    }) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: 'calories',
            totalCalories: data.totalCalories,
            mealBreakdown: data.mealBreakdown,
            notes: `Calories journalières : ${data.totalCalories} kcal`
        } as JournalEntry;

        const updatedEntries = storage.addEntry(newEntry);
        setEntries(updatedEntries);
        setShowCalorieReminder(false);
    };

    const handleDelete = (id: string) => {
        const newEntries = storage.deleteEntry(id);
        setEntries(newEntries);
        setCrisisFreeDays(storage.getCrisisFreeDays());
    };

    const handleExportPDF = () => {
        exportService.toPDF(entries);
    };

    const handleExportExcel = () => {
        exportService.toExcel(entries);
    };

    const handleClearData = () => {
        if (showClearConfirm) {
            storage.clearAllData();
            setEntries([]);
            setCrisisFreeDays(0);
            setLastTreatment(null);
            setDaysUntilNextInjection(null);
            setShowClearConfirm(false);
            alert("Historique vidé avec succès ! Vous pouvez commencer votre suivi du traitement Aimovig.");
        } else {
            setShowClearConfirm(true);
        }
    };

    const handleLogInjection = () => {
        const today = new Date();
        const nextMonth = new Date(today);
        nextMonth.setMonth(nextMonth.getMonth() + 1);

        const treatmentEntry: any = {
            id: Date.now().toString(),
            date: today.toISOString(),
            type: 'treatment',
            medicationName: 'Aimovig SC',
            dosage: '140mg / 1ml',
            administrationRoute: 'Injection sous-cutanée',
            nextDueDate: nextMonth.toISOString(),
            isPreventive: true,
            notes: 'Injection mensuelle préventive Aimovig'
        };

        const newEntries = storage.addEntry(treatmentEntry);
        setEntries(newEntries);
        setLastTreatment(treatmentEntry);
        setDaysUntilNextInjection(30);
        alert("✅ Injection enregistrée ! Prochaine injection prévue dans 30 jours.");
    };

    const migraineCount = entries.filter(e => e.type === 'migraine').length;
    const avgIntensity = entries
        .filter(e => e.type === 'migraine')
        .reduce((sum, e) => sum + ((e as any).intensity || 0), 0) / (migraineCount || 1);

    return (
        <div className="min-h-screen p-8">
            <div className="max-w-7xl mx-auto space-y-8">
                {/* Header */}
                <div className="flex justify-between items-center">
                    <div>
                        <h1 className="text-4xl font-bold bg-gradient-to-r from-primary to-purple-600 bg-clip-text text-transparent">
                            Migraine Tracker AI
                        </h1>
                        <p className="text-muted-foreground mt-2">
                            Suivez vos migraines et découvrez vos déclencheurs
                        </p>
                    </div>
                    <div className="flex gap-2">
                        <Button onClick={() => setShowMedicalReport(true)} variant="default">
                            <FileText className="h-4 w-4 mr-2" />
                            Rapport Médical
                        </Button>
                        <Button variant="outline" onClick={handleExportPDF}>
                            <FileDown className="h-4 w-4 mr-2" />
                            Export PDF
                        </Button>
                        <Button variant="outline" onClick={handleExportExcel}>
                            <FileDown className="h-4 w-4 mr-2" />
                            Export Excel
                        </Button>
                        <Button
                            variant={showClearConfirm ? "destructive" : "outline"}
                            onClick={handleClearData}
                        >
                            <AlertTriangle className="h-4 w-4 mr-2" />
                            {showClearConfirm ? "Confirmer la suppression" : "Vider l'historique"}
                        </Button>
                    </div>
                </div>

                {/* Clear Confirmation Alert */}
                {showClearConfirm && (
                    <Card className="border-destructive bg-destructive/10">
                        <CardContent className="pt-6">
                            <div className="flex items-start gap-4">
                                <AlertTriangle className="h-6 w-6 text-destructive flex-shrink-0 mt-1" />
                                <div className="flex-1">
                                    <h3 className="font-semibold text-destructive mb-2">
                                        Attention : Suppression définitive
                                    </h3>
                                    <p className="text-sm text-muted-foreground mb-4">
                                        Vous êtes sur le point de supprimer TOUTES vos données ({entries.length} entrées).
                                        Cette action est irréversible. Cliquez à nouveau sur "Confirmer la suppression" pour continuer,
                                        ou sur "Annuler" pour garder vos données.
                                    </p>
                                    <Button
                                        variant="outline"
                                        size="sm"
                                        onClick={() => setShowClearConfirm(false)}
                                    >
                                        Annuler
                                    </Button>
                                </div>
                            </div>
                        </CardContent>
                    </Card>
                )}

                {/* Treatment & Stats Cards */}
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    {/* Crisis-Free Days Counter */}
                    <Card className="bg-gradient-to-br from-green-500/10 to-emerald-500/10 border-green-500/20">
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <CardTitle className="text-sm font-medium">Jours sans crise</CardTitle>
                            <Activity className="h-4 w-4 text-green-600" />
                        </CardHeader>
                        <CardContent>
                            <div className="text-4xl font-bold text-green-600">{crisisFreeDays}</div>
                            <p className="text-xs text-muted-foreground mt-2">
                                Continuez comme ça ! 💪
                            </p>
                        </CardContent>
                    </Card>

                    {/* Treatment Countdown */}
                    <Card className="bg-gradient-to-br from-purple-500/10 to-pink-500/10 border-purple-500/20">
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <CardTitle className="text-sm font-medium">Prochaine injection</CardTitle>
                            <Syringe className="h-4 w-4 text-purple-600" />
                        </CardHeader>
                        <CardContent>
                            {lastTreatment && daysUntilNextInjection !== null ? (
                                <>
                                    <div className="text-4xl font-bold text-purple-600">
                                        {daysUntilNextInjection > 0 ? daysUntilNextInjection : 0}
                                    </div>
                                    <p className="text-xs text-muted-foreground mt-2">
                                        {daysUntilNextInjection <= 3 && daysUntilNextInjection > 0 ? "⏰ Bientôt !" :
                                            daysUntilNextInjection <= 0 ? "📅 Aujourd'hui !" : "jours restants"}
                                    </p>
                                </>
                            ) : (
                                <>
                                    <div className="text-2xl font-bold text-purple-600">--</div>
                                    <p className="text-xs text-muted-foreground mt-2">
                                        Aucune injection enregistrée
                                    </p>
                                </>
                            )}
                        </CardContent>
                    </Card>

                    {/* Migraine Count */}
                    <Card>
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <CardTitle className="text-sm font-medium">Crises totales</CardTitle>
                            <Activity className="h-4 w-4 text-muted-foreground" />
                        </CardHeader>
                        <CardContent>
                            <div className="text-2xl font-bold">{migraineCount}</div>
                            <p className="text-xs text-muted-foreground">
                                <TrendingDown className="inline h-3 w-3" /> Total enregistré
                            </p>
                        </CardContent>
                    </Card>

                    {/* Average Intensity */}
                    <Card>
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <CardTitle className="text-sm font-medium">Intensité moyenne</CardTitle>
                            <TrendingUp className="h-4 w-4 text-muted-foreground" />
                        </CardHeader>
                        <CardContent>
                            <div className="text-2xl font-bold">{avgIntensity.toFixed(1)}/10</div>
                            <p className="text-xs text-muted-foreground">Basé sur {migraineCount} crises</p>
                        </CardContent>
                    </Card>
                </div>

                {/* Treatment Tracking Card */}
                <Card className="border-purple-500/30 bg-gradient-to-br from-purple-500/5 to-pink-500/5">
                    <CardHeader>
                        <div className="flex items-center justify-between">
                            <div>
                                <CardTitle className="flex items-center gap-2">
                                    <Syringe className="h-5 w-5 text-purple-600" />
                                    Traitement Préventif Aimovig
                                </CardTitle>
                                <CardDescription className="mt-2">
                                    Injection mensuelle - 140mg / 1ml
                                </CardDescription>
                            </div>
                            <Button onClick={handleLogInjection} className="bg-purple-600 hover:bg-purple-700">
                                <Syringe className="h-4 w-4 mr-2" />
                                Enregistrer injection
                            </Button>
                        </div>
                    </CardHeader>
                    <CardContent>
                        {lastTreatment ? (
                            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                                <div>
                                    <p className="text-sm text-muted-foreground">Dernière injection</p>
                                    <p className="text-lg font-semibold mt-1">
                                        {format(new Date(lastTreatment.date), 'dd/MM/yyyy', { locale: fr })}
                                    </p>
                                </div>
                                <div>
                                    <p className="text-sm text-muted-foreground">Prochaine injection prévue</p>
                                    <p className="text-lg font-semibold mt-1">
                                        {format(new Date((lastTreatment as any).nextDueDate), 'dd/MM/yyyy', { locale: fr })}
                                    </p>
                                </div>
                                <div>
                                    <p className="text-sm text-muted-foreground">Jours restants</p>
                                    <p className="text-lg font-semibold mt-1 text-purple-600">
                                        {daysUntilNextInjection !== null && daysUntilNextInjection > 0 ? daysUntilNextInjection : 0} jours
                                    </p>
                                </div>
                            </div>
                        ) : (
                            <div className="text-center py-8">
                                <CalendarIcon className="h-12 w-12 text-muted-foreground mx-auto mb-4" />
                                <p className="text-muted-foreground mb-4">
                                    Aucune injection enregistrée. Cliquez sur le bouton ci-dessus pour enregistrer votre première injection Aimovig.
                                </p>
                            </div>
                        )}
                    </CardContent>
                </Card>

                {/* Quick Actions - 2 Buttons */}
                <div className="flex justify-center gap-12 py-8">
                    {/* Signaler une crise (ex-SOS) */}
                    <div className="flex flex-col items-center gap-3">
                        <Button
                            onClick={() => setShowCrisisMode(true)}
                            className="h-24 w-24 rounded-full shadow-lg text-4xl bg-red-600 hover:bg-red-700 transition-transform hover:scale-110"
                            variant="default"
                        >
                            🆘
                        </Button>
                        <span className="text-sm font-medium text-muted-foreground">
                            Signaler une Crise
                        </span>
                    </div>

                    {/* Activité Sportive (améliorée) */}
                    <div className="flex flex-col items-center gap-3">
                        <Button
                            onClick={() => setShowSportsEntry(true)}
                            className="h-24 w-24 rounded-full shadow-lg text-4xl bg-green-600 hover:bg-green-700 transition-transform hover:scale-110"
                            variant="default"
                        >
                            🏃
                        </Button>
                        <span className="text-sm font-medium text-muted-foreground">
                            Activité Sportive
                        </span>
                    </div>
                </div>

                {/* Journal Entry */}
                <Card>
                    <CardHeader>
                        <CardTitle>Journal Rapide</CardTitle>
                        <CardDescription>
                            Décrivez votre état, l&apos;IA analysera automatiquement
                        </CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <textarea
                            className="w-full min-h-[100px] p-4 rounded-lg border bg-background"
                            placeholder="Ex: 'Migraine forte côté droit, nausée, après avoir mangé du chocolat'"
                            value={inputText}
                            onChange={(e) => setInputText(e.target.value)}
                        />
                        <Button onClick={handleAddEntry}>
                            <Plus className="h-4 w-4 mr-2" />
                            Ajouter au Journal
                        </Button>
                    </CardContent>
                </Card>

                {/* Recent Entries */}
                <Card>
                    <CardHeader>
                        <CardTitle>Historique Récent</CardTitle>
                        <CardDescription>{entries.length} entrées au total</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div className="space-y-4">
                            {entries.slice(0, 10).map((entry) => (
                                <div
                                    key={entry.id}
                                    className="flex items-start justify-between p-4 rounded-lg border bg-card hover:bg-accent/50 transition-colors"
                                >
                                    <div className="flex-1">
                                        <div className="flex items-center gap-2">
                                            <span className="font-medium capitalize">{entry.type === 'treatment' ? '💉 Traitement' : entry.type}</span>
                                            {entry.type === 'migraine' && (
                                                <span className="text-xs px-2 py-1 rounded-full bg-destructive/20 text-destructive">
                                                    Intensité: {(entry as any).intensity}/10
                                                </span>
                                            )}
                                            {entry.type === 'treatment' && (
                                                <span className="text-xs px-2 py-1 rounded-full bg-purple-500/20 text-purple-600">
                                                    Aimovig 140mg
                                                </span>
                                            )}
                                            {entry.type === 'activity' && (entry as any).caloriesBurned && (
                                                <span className="text-xs px-2 py-1 rounded-full bg-orange-500/20 text-orange-600">
                                                    🔥 {(entry as any).caloriesBurned} kcal
                                                </span>
                                            )}
                                        </div>
                                        <p className="text-sm text-muted-foreground mt-1">
                                            {entry.notes || 'Pas de notes'}
                                        </p>
                                        <p className="text-xs text-muted-foreground mt-2">
                                            {formatDistanceToNow(new Date(entry.date), { addSuffix: true, locale: fr })}
                                        </p>
                                    </div>
                                    <Button
                                        variant="ghost"
                                        size="icon"
                                        onClick={() => handleDelete(entry.id)}
                                        className="text-destructive hover:text-destructive hover:bg-destructive/10"
                                    >
                                        <Trash2 className="h-4 w-4" />
                                    </Button>
                                </div>
                            ))}
                        </div>
                    </CardContent>
                </Card>
            </div>

            {/* Modals */}
            {showCrisisMode && (
                <CrisisMode
                    onClose={() => setShowCrisisMode(false)}
                    onLogCrisis={handleCrisisLog}
                />
            )}

            {showSportsEntry && (
                <SportsQuickEntry
                    onClose={() => setShowSportsEntry(false)}
                    onSave={handleSportsLog}
                />
            )}

            {showCalorieReminder && (
                <DailyCalorieReminder
                    onClose={() => setShowCalorieReminder(false)}
                    onSave={handleCalorieLog}
                />
            )}

            {showMedicalReport && (
                <MedicalReport
                    entries={entries}
                    onClose={() => setShowMedicalReport(false)}
                />
            )}
        </div>
    );
}
