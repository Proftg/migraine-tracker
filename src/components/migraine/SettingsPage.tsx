"use client";

import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { X, Save } from "lucide-react";
import { useState, useEffect } from "react";
import { Switch } from "@/components/ui/switch";

interface SettingsPageProps {
    onClose: () => void;
}

interface PredictionSettings {
    useWeather: boolean;
    useGarmin: boolean;
    useStrava: boolean;
    useScreenTime: boolean;
    useCalories: boolean;
    useActivities: boolean;
}

export function SettingsPage({ onClose }: SettingsPageProps) {
    const [settings, setSettings] = useState<PredictionSettings>({
        useWeather: true,
        useGarmin: true,
        useStrava: true,
        useScreenTime: true,
        useCalories: true,
        useActivities: true
    });

    useEffect(() => {
        // Load settings from localStorage
        const saved = localStorage.getItem('prediction-settings');
        if (saved) {
            setSettings(JSON.parse(saved));
        }
    }, []);

    const handleSave = () => {
        localStorage.setItem('prediction-settings', JSON.stringify(settings));
        alert('✅ Configuration sauvegardée !');
        onClose();
    };

    const toggleSetting = (key: keyof PredictionSettings) => {
        setSettings(prev => ({
            ...prev,
            [key]: !prev[key]
        }));
    };

    const dataSourcesConfig = [
        {
            key: 'useWeather' as keyof PredictionSettings,
            label: 'Données Météo',
            description: 'Température, pression atmosphérique, humidité',
            icon: '🌤️',
            impact: 'Élevé'
        },
        {
            key: 'useGarmin' as keyof PredictionSettings,
            label: 'Données Garmin',
            description: 'Score de sommeil, niveau de stress, fréquence cardiaque',
            icon: '⌚',
            impact: 'Très élevé'
        },
        {
            key: 'useStrava' as keyof PredictionSettings,
            label: 'Données Strava',
            description: 'Charge d\'entraînement (Suffer Score), activités sportives',
            icon: '🏃',
            impact: 'Élevé'
        },
        {
            key: 'useScreenTime' as keyof PredictionSettings,
            label: 'Temps d\'Écran',
            description: 'Durée quotidienne, pauses, filtre lumière bleue',
            icon: '💻',
            impact: 'Moyen'
        },
        {
            key: 'useCalories' as keyof PredictionSettings,
            label: 'Apport Calorique',
            description: 'Calories consommées et dépensées',
            icon: '🍎',
            impact: 'Moyen'
        },
        {
            key: 'useActivities' as keyof PredictionSettings,
            label: 'Activités Manuelles',
            description: 'Activités enregistrées manuellement',
            icon: '📝',
            impact: 'Moyen'
        }
    ];

    const enabledCount = Object.values(settings).filter(Boolean).length;

    return (
        <div className="fixed inset-0 z-50 bg-background overflow-y-auto">
            <div className="max-w-4xl mx-auto p-8 pb-16">
                {/* Header */}
                <div className="flex justify-between items-start mb-8">
                    <div>
                        <h1 className="text-4xl font-bold mb-2">Configuration de la Prédiction</h1>
                        <p className="text-muted-foreground">
                            Choisissez les sources de données à utiliser pour le modèle de prédiction IA
                        </p>
                    </div>
                    <div className="flex gap-2">
                        <Button onClick={handleSave}>
                            <Save className="h-4 w-4 mr-2" />
                            Sauvegarder
                        </Button>
                        <Button variant="ghost" size="icon" onClick={onClose}>
                            <X className="h-6 w-6" />
                        </Button>
                    </div>
                </div>

                {/* Summary */}
                <Card className="mb-8 border-primary/30 bg-primary/5">
                    <CardContent className="p-6">
                        <div className="flex items-center justify-between">
                            <div>
                                <div className="text-2xl font-bold text-primary">{enabledCount}/6</div>
                                <div className="text-sm text-muted-foreground">Sources de données actives</div>
                            </div>
                            <div className="text-sm text-muted-foreground">
                                Plus vous activez de sources, plus la prédiction sera précise
                            </div>
                        </div>
                    </CardContent>
                </Card>

                {/* Data Sources */}
                <div className="space-y-4">
                    {dataSourcesConfig.map((source) => (
                        <Card key={source.key} className={settings[source.key] ? 'border-primary/50' : ''}>
                            <CardContent className="p-6">
                                <div className="flex items-start justify-between">
                                    <div className="flex items-start gap-4 flex-1">
                                        <div className="text-4xl">{source.icon}</div>
                                        <div className="flex-1">
                                            <div className="flex items-center gap-3 mb-2">
                                                <h3 className="font-semibold text-lg">{source.label}</h3>
                                                <span className={`
                                                    text-xs px-2 py-1 rounded-full
                                                    ${source.impact === 'Très élevé' ? 'bg-red-100 text-red-700' : ''}
                                                    ${source.impact === 'Élevé' ? 'bg-orange-100 text-orange-700' : ''}
                                                    ${source.impact === 'Moyen' ? 'bg-yellow-100 text-yellow-700' : ''}
                                                `}>
                                                    Impact: {source.impact}
                                                </span>
                                            </div>
                                            <p className="text-sm text-muted-foreground">{source.description}</p>
                                        </div>
                                    </div>
                                    <Switch
                                        checked={settings[source.key]}
                                        onCheckedChange={() => toggleSetting(source.key)}
                                    />
                                </div>
                            </CardContent>
                        </Card>
                    ))}
                </div>

                {/* Info */}
                <Card className="mt-8 bg-blue-50/50 border-blue-200">
                    <CardContent className="p-6">
                        <h3 className="font-semibold mb-2">ℹ️ À propos de la configuration</h3>
                        <ul className="text-sm text-muted-foreground space-y-2">
                            <li>• Les changements prendront effet lors de la prochaine prédiction</li>
                            <li>• Il est recommandé d'activer au moins 3 sources pour une prédiction fiable</li>
                            <li>• Les données Garmin et Météo ont le plus grand impact sur la précision</li>
                            <li>• Vous pouvez modifier ces paramètres à tout moment</li>
                        </ul>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
