"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Dialog, DialogContent } from "@/components/ui/dialog";
import { Plus, FileDown, Trash2, FileText, Cloud, Droplets, Gauge } from "lucide-react";
import { useState, useEffect, useRef } from "react";
import { storage } from "@/lib/storage";
import { JournalEntry } from "@/types";
import { formatDistanceToNow } from "date-fns";
import { fr } from "date-fns/locale";
import { exportService } from "@/lib/export";
import { CrisisMode } from "@/components/migraine/CrisisMode";
import { SportsQuickEntry } from "@/components/migraine/SportsQuickEntry";
import { DailyCalorieReminder } from "@/components/migraine/DailyCalorieReminder";
import { ScreenTimeInput, ScreenTimeData } from "@/components/migraine/ScreenTimeInput";
import { MedicalReport } from "@/components/migraine/MedicalReport";
import { weatherService, WeatherData } from "@/lib/weather";
import { riskService, RiskAssessment } from "@/lib/risk";
import { RiskIndicator } from "@/components/migraine/RiskIndicator";
import { predictionService, PredictionResult } from "@/lib/prediction";
import { PredictionWidget } from "@/components/migraine/PredictionWidget";

export default function Home() {
    const [entries, setEntries] = useState<JournalEntry[]>([]);
    const [inputText, setInputText] = useState("");
    const [showCrisisMode, setShowCrisisMode] = useState(false);
    const [showSportsEntry, setShowSportsEntry] = useState(false);
    const [showScreenTimeInput, setShowScreenTimeInput] = useState(false);
    const fileInputRef = useRef<HTMLInputElement>(null);
    const [showCalorieReminder, setShowCalorieReminder] = useState(false);
    const [showMedicalReport, setShowMedicalReport] = useState(false);
    const [showClearConfirm, setShowClearConfirm] = useState(false);
    const [crisisFreeDays, setCrisisFreeDays] = useState(0);
    const [lastTreatment, setLastTreatment] = useState<any>(null);
    const [daysUntilNextInjection, setDaysUntilNextInjection] = useState<number | null>(null);
    const [isLoading, setIsLoading] = useState(true);
    const [currentWeather, setCurrentWeather] = useState<WeatherData | null>(null);
    const [riskAssessment, setRiskAssessment] = useState<RiskAssessment | null>(null);
    const [prediction, setPrediction] = useState<PredictionResult | null>(null);
    const [isPredicting, setIsPredicting] = useState(false);

    // Load data on mount and migrate from localStorage if needed
    useEffect(() => {
        const loadData = async () => {
            try {
                await storage.migrateToSupabase();
                const loadedEntries = await storage.getEntries();
                setEntries(loadedEntries);
                const crisisDays = await storage.getCrisisFreeDays();
                setCrisisFreeDays(crisisDays);
                const treatment = await storage.getLastTreatment();
                setLastTreatment(treatment);
                if (treatment) {
                    const nextDose = new Date((treatment as any).nextDose || treatment.date);
                    const today = new Date();
                    const diffDays = Math.ceil((nextDose.getTime() - today.getTime()) / (1000 * 60 * 60 * 24));
                    setDaysUntilNextInjection(diffDays);
                }
            } catch (error) {
                console.error("Error loading data:", error);
            } finally {
                setIsLoading(false);
            }
        };
        loadData();

        // Fetch weather
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(async (position) => {
                try {
                    const weather = await weatherService.getCurrentWeather(
                        position.coords.latitude,
                        position.coords.longitude
                    );
                    setCurrentWeather(weather);
                } catch (error) {
                    console.error("Error fetching weather:", error);
                }
            });
        }
    }, []);

    // Recalculate risk and prediction when entries or weather change
    useEffect(() => {
        const updateAI = async () => {
            if (entries.length > 0 || currentWeather) {
                // Risk Score
                const assessment = riskService.calculateRisk(entries, currentWeather);
                setRiskAssessment(assessment);

                // Prediction (TensorFlow.js)
                if (entries.length >= 5) {
                    setIsPredicting(true);
                    // Small delay to allow UI to render loading state
                    setTimeout(async () => {
                        await predictionService.train(entries);
                        const result = await predictionService.predictNextDay(entries, currentWeather);
                        setPrediction(result);
                        setIsPredicting(false);
                    }, 500);
                }
            }
        };
        updateAI();
    }, [entries, currentWeather]);

    const getEntryWeather = () => {
        if (!currentWeather) return undefined;
        return {
            temperature: currentWeather.temperature,
            pressure: currentWeather.pressure,
            humidity: currentWeather.humidity,
            weatherCode: currentWeather.weatherCode
        };
    };

    const handleAddEntry = async () => {
        if (!inputText.trim()) return;
        const analysis = storage.analyzeText(inputText);
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: analysis.type as any || "note",
            ...analysis,
            weather: getEntryWeather()
        };
        const updated = await storage.addEntry(newEntry);
        setEntries(updated);
        const crisisDays = await storage.getCrisisFreeDays();
        setCrisisFreeDays(crisisDays);
        setInputText("");
    };

    const handleQuickAction = async (type: "migraine" | "activity" | "medication") => {
        let text = "";
        switch (type) {
            case "migraine":
                text = "Crise signalée (Rapide)";
                break;
            case "activity":
                text = "Activité sportive (Rapide)";
                break;
            case "medication":
                text = "Prise de médicament (Rapide)";
                break;
        }
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type,
            notes: text,
            ...(type === "migraine" ? { intensity: 5 } : {}),
            ...(type === "activity" ? { activityType: "Sport", duration: 30, intensity: "medium" } : {}),
            ...(type === "medication" ? { name: "Médicament habituel", dosage: "1 dose" } : {}),
            weather: getEntryWeather()
        };
        const updated = await storage.addEntry(newEntry);
        setEntries(updated);
        const crisisDays = await storage.getCrisisFreeDays();
        setCrisisFreeDays(crisisDays);
    };

    const handleCrisisLog = async (data: {
        intensity: number;
        location: string;
        symptoms: string[];
        exactTime: string;
        endTime?: string;
        duration?: number;
        medicationAttempts?: any[];
        medicationName?: string;
        medicationDosage?: number;
        medicationTime?: string;
        reliefDuration?: number;
        reliefWithMedication?: boolean;
    }) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: "migraine",
            intensity: data.intensity,
            painLocation: data.location,
            symptoms: data.symptoms,
            exactTime: data.exactTime,
            endTime: data.endTime,
            duration: data.duration,
            medicationAttempts: data.medicationAttempts,
            medicationName: data.medicationName,
            medicationDosage: data.medicationDosage,
            medicationTime: data.medicationTime,
            reliefDuration: data.reliefDuration,
            reliefWithMedication: data.reliefWithMedication,
            notes: `Crise ${data.intensity}/10 - ${data.location} à ${data.exactTime}${data.duration ? ` (${data.duration}min)` : ""}`,
            weather: getEntryWeather()
        };
        const updated = await storage.addEntry(newEntry);
        setEntries(updated);
        const crisisDays = await storage.getCrisisFreeDays();
        setCrisisFreeDays(crisisDays);
        setShowCrisisMode(false);
    };

    const handleSportsLog = async (data: {
        activityType: string;
        exactTime: string;
        duration: number;
        intensity: "low" | "medium" | "high";
        caloriesBurned?: number;
    }) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: "activity",
            activityType: data.activityType,
            exactTime: data.exactTime,
            duration: data.duration,
            intensity: data.intensity,
            caloriesBurned: data.caloriesBurned,
            notes: `${data.activityType} - ${data.duration}min (${data.intensity})`,
            weather: getEntryWeather()
        };
        const updated = await storage.addEntry(newEntry);
        setEntries(updated);
        setShowSportsEntry(false);
    };

    const handleCalorieLog = async (data: {
        totalCalories: number;
        date: string;
        mealBreakdown?: {
            breakfast?: number;
            lunch?: number;
            dinner?: number;
            snacks?: number;
        };
    }) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: data.date, // Use provided date
            type: "calories",
            totalCalories: data.totalCalories,
            mealBreakdown: data.mealBreakdown,
            notes: `Calories journalières : ${data.totalCalories} kcal`,
            weather: getEntryWeather()
        };
        const updated = await storage.addEntry(newEntry);
        setEntries(updated);
        setShowCalorieReminder(false);
    };

    const handleScreenTimeLog = async (data: ScreenTimeData) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: data.date,
            type: "screentime",
            duration: data.duration,
            breakFrequency: data.breakFrequency,
            blueLightFilter: data.blueLightFilter,
            notes: `Temps d'écran : ${data.duration}h ${data.blueLightFilter ? '(Filtre bleu activé)' : ''}`,
            weather: getEntryWeather()
        };
        const updated = await storage.addEntry(newEntry);
        setEntries(updated);
        setShowScreenTimeInput(false);
    };

    const handleDelete = async (id: string) => {
        const updated = await storage.deleteEntry(id);
        setEntries(updated);
        const crisisDays = await storage.getCrisisFreeDays();
        setCrisisFreeDays(crisisDays);
    };

    const handleExportPDF = async () => {
        await exportService.toPDF(entries);
    };

    const handleExportData = async () => {
        try {
            const response = await fetch("/api/backup", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ entries }),
            });
            const result = await response.json();
            if (result.success) {
                alert(`✅ Sauvegarde réussie !\n\nFichier enregistré dans :\n${result.path}`);
            } else {
                throw new Error(result.message);
            }
        } catch (error) {
            console.error("Erreur sauvegarde:", error);
            const dataStr = JSON.stringify(entries, null, 2);
            const blob = new Blob([dataStr], { type: "application/json" });
            const url = URL.createObjectURL(blob);
            const link = document.createElement("a");
            link.href = url;
            link.download = `migraine-backup-${new Date().toISOString().split("T")[0]}.json`;
            link.click();
            URL.revokeObjectURL(url);
            alert("⚠️ Sauvegarde locale effectuée (le dossier serveur n'était pas accessible).");
        }
    };

    const handleImportData = (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (!file) return;
        const reader = new FileReader();
        reader.onload = (ev) => {
            try {
                const imported = JSON.parse(ev.target?.result as string);
                if (Array.isArray(imported)) {
                    const existing = new Set(entries.map((e) => e.id));
                    const newEntries = imported.filter((e) => !existing.has(e.id));
                    const merged = [...entries, ...newEntries].sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime());
                    localStorage.setItem("migraine-tracker-data", JSON.stringify(merged));
                    setEntries(merged);
                    alert(`✅ ${newEntries.length} nouvelles entrées importées avec succès !`);
                } else {
                    alert("❌ Format de fichier invalide");
                }
            } catch {
                alert("❌ Erreur lors de l'importation du fichier");
            }
        };
        reader.readAsText(file);
        if (fileInputRef.current) fileInputRef.current.value = "";
    };

    const handleExportExcel = async () => {
        await exportService.toExcel(entries);
    };

    const handleClearData = async () => {
        if (showClearConfirm) {
            await storage.clearAllData();
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

    const handleLogInjection = async () => {
        const today = new Date();
        const nextMonth = new Date(today);
        nextMonth.setMonth(nextMonth.getMonth() + 1);
        const treatmentEntry: any = {
            id: Date.now().toString(),
            date: today.toISOString(),
            type: "treatment",
            medicationName: "Aimovig SC",
            dosage: "140mg / 1ml",
            administrationRoute: "Injection sous-cutanée",
            nextDueDate: nextMonth.toISOString(),
            isPreventive: true,
            notes: "Injection mensuelle préventive Aimovig",
            weather: getEntryWeather()
        };
        const updated = await storage.addEntry(treatmentEntry);
        setEntries(updated);
        setLastTreatment(treatmentEntry);
        setDaysUntilNextInjection(30);
        alert("✅ Injection enregistrée ! Prochaine injection prévue dans 30 jours.");
    };

    const migraineCount = entries.filter((e) => e.type === "migraine").length;
    const avgIntensity =
        entries.filter((e) => e.type === "migraine").reduce((sum, e) => sum + ((e as any).intensity || 0), 0) / (migraineCount || 1);

    return (
        <div className="min-h-screen p-8">
            <div className="max-w-7xl mx-auto space-y-8">
                {/* Header */}
                <div className="flex flex-col xl:flex-row justify-between items-start xl:items-center gap-6">
                    <div className="flex flex-col md:flex-row items-start md:items-center gap-6">
                        <div>
                            <h1 className="text-4xl font-bold bg-gradient-to-r from-primary to-purple-600 bg-clip-text text-transparent">
                                MigraineChecker
                            </h1>
                            <p className="text-muted-foreground mt-2">Suivez vos migraines et découvrez vos déclencheurs</p>
                        </div>

                        {/* Weather Widget */}
                        {currentWeather && (
                            <Card className="bg-blue-50/50 border-blue-100 shadow-sm">
                                <CardContent className="p-3 flex items-center gap-4">
                                    <div className="text-center px-2 border-r border-blue-200/50">
                                        <div className="text-2xl">{weatherService.getWeatherIcon(currentWeather.weatherCode)}</div>
                                        <div className="text-[10px] uppercase tracking-wider text-muted-foreground font-semibold mt-1">
                                            {weatherService.getWeatherDescription(currentWeather.weatherCode)}
                                        </div>
                                    </div>
                                    <div className="flex gap-4 px-2">
                                        <div className="flex flex-col items-center">
                                            <div className="flex items-center gap-1 text-sm font-bold text-slate-700">
                                                <Cloud className="h-4 w-4 text-blue-500" />
                                                {currentWeather.temperature}°
                                            </div>
                                            <span className="text-[10px] text-muted-foreground">Temp.</span>
                                        </div>
                                        <div className="flex flex-col items-center">
                                            <div className="flex items-center gap-1 text-sm font-bold text-slate-700">
                                                <Gauge className="h-4 w-4 text-purple-500" />
                                                {currentWeather.pressure}
                                            </div>
                                            <span className="text-[10px] text-muted-foreground">hPa</span>
                                        </div>
                                        <div className="flex flex-col items-center">
                                            <div className="flex items-center gap-1 text-sm font-bold text-slate-700">
                                                <Droplets className="h-4 w-4 text-cyan-500" />
                                                {currentWeather.humidity}%
                                            </div>
                                            <span className="text-[10px] text-muted-foreground">Hum.</span>
                                        </div>
                                    </div>
                                </CardContent>
                            </Card>
                        )}
                    </div>

                    <div className="flex flex-wrap gap-2">
                        <Button onClick={() => setShowMedicalReport(true)} variant="default" size="sm">
                            <FileText className="h-4 w-4 mr-2" />
                            Rapport
                        </Button>
                        <Button variant="outline" size="sm" onClick={handleExportPDF}>
                            <FileDown className="h-4 w-4 mr-2" />
                            PDF
                        </Button>
                        <Button variant="outline" size="sm" onClick={handleExportExcel}>
                            <FileDown className="h-4 w-4 mr-2" />
                            Excel
                        </Button>
                        <Button variant="outline" size="sm" onClick={handleExportData}>
                            <FileDown className="h-4 w-4 mr-2" />
                            Sauvegarder
                        </Button>
                        <Button variant="outline" size="sm" onClick={() => fileInputRef.current?.click()}>
                            <FileDown className="h-4 w-4 mr-2" />
                            Restaurer
                        </Button>
                        <input
                            ref={fileInputRef}
                            type="file"
                            accept=".json"
                            onChange={handleImportData}
                            style={{ display: "none" }}
                        />
                    </div>
                </div>

                {/* AI Dashboard Grid */}
                <div className="grid grid-cols-1 md:grid-cols-2 gap-6 animate-in fade-in slide-in-from-top-4 duration-500">
                    {riskAssessment && <RiskIndicator assessment={riskAssessment} />}
                    <PredictionWidget
                        prediction={prediction}
                        isLoading={isPredicting}
                        dataCount={entries.length}
                        hasGarminData={prediction?.usedGarminData}
                    />
                </div>

                {/* Quick Actions */}
                <div className="flex justify-center gap-12 py-8">
                    <div className="flex flex-col items-center gap-3">
                        <Button
                            onClick={() => setShowCrisisMode(true)}
                            className="h-24 w-24 rounded-full shadow-lg text-4xl bg-red-600 hover:bg-red-700 transition-transform hover:scale-110"
                            variant="default"
                        >
                            🆘
                        </Button>
                        <span className="text-sm font-medium text-muted-foreground">Signaler une Crise</span>
                    </div>
                    <div className="flex flex-col items-center gap-3">
                        <Button
                            onClick={() => setShowSportsEntry(true)}
                            className="h-24 w-24 rounded-full shadow-lg text-4xl bg-green-600 hover:bg-green-700 transition-transform hover:scale-110"
                            variant="default"
                        >
                            🏃
                        </Button>
                        <span className="text-sm font-medium text-muted-foreground">Activité Sportive</span>
                    </div>
                    <div className="flex flex-col items-center gap-3">
                        <Button
                            onClick={() => setShowScreenTimeInput(true)}
                            className="h-24 w-24 rounded-full shadow-lg text-4xl bg-blue-600 hover:bg-blue-700 transition-transform hover:scale-110"
                            variant="default"
                        >
                            💻
                        </Button>
                        <span className="text-sm font-medium text-muted-foreground">Temps d'Écran</span>
                    </div>
                    <div className="flex flex-col items-center gap-3">
                        <Button
                            onClick={() => setShowCalorieReminder(true)}
                            className="h-24 w-24 rounded-full shadow-lg text-4xl bg-orange-600 hover:bg-orange-700 transition-transform hover:scale-110"
                            variant="default"
                        >
                            📊
                        </Button>
                        <span className="text-sm font-medium text-muted-foreground">Apport Calorique</span>
                    </div>
                </div>

                {/* Journal Entry */}
                <Card>
                    <CardHeader>
                        <CardTitle>Journal Rapide</CardTitle>
                        <CardDescription>Décrivez votre état, l'IA analysera automatiquement</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <textarea
                            className="w-full min-h-[100px] p-4 rounded-lg border bg-background text-foreground"
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
                                            <span className="font-medium capitalize">
                                                {entry.type === "treatment" ? "💉 Traitement" : entry.type}
                                            </span>
                                            {entry.type === "migraine" && (
                                                <span className="text-xs px-2 py-1 rounded-full bg-destructive/20 text-destructive">
                                                    Intensité: {(entry as any).intensity}/10
                                                </span>
                                            )}
                                            {entry.type === "treatment" && (
                                                <span className="text-xs px-2 py-1 rounded-full bg-purple-500/20 text-purple-600">
                                                    Aimovig 140mg
                                                </span>
                                            )}
                                            {entry.type === "activity" && (entry as any).caloriesBurned && (
                                                <span className="text-xs px-2 py-1 rounded-full bg-orange-500/20 text-orange-600">
                                                    🔥 {(entry as any).caloriesBurned} kcal
                                                </span>
                                            )}
                                            {entry.type === "calories" && (
                                                <span className="text-xs px-2 py-1 rounded-full bg-yellow-500/20 text-yellow-600">
                                                    🍎 {(entry as any).totalCalories} kcal
                                                </span>
                                            )}
                                            {entry.weather && (
                                                <span className="text-xs px-2 py-1 rounded-full bg-blue-500/10 text-blue-600 flex items-center gap-1" title={`${entry.weather.pressure} hPa`}>
                                                    {weatherService.getWeatherIcon(entry.weather.weatherCode)} {entry.weather.temperature}°C
                                                </span>
                                            )}
                                        </div>
                                        <p className="text-sm text-muted-foreground mt-1">{entry.notes || "Pas de notes"}</p>
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

                {/* Modals */}
                {showCrisisMode && <CrisisMode onClose={() => setShowCrisisMode(false)} onLogCrisis={handleCrisisLog} />}
                {showSportsEntry && <SportsQuickEntry onClose={() => setShowSportsEntry(false)} onSave={handleSportsLog} />}
                {showScreenTimeInput && <ScreenTimeInput onClose={() => setShowScreenTimeInput(false)} onSave={handleScreenTimeLog} />}
                {showCalorieReminder && (
                    <DailyCalorieReminder onClose={() => setShowCalorieReminder(false)} onSave={handleCalorieLog} />
                )}
                {showMedicalReport && <MedicalReport entries={entries} onClose={() => setShowMedicalReport(false)} />}
            </div>
        </div>
    );
}
