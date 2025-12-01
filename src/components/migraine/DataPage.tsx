"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { X, FileDown, Filter, RefreshCw } from "lucide-react";
import { useState, useEffect } from "react";
import { storage } from "@/lib/storage";
import { JournalEntry } from "@/types";
import { format } from "date-fns";
import { fr } from "date-fns/locale";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";

interface DataPageProps {
    onClose: () => void;
}

export function DataPage({ onClose }: DataPageProps) {
    const [entries, setEntries] = useState<JournalEntry[]>([]);
    const [garminData, setGarminData] = useState<any[]>([]);
    const [stravaData, setStravaData] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [syncingGarmin, setSyncingGarmin] = useState(false);
    const [syncingStrava, setSyncingStrava] = useState(false);
    const [selectedTypes, setSelectedTypes] = useState<string[]>([
        "migraine", "activity", "medication", "treatment", "calories", "screentime"
    ]);

    // Helper function to safely format dates
    const safeFormatDate = (dateValue: any, formatStr: string) => {
        try {
            if (!dateValue) return '-';
            const date = new Date(dateValue);
            if (isNaN(date.getTime())) return '-';
            return format(date, formatStr, { locale: fr });
        } catch {
            return '-';
        }
    };

    useEffect(() => {
        loadAllData();
    }, []);

    const loadAllData = async () => {
        try {
            // Load journal entries
            const journalEntries = await storage.getEntries();
            setEntries(journalEntries);

            // Load Garmin data
            const garminRes = await fetch('/api/garmin/metrics');
            const garminJson = await garminRes.json();
            if (garminJson.success) {
                setGarminData(garminJson.data);
            }

            // Load Strava data
            const stravaRes = await fetch('/api/strava/activities');
            const stravaJson = await stravaRes.json();
            if (stravaJson.success) {
                setStravaData(stravaJson.data);
            }
        } catch (error) {
            console.error("Error loading data:", error);
        } finally {
            setLoading(false);
        }
    };

    const handleSyncGarmin = async () => {
        setSyncingGarmin(true);
        try {
            const res = await fetch('/api/garmin/sync', { method: 'POST' });
            const data = await res.json();
            if (data.success) {
                alert('✅ Synchronisation Garmin réussie !');
                loadAllData();
            } else {
                alert('❌ Erreur lors de la synchronisation Garmin');
            }
        } catch (error) {
            console.error(error);
            alert('❌ Erreur réseau');
        } finally {
            setSyncingGarmin(false);
        }
    };

    const handleSyncStrava = async () => {
        setSyncingStrava(true);
        try {
            const res = await fetch('/api/strava/sync', { method: 'POST' });
            const data = await res.json();
            if (data.success) {
                alert('✅ Synchronisation Strava réussie !');
                loadAllData();
            } else {
                alert('❌ Erreur lors de la synchronisation Strava');
            }
        } catch (error) {
            console.error(error);
            alert('❌ Erreur réseau');
        } finally {
            setSyncingStrava(false);
        }
    };

    const exportToCSV = () => {
        const headers = [
            "Date",
            "Type",
            "Intensité",
            "Durée (min)",
            "Notes",
            "Température (°C)",
            "Pression (hPa)",
            "Humidité (%)",
            "Calories",
            "FC Moyenne",
            "Stress",
            "Score Sommeil"
        ];

        const rows = entries
            .filter(e => selectedTypes.includes(e.type))
            .map(entry => {
                const e = entry as any;
                const entryDateStr = safeFormatDate(e.date, 'yyyy-MM-dd');
                const garminForDate = garminData.find(g =>
                    safeFormatDate(g.date, 'yyyy-MM-dd') === entryDateStr
                );

                return [
                    safeFormatDate(e.date, 'dd/MM/yyyy HH:mm'),
                    e.type,
                    e.intensity || '',
                    e.duration || '',
                    e.notes || '',
                    e.weather?.temperature ?? '',
                    e.weather?.pressure ?? '',
                    e.weather?.humidity ?? '',
                    e.totalCalories || e.caloriesBurned || '',
                    e.averageHeartRate || '',
                    garminForDate?.stress_avg || '',
                    garminForDate?.sleep_score || ''
                ].join(',');
            });

        const csv = [headers.join(','), ...rows].join('\n');
        const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
        const url = URL.createObjectURL(blob);
        const link = document.createElement('a');
        link.href = url;
        link.download = `migraine-data-${format(new Date(), 'yyyy-MM-dd')}.csv`;
        link.click();
        URL.revokeObjectURL(url);
    };

    const exportToExcel = async () => {
        const data = entries
            .filter(e => selectedTypes.includes(e.type))
            .map(entry => {
                const e = entry as any;
                const entryDateStr = safeFormatDate(e.date, 'yyyy-MM-dd');
                const garminForDate = garminData.find(g =>
                    safeFormatDate(g.date, 'yyyy-MM-dd') === entryDateStr
                );

                return {
                    Date: safeFormatDate(e.date, 'dd/MM/yyyy HH:mm'),
                    Type: e.type,
                    Intensité: e.intensity || '',
                    'Durée (min)': e.duration || '',
                    Notes: e.notes || '',
                    'Température (°C)': e.weather?.temperature ?? '',
                    'Pression (hPa)': e.weather?.pressure ?? '',
                    'Humidité (%)': e.weather?.humidity ?? '',
                    Calories: e.totalCalories || e.caloriesBurned || '',
                    'FC Moyenne': e.averageHeartRate || '',
                    Stress: garminForDate?.stress_avg || '',
                    'Score Sommeil': garminForDate?.sleep_score || ''
                };
            });

        // Use existing export service
        const XLSX = await import('xlsx');
        const ws = XLSX.utils.json_to_sheet(data);
        const wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Données');
        XLSX.writeFile(wb, `migraine-data-${format(new Date(), 'yyyy-MM-dd')}.xlsx`);
    };

    const toggleType = (type: string) => {
        setSelectedTypes(prev =>
            prev.includes(type)
                ? prev.filter(t => t !== type)
                : [...prev, type]
        );
    };

    const filteredEntries = entries.filter(e => selectedTypes.includes(e.type));

    return (
        <div className="fixed inset-0 z-50 bg-background overflow-y-auto">
            <div className="max-w-7xl mx-auto p-8 pb-16">
                {/* Header */}
                <div className="flex justify-between items-start mb-8">
                    <div>
                        <h1 className="text-4xl font-bold mb-2">Données Complètes</h1>
                        <p className="text-muted-foreground">
                            Visualisez et exportez toutes vos données
                        </p>
                    </div>
                    <div className="flex gap-2">
                        <Button variant="outline" onClick={exportToCSV}>
                            <FileDown className="h-4 w-4 mr-2" />
                            Export CSV
                        </Button>
                        <Button variant="outline" onClick={exportToExcel}>
                            <FileDown className="h-4 w-4 mr-2" />
                            Export Excel
                        </Button>
                        <Button variant="ghost" size="icon" onClick={onClose}>
                            <X className="h-6 w-6" />
                        </Button>
                    </div>
                </div>

                <Tabs defaultValue="journal" className="w-full">
                    <TabsList className="grid w-full grid-cols-3 mb-8">
                        <TabsTrigger value="journal">Journal & Météo</TabsTrigger>
                        <TabsTrigger value="garmin">Garmin Health</TabsTrigger>
                        <TabsTrigger value="strava">Strava Activities</TabsTrigger>
                    </TabsList>

                    <TabsContent value="journal">
                        {/* Filters */}
                        <Card className="mb-8">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <Filter className="h-5 w-5" />
                                    Filtres de Données
                                </CardTitle>
                                <CardDescription>Sélectionnez les types de données à afficher</CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="flex flex-wrap gap-2">
                                    {[
                                        { type: 'migraine', label: '🤕 Migraines', color: 'bg-red-500' },
                                        { type: 'activity', label: '🏃 Activités', color: 'bg-green-500' },
                                        { type: 'medication', label: '💊 Médicaments', color: 'bg-blue-500' },
                                        { type: 'treatment', label: '💉 Traitements', color: 'bg-purple-500' },
                                        { type: 'calories', label: '🍎 Calories', color: 'bg-yellow-500' },
                                        { type: 'screentime', label: '💻 Temps d\'écran', color: 'bg-cyan-500' }
                                    ].map(({ type, label, color }) => (
                                        <Button
                                            key={type}
                                            variant={selectedTypes.includes(type) ? 'default' : 'outline'}
                                            size="sm"
                                            onClick={() => toggleType(type)}
                                            className={selectedTypes.includes(type) ? color : ''}
                                        >
                                            {label}
                                        </Button>
                                    ))}
                                </div>
                            </CardContent>
                        </Card>

                        {/* Data Table */}
                        <Card>
                            <CardHeader>
                                <CardTitle>Journal des Entrées</CardTitle>
                                <CardDescription>{filteredEntries.length} entrées affichées</CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="overflow-x-auto">
                                    <table className="w-full text-sm">
                                        <thead className="border-b">
                                            <tr className="text-left">
                                                <th className="p-2">Date</th>
                                                <th className="p-2">Type</th>
                                                <th className="p-2">Détails</th>
                                                <th className="p-2">Météo</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {filteredEntries.slice(0, 100).map((entry) => {
                                                const e = entry as any;
                                                return (
                                                    <tr key={e.id} className="border-b hover:bg-muted/50">
                                                        <td className="p-2 whitespace-nowrap">
                                                            {safeFormatDate(e.date, 'dd/MM/yyyy HH:mm')}
                                                        </td>
                                                        <td className="p-2">
                                                            <span className="px-2 py-1 rounded text-xs bg-primary/20">
                                                                {e.type}
                                                            </span>
                                                        </td>
                                                        <td className="p-2">
                                                            {e.type === 'migraine' && `Intensité: ${e.intensity}/10`}
                                                            {e.type === 'activity' && `${e.duration}min - ${e.intensity}`}
                                                            {e.type === 'calories' && `${e.totalCalories} kcal`}
                                                            {e.type === 'screentime' && `${e.duration}h`}
                                                        </td>
                                                        <td className="p-2 text-xs">
                                                            {e.weather && (
                                                                <div>
                                                                    {e.weather.temperature}°C, {e.weather.pressure}hPa
                                                                </div>
                                                            )}
                                                        </td>
                                                    </tr>
                                                );
                                            })}
                                        </tbody>
                                    </table>
                                </div>
                            </CardContent>
                        </Card>
                    </TabsContent>

                    <TabsContent value="garmin">
                        <Card>
                            <CardHeader className="flex flex-row items-center justify-between">
                                <div>
                                    <CardTitle>Données Garmin</CardTitle>
                                    <CardDescription>Métriques de santé synchronisées</CardDescription>
                                </div>
                                <Button onClick={handleSyncGarmin} disabled={syncingGarmin}>
                                    <RefreshCw className={`h-4 w-4 mr-2 ${syncingGarmin ? 'animate-spin' : ''}`} />
                                    Synchroniser
                                </Button>
                            </CardHeader>
                            <CardContent>
                                <div className="overflow-x-auto">
                                    <table className="w-full text-sm">
                                        <thead className="border-b">
                                            <tr className="text-left">
                                                <th className="p-2">Date</th>
                                                <th className="p-2">Score Sommeil</th>
                                                <th className="p-2">Stress Moyen</th>
                                                <th className="p-2">FC Repos</th>
                                                <th className="p-2">Heures Sommeil</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {garminData.map((data, i) => (
                                                <tr key={i} className="border-b hover:bg-muted/50">
                                                    <td className="p-2 whitespace-nowrap">
                                                        {safeFormatDate(data.date, 'dd/MM/yyyy')}
                                                    </td>
                                                    <td className="p-2 font-medium">{data.sleep_score ?? '-'}</td>
                                                    <td className="p-2">{data.stress_avg ?? '-'}</td>
                                                    <td className="p-2">{data.resting_hr ? `${data.resting_hr} bpm` : '-'}</td>
                                                    <td className="p-2">{data.sleep_seconds ? `${(data.sleep_seconds / 3600).toFixed(1)}h` : '-'}</td>
                                                </tr>
                                            ))}
                                            {garminData.length === 0 && (
                                                <tr>
                                                    <td colSpan={5} className="p-4 text-center text-muted-foreground">
                                                        Aucune donnée Garmin disponible. Cliquez sur Synchroniser.
                                                    </td>
                                                </tr>
                                            )}
                                        </tbody>
                                    </table>
                                </div>
                            </CardContent>
                        </Card>
                    </TabsContent>

                    <TabsContent value="strava">
                        <Card>
                            <CardHeader className="flex flex-row items-center justify-between">
                                <div>
                                    <CardTitle>Activités Strava</CardTitle>
                                    <CardDescription>Activités sportives synchronisées</CardDescription>
                                </div>
                                <Button onClick={handleSyncStrava} disabled={syncingStrava}>
                                    <RefreshCw className={`h-4 w-4 mr-2 ${syncingStrava ? 'animate-spin' : ''}`} />
                                    Synchroniser
                                </Button>
                            </CardHeader>
                            <CardContent>
                                <div className="overflow-x-auto">
                                    <table className="w-full text-sm">
                                        <thead className="border-b">
                                            <tr className="text-left">
                                                <th className="p-2">Date</th>
                                                <th className="p-2">Nom</th>
                                                <th className="p-2">Durée</th>
                                                <th className="p-2">Distance</th>
                                                <th className="p-2">FC Moyenne</th>
                                                <th className="p-2">Suffer Score</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {stravaData.map((activity, i) => (
                                                <tr key={i} className="border-b hover:bg-muted/50">
                                                    <td className="p-2 whitespace-nowrap">
                                                        {safeFormatDate(activity.date, 'dd/MM/yyyy HH:mm')}
                                                    </td>
                                                    <td className="p-2 font-medium">{activity.notes || activity.activityType || '-'}</td>
                                                    <td className="p-2">{activity.duration ? `${activity.duration} min` : '-'}</td>
                                                    <td className="p-2">{activity.distance ? `${(activity.distance / 1000).toFixed(2)} km` : '-'}</td>
                                                    <td className="p-2">{activity.averageHeartRate ? `${activity.averageHeartRate} bpm` : '-'}</td>
                                                    <td className="p-2">{activity.sufferScore ?? '-'}</td>
                                                </tr>
                                            ))}
                                            {stravaData.length === 0 && (
                                                <tr>
                                                    <td colSpan={6} className="p-4 text-center text-muted-foreground">
                                                        Aucune activité Strava disponible. Cliquez sur Synchroniser.
                                                    </td>
                                                </tr>
                                            )}
                                        </tbody>
                                    </table>
                                </div>
                            </CardContent>
                        </Card>
                    </TabsContent>
                </Tabs>
            </div>
        </div>
    );
}
