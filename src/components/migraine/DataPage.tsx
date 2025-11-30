"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { X, FileDown, Filter } from "lucide-react";
import { useState, useEffect } from "react";
import { storage } from "@/lib/storage";
import { JournalEntry } from "@/types";
import { format } from "date-fns";
import { fr } from "date-fns/locale";

interface DataPageProps {
    onClose: () => void;
}

export function DataPage({ onClose }: DataPageProps) {
    const [entries, setEntries] = useState<JournalEntry[]>([]);
    const [garminData, setGarminData] = useState<any[]>([]);
    const [stravaData, setStravaData] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);
    const [selectedTypes, setSelectedTypes] = useState<string[]>([
        "migraine", "activity", "medication", "treatment", "calories", "screentime"
    ]);

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
                const garminForDate = garminData.find(g =>
                    format(new Date(g.date), 'yyyy-MM-dd') === format(new Date(entry.date), 'yyyy-MM-dd')
                );

                return [
                    format(new Date(entry.date), 'dd/MM/yyyy HH:mm', { locale: fr }),
                    entry.type,
                    (entry as any).intensity || '',
                    entry.duration || '',
                    entry.notes || '',
                    entry.weather?.temperature || '',
                    entry.weather?.pressure || '',
                    entry.weather?.humidity || '',
                    (entry as any).totalCalories || (entry as any).caloriesBurned || '',
                    (entry as any).averageHeartRate || '',
                    garminForDate?.avgStress || '',
                    garminForDate?.sleepScore || ''
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
                const garminForDate = garminData.find(g =>
                    format(new Date(g.date), 'yyyy-MM-dd') === format(new Date(entry.date), 'yyyy-MM-dd')
                );

                return {
                    Date: format(new Date(entry.date), 'dd/MM/yyyy HH:mm', { locale: fr }),
                    Type: entry.type,
                    Intensité: (entry as any).intensity || '',
                    'Durée (min)': entry.duration || '',
                    Notes: entry.notes || '',
                    'Température (°C)': entry.weather?.temperature || '',
                    'Pression (hPa)': entry.weather?.pressure || '',
                    'Humidité (%)': entry.weather?.humidity || '',
                    Calories: (entry as any).totalCalories || (entry as any).caloriesBurned || '',
                    'FC Moyenne': (entry as any).averageHeartRate || '',
                    Stress: garminForDate?.avgStress || '',
                    'Score Sommeil': garminForDate?.sleepScore || ''
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

                {/* Filters */}
                <Card className="mb-8">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2">
                            <Filter className="h-5 w-5" />
                            Filtres de Données
                        </CardTitle>
                        <CardDescription>Sélectionnez les types de données à afficher et exporter</CardDescription>
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

                {/* Summary Stats */}
                <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
                    <Card>
                        <CardContent className="p-4 text-center">
                            <div className="text-3xl font-bold text-primary">{entries.length}</div>
                            <div className="text-sm text-muted-foreground">Entrées Journal</div>
                        </CardContent>
                    </Card>
                    <Card>
                        <CardContent className="p-4 text-center">
                            <div className="text-3xl font-bold text-primary">{garminData.length}</div>
                            <div className="text-sm text-muted-foreground">Données Garmin</div>
                        </CardContent>
                    </Card>
                    <Card>
                        <CardContent className="p-4 text-center">
                            <div className="text-3xl font-bold text-primary">{stravaData.length}</div>
                            <div className="text-sm text-muted-foreground">Activités Strava</div>
                        </CardContent>
                    </Card>
                    <Card>
                        <CardContent className="p-4 text-center">
                            <div className="text-3xl font-bold text-primary">{filteredEntries.length}</div>
                            <div className="text-sm text-muted-foreground">Données Filtrées</div>
                        </CardContent>
                    </Card>
                </div>

                {/* Data Table */}
                <Card>
                    <CardHeader>
                        <CardTitle>Tableau de Données</CardTitle>
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
                                        <th className="p-2">Santé</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {filteredEntries.slice(0, 100).map((entry) => {
                                        const garminForDate = garminData.find(g =>
                                            format(new Date(g.date), 'yyyy-MM-dd') === format(new Date(entry.date), 'yyyy-MM-dd')
                                        );

                                        return (
                                            <tr key={entry.id} className="border-b hover:bg-muted/50">
                                                <td className="p-2 whitespace-nowrap">
                                                    {format(new Date(entry.date), 'dd/MM/yyyy HH:mm', { locale: fr })}
                                                </td>
                                                <td className="p-2">
                                                    <span className="px-2 py-1 rounded text-xs bg-primary/20">
                                                        {entry.type}
                                                    </span>
                                                </td>
                                                <td className="p-2">
                                                    {entry.type === 'migraine' && `Intensité: ${(entry as any).intensity}/10`}
                                                    {entry.type === 'activity' && `${entry.duration}min - ${(entry as any).intensity}`}
                                                    {entry.type === 'calories' && `${(entry as any).totalCalories} kcal`}
                                                    {entry.type === 'screentime' && `${entry.duration}h`}
                                                </td>
                                                <td className="p-2 text-xs">
                                                    {entry.weather && (
                                                        <div>
                                                            {entry.weather.temperature}°C, {entry.weather.pressure}hPa
                                                        </div>
                                                    )}
                                                </td>
                                                <td className="p-2 text-xs">
                                                    {garminForDate && (
                                                        <div>
                                                            Sommeil: {garminForDate.sleepScore}, Stress: {garminForDate.avgStress}
                                                        </div>
                                                    )}
                                                </td>
                                            </tr>
                                        );
                                    })}
                                </tbody>
                            </table>
                        </div>
                        {filteredEntries.length > 100 && (
                            <p className="text-sm text-muted-foreground mt-4 text-center">
                                Affichage des 100 premières entrées. Exportez pour voir toutes les données.
                            </p>
                        )}
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
