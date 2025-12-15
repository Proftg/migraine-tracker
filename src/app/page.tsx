"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Plus, Trash2, Cloud, Droplets, Gauge } from "lucide-react";
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
import { NavigationMenu, QuickActionsMenu, ExportMenu } from "@/components/migraine/NavigationMenu";
import { DataPage } from "@/components/migraine/DataPage";
import { SettingsPage } from "@/components/migraine/SettingsPage";
import { TreatmentCard } from "@/components/migraine/TreatmentCard";

type PageView = 'dashboard' | 'report' | 'data' | 'settings';

export default function Home() {
    const [currentView, setCurrentView] = useState<PageView>('dashboard');
    const [entries, setEntries] = useState<JournalEntry[]>([]);
    const [inputText, setInputText] = useState("");

    // Modals state
    const [showCrisisMode, setShowCrisisMode] = useState(false);
    const [showSportsEntry, setShowSportsEntry] = useState(false);
    const [showScreenTimeInput, setShowScreenTimeInput] = useState(false);
    const [showCalorieReminder, setShowCalorieReminder] = useState(false);

    const fileInputRef = useRef<HTMLInputElement>(null);
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
        setInputText("");
    };

    const handleQuickAction = (actionId: string) => {
        switch (actionId) {
            case 'crisis': setShowCrisisMode(true); break;
            case 'sports': setShowSportsEntry(true); break;
            case 'screentime': setShowScreenTimeInput(true); break;
            case 'calories': setShowCalorieReminder(true); break;
        }
    };

    const handleTreatmentLog = async (data: any) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            type: "treatment",
            date: data.date,
            medicationName: data.medicationName,
            dosage: data.dosage,
            administrationRoute: data.administrationRoute,
            isPreventive: data.isPreventive,
            notes: data.notes,
            weather: getEntryWeather()
        } as JournalEntry;
        const updated = await storage.addEntry(newEntry);
        setEntries(updated);
    };

    const handleCrisisLog = async (data: any) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: "migraine",
            ...data,
            notes: `Crise ${data.intensity}/10 - ${data.location} à ${data.exactTime}${data.duration ? ` (${data.duration}min)` : ""}`,
            weather: getEntryWeather()
        };
        const updated = await storage.addEntry(newEntry);
        setEntries(updated);
        setShowCrisisMode(false);
    };

    const handleSportsLog = async (data: any) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: new Date().toISOString(),
            type: "activity",
            ...data,
            notes: `${data.activityType} - ${data.duration}min (${data.intensity})`,
            weather: getEntryWeather()
        };
        const updated = await storage.addEntry(newEntry);
        setEntries(updated);
        setShowSportsEntry(false);
    };

    const handleCalorieLog = async (data: any) => {
        const newEntry: JournalEntry = {
            id: Date.now().toString(),
            date: data.date,
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
    };

    const handleExport = async (type: 'pdf' | 'excel' | 'backup') => {
        switch (type) {
            case 'pdf': await exportService.toPDF(entries); break;
            case 'excel': await exportService.toExcel(entries); break;
            case 'backup':
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
                break;
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

    return (
        <div className="min-h-screen p-4 md:p-8 bg-background">
            <div className="max-w-7xl mx-auto space-y-8">
                {/* Header & Navigation */}
                <div className="flex flex-col gap-6">
                    <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                        <div>
                            <h1 className="text-4xl font-bold bg-gradient-to-r from-primary to-purple-600 bg-clip-text text-transparent">
                                MigraineChecker
                            </h1>
                            <p className="text-muted-foreground mt-2">Assistant Intelligent de Suivi</p>
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

                    <NavigationMenu
                        onNavigate={setCurrentView}
                        currentPage={currentView}
                    />
                </div>

                {/* Main Content Area */}
                {currentView === 'dashboard' && (
                    <div className="space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-500">
                        {/* AI Dashboard Grid */}
                        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                            {riskAssessment && <RiskIndicator assessment={riskAssessment} />}
                            <PredictionWidget
                                prediction={prediction}
                                isLoading={isPredicting}
                                dataCount={entries.length}
                                hasGarminData={prediction?.usedGarminData}
                            />
                            <TreatmentCard entries={entries} onLogTreatment={handleTreatmentLog} />
                        </div>

                        {/* Quick Actions & Export */}
                        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
                            <div className="lg:col-span-2">
                                <QuickActionsMenu onAction={handleQuickAction} />
                            </div>
                            <Card className="p-6 flex flex-col justify-center gap-4">
                                <h3 className="font-semibold">Gestion des Données</h3>
                                <ExportMenu
                                    onExport={handleExport}
                                    onImport={() => fileInputRef.current?.click()}
                                />
                                <input
                                    ref={fileInputRef}
                                    type="file"
                                    accept=".json"
                                    onChange={handleImportData}
                                    style={{ display: "none" }}
                                />
                            </Card>
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
                                    {entries.slice(0, 5).map((entry) => (
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
                                                    {entry.weather && (
                                                        <span className="text-xs px-2 py-1 rounded-full bg-blue-500/10 text-blue-600 flex items-center gap-1">
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
                                    <Button
                                        variant="ghost"
                                        className="w-full"
                                        onClick={() => setCurrentView('data')}
                                    >
                                        Voir tout l'historique
                                    </Button>
                                </div>
                            </CardContent>
                        </Card>
                    </div>
                )}

                {/* Sub-Pages */}
                {currentView === 'report' && (
                    <MedicalReport
                        entries={entries}
                        onClose={() => setCurrentView('dashboard')}
                    />
                )}

                {currentView === 'data' && (
                    <DataPage onClose={() => setCurrentView('dashboard')} />
                )}

                {currentView === 'settings' && (
                    <SettingsPage onClose={() => setCurrentView('dashboard')} />
                )}

                {/* Modals */}
                {showCrisisMode && <CrisisMode onClose={() => setShowCrisisMode(false)} onLogCrisis={handleCrisisLog} />}
                {showSportsEntry && <SportsQuickEntry onClose={() => setShowSportsEntry(false)} onSave={handleSportsLog} />}
                {showScreenTimeInput && <ScreenTimeInput onClose={() => setShowScreenTimeInput(false)} onSave={handleScreenTimeLog} />}
                {showCalorieReminder && (
                    <DailyCalorieReminder onClose={() => setShowCalorieReminder(false)} onSave={handleCalorieLog} />
                )}
            </div>
        </div>
    );
}
