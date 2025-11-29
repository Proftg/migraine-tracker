import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { X, Calendar, Monitor, Clock } from "lucide-react";
import { useState } from "react";
import { Switch } from "@/components/ui/switch";
import { Label } from "@/components/ui/label";

interface ScreenTimeInputProps {
    onClose: () => void;
    onSave: (data: ScreenTimeData) => void;
}

export interface ScreenTimeData {
    date: string;
    duration: number;
    breakFrequency?: number;
    blueLightFilter: boolean;
}

export function ScreenTimeInput({ onClose, onSave }: ScreenTimeInputProps) {
    const [date, setDate] = useState(new Date().toISOString().split('T')[0]);
    const [duration, setDuration] = useState<string>("");
    const [breakFrequency, setBreakFrequency] = useState<string>("");
    const [blueLightFilter, setBlueLightFilter] = useState(false);

    const handleSave = () => {
        if (!duration) return;

        const dateTime = new Date(date).toISOString();

        onSave({
            date: dateTime,
            duration: parseFloat(duration),
            breakFrequency: breakFrequency ? parseInt(breakFrequency) : undefined,
            blueLightFilter
        });
        onClose();
    };

    return (
        <div className="fixed inset-0 z-50 bg-background/95 backdrop-blur-sm flex items-center justify-center p-4">
            <Card className="w-full max-w-md border-2 shadow-xl">
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                    <CardTitle className="text-2xl flex items-center gap-2">
                        <Monitor className="h-6 w-6 text-blue-500" />
                        Temps d'Écran
                    </CardTitle>
                    <Button variant="ghost" size="icon" onClick={onClose}>
                        <X className="h-6 w-6" />
                    </Button>
                </CardHeader>
                <CardContent className="space-y-6">
                    <div className="space-y-2">
                        <label className="text-sm font-medium flex items-center gap-2">
                            <Calendar className="h-4 w-4" /> Date
                        </label>
                        <Input
                            type="date"
                            value={date}
                            onChange={(e) => setDate(e.target.value)}
                            className="bg-background border-input"
                        />
                    </div>

                    <div className="space-y-2">
                        <label className="text-sm font-medium flex items-center gap-2">
                            <Clock className="h-4 w-4" /> Durée totale (heures)
                        </label>
                        <Input
                            type="number"
                            step="0.5"
                            placeholder="Ex: 6.5"
                            value={duration}
                            onChange={(e) => setDuration(e.target.value)}
                            className="text-lg bg-background border-input"
                        />
                    </div>

                    <div className="space-y-2">
                        <label className="text-sm font-medium">Fréquence des pauses (minutes)</label>
                        <Input
                            type="number"
                            placeholder="Ex: 60 (toutes les heures)"
                            value={breakFrequency}
                            onChange={(e) => setBreakFrequency(e.target.value)}
                            className="bg-background border-input"
                        />
                        <p className="text-xs text-muted-foreground">Laisser vide si pas de pauses régulières</p>
                    </div>

                    <div className="flex items-center justify-between space-x-2 border p-3 rounded-lg">
                        <Label htmlFor="blue-light" className="flex flex-col space-y-1">
                            <span>Filtre lumière bleue</span>
                            <span className="font-normal text-xs text-muted-foreground">Avez-vous utilisé un mode nuit ?</span>
                        </Label>
                        <Switch
                            id="blue-light"
                            checked={blueLightFilter}
                            onCheckedChange={setBlueLightFilter}
                        />
                    </div>

                    <div className="flex gap-3 pt-4">
                        <Button variant="outline" onClick={onClose} className="flex-1">
                            Annuler
                        </Button>
                        <Button
                            onClick={handleSave}
                            disabled={!duration}
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
