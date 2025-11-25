import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { X } from "lucide-react";
import { useState } from "react";

interface SportsQuickEntryProps {
    onClose: () => void;
    onSave: (data: SportsData) => void;
}

export interface SportsData {
    activityType: string;
    exactTime: string;
    duration: number;
    intensity: 'low' | 'medium' | 'high';
    caloriesBurned?: number;
}

const sportTypes = [
    { value: 'Course à pieds', emoji: '🏃', color: 'bg-blue-600 hover:bg-blue-700' },
    { value: 'Vélo', emoji: '🚴', color: 'bg-green-600 hover:bg-green-700' },
    { value: 'Natation', emoji: '🏊', color: 'bg-cyan-600 hover:bg-cyan-700' },
    { value: 'Musculation', emoji: '💪', color: 'bg-orange-600 hover:bg-orange-700' }
];

export function SportsQuickEntry({ onClose, onSave }: SportsQuickEntryProps) {
    const [sportType, setSportType] = useState('');
    const [exactTime, setExactTime] = useState(new Date().toTimeString().slice(0, 5));
    const [duration, setDuration] = useState(30);
    const [intensity, setIntensity] = useState<'low' | 'medium' | 'high'>('medium');
    const [caloriesBurned, setCaloriesBurned] = useState<number | undefined>();

    const handleSave = () => {
        if (!sportType) return;

        const data: SportsData = {
            activityType: sportType,
            exactTime,
            duration,
            intensity,
            caloriesBurned
        };

        onSave(data);
        onClose();
    };

    return (
        <div className="fixed inset-0 z-50 bg-background/95 backdrop-blur-sm flex items-center justify-center p-4">
            <Card className="w-full max-w-lg">
                <CardHeader className="flex flex-row items-center justify-between">
                    <CardTitle className="text-2xl">🏃 Activité Sportive</CardTitle>
                    <Button variant="ghost" size="icon" onClick={onClose}>
                        <X className="h-6 w-6" />
                    </Button>
                </CardHeader>
                <CardContent className="space-y-6">
                    {/* Sport Type Selection */}
                    <div>
                        <label className="block text-sm font-medium mb-3">Type de sport</label>
                        <div className="grid grid-cols-2 gap-3">
                            {sportTypes.map(sport => (
                                <Button
                                    key={sport.value}
                                    variant={sportType === sport.value ? 'default' : 'outline'}
                                    className={`h-20 text-lg ${sportType === sport.value ? sport.color : ''}`}
                                    onClick={() => setSportType(sport.value)}
                                >
                                    <span className="text-3xl mr-3">{sport.emoji}</span>
                                    {sport.value}
                                </Button>
                            ))}
                        </div>
                    </div>

                    {/* Time */}
                    <div>
                        <label className="block text-sm font-medium mb-2">Heure de l'activité</label>
                        <input
                            type="time"
                            className="w-full p-3 text-lg border rounded-lg bg-background"
                            value={exactTime}
                            onChange={(e) => setExactTime(e.target.value)}
                        />
                    </div>

                    {/* Duration */}
                    <div>
                        <label className="block text-sm font-medium mb-2">Durée (minutes)</label>
                        <input
                            type="number"
                            className="w-full p-3 border rounded-lg bg-background"
                            value={duration}
                            onChange={(e) => setDuration(Number(e.target.value))}
                            min="1"
                        />
                    </div>

                    {/* Calories Burned */}
                    <div>
                        <label className="block text-sm font-medium mb-2">Calories brûlées (optionnel)</label>
                        <input
                            type="number"
                            className="w-full p-3 border rounded-lg bg-background"
                            placeholder="Ex: 300"
                            value={caloriesBurned || ''}
                            onChange={(e) => setCaloriesBurned(e.target.value ? Number(e.target.value) : undefined)}
                        />
                        <p className="text-xs text-muted-foreground mt-1">
                            Estimation basée sur votre activité
                        </p>
                    </div>

                    {/* Intensity */}
                    <div>
                        <label className="block text-sm font-medium mb-2">Intensité</label>
                        <div className="grid grid-cols-3 gap-2">
                            <Button
                                variant={intensity === 'low' ? 'default' : 'outline'}
                                onClick={() => setIntensity('low')}
                                className="h-12"
                            >
                                Faible
                            </Button>
                            <Button
                                variant={intensity === 'medium' ? 'default' : 'outline'}
                                onClick={() => setIntensity('medium')}
                                className="h-12"
                            >
                                Moyenne
                            </Button>
                            <Button
                                variant={intensity === 'high' ? 'default' : 'outline'}
                                onClick={() => setIntensity('high')}
                                className="h-12"
                            >
                                Élevée
                            </Button>
                        </div>
                    </div>

                    {/* Actions */}
                    <div className="flex gap-3 pt-4">
                        <Button variant="outline" onClick={onClose} className="flex-1">
                            Annuler
                        </Button>
                        <Button
                            onClick={handleSave}
                            disabled={!sportType}
                            className="flex-1"
                        >
                            Enregistrer
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
