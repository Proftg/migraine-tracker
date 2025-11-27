import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { X, Calendar } from "lucide-react";
import { useState } from "react";

interface DailyCalorieReminderProps {
    onClose: () => void;
    onSave: (data: CalorieData) => void;
}

export interface CalorieData {
    totalCalories: number;
    date: string; // ISO string
    mealBreakdown?: {
        breakfast?: number;
        lunch?: number;
        dinner?: number;
        snacks?: number;
    };
}

export function DailyCalorieReminder({ onClose, onSave }: DailyCalorieReminderProps) {
    const [totalCalories, setTotalCalories] = useState<number | undefined>();
    const [date, setDate] = useState(new Date().toISOString().split('T')[0]);
    const [time, setTime] = useState(new Date().toTimeString().slice(0, 5));
    const [showBreakdown, setShowBreakdown] = useState(false);
    const [breakdown, setBreakdown] = useState({
        breakfast: undefined as number | undefined,
        lunch: undefined as number | undefined,
        dinner: undefined as number | undefined,
        snacks: undefined as number | undefined
    });

    const calculateTotal = () => {
        const b = breakdown.breakfast || 0;
        const l = breakdown.lunch || 0;
        const d = breakdown.dinner || 0;
        const s = breakdown.snacks || 0;
        return b + l + d + s;
    };

    const handleSave = () => {
        const dateTime = new Date(`${date}T${time}`).toISOString();

        if (showBreakdown) {
            const calculatedTotal = calculateTotal();
            if (calculatedTotal > 0) {
                onSave({
                    totalCalories: calculatedTotal,
                    date: dateTime,
                    mealBreakdown: {
                        breakfast: breakdown.breakfast,
                        lunch: breakdown.lunch,
                        dinner: breakdown.dinner,
                        snacks: breakdown.snacks
                    }
                });
            }
        } else if (totalCalories && totalCalories > 0) {
            onSave({
                totalCalories: totalCalories,
                date: dateTime
            });
        }
        onClose();
    };

    return (
        <div className="fixed inset-0 z-50 bg-background/95 backdrop-blur-sm flex items-center justify-center p-4">
            <Card className="w-full max-w-md border-2 shadow-xl">
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                    <CardTitle className="text-2xl flex items-center gap-2">
                        🍎 Suivi Calories
                    </CardTitle>
                    <Button variant="ghost" size="icon" onClick={onClose}>
                        <X className="h-6 w-6" />
                    </Button>
                </CardHeader>
                <CardContent className="space-y-6">
                    <div className="grid grid-cols-2 gap-4">
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
                            <label className="text-sm font-medium">Heure</label>
                            <Input
                                type="time"
                                value={time}
                                onChange={(e) => setTime(e.target.value)}
                                className="bg-background border-input"
                            />
                        </div>
                    </div>

                    <p className="text-muted-foreground text-center text-sm">
                        Combien de calories avez-vous consommé ?
                    </p>

                    {!showBreakdown ? (
                        <div className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium mb-2">Total Calories</label>
                                <Input
                                    type="number"
                                    className="text-lg bg-background border-input"
                                    placeholder="Ex: 2000"
                                    value={totalCalories || ''}
                                    onChange={(e) => setTotalCalories(Number(e.target.value))}
                                />
                            </div>
                            <div className="text-center">
                                <Button
                                    variant="link"
                                    onClick={() => setShowBreakdown(true)}
                                    className="text-primary"
                                >
                                    Saisir par repas
                                </Button>
                            </div>
                        </div>
                    ) : (
                        <div className="space-y-4">
                            <div className="grid grid-cols-2 gap-4">
                                <div>
                                    <label className="block text-sm font-medium mb-1">Petit-déjeuner</label>
                                    <Input
                                        type="number"
                                        className="bg-background border-input"
                                        value={breakdown.breakfast || ''}
                                        onChange={(e) => setBreakdown({ ...breakdown, breakfast: Number(e.target.value) })}
                                    />
                                </div>
                                <div>
                                    <label className="block text-sm font-medium mb-1">Déjeuner</label>
                                    <Input
                                        type="number"
                                        className="bg-background border-input"
                                        value={breakdown.lunch || ''}
                                        onChange={(e) => setBreakdown({ ...breakdown, lunch: Number(e.target.value) })}
                                    />
                                </div>
                                <div>
                                    <label className="block text-sm font-medium mb-1">Dîner</label>
                                    <Input
                                        type="number"
                                        className="bg-background border-input"
                                        value={breakdown.dinner || ''}
                                        onChange={(e) => setBreakdown({ ...breakdown, dinner: Number(e.target.value) })}
                                    />
                                </div>
                                <div>
                                    <label className="block text-sm font-medium mb-1">Collations</label>
                                    <Input
                                        type="number"
                                        className="bg-background border-input"
                                        value={breakdown.snacks || ''}
                                        onChange={(e) => setBreakdown({ ...breakdown, snacks: Number(e.target.value) })}
                                    />
                                </div>
                            </div>
                            <div className="p-3 bg-muted rounded-lg text-center font-semibold">
                                Total calculé : {calculateTotal()} kcal
                            </div>
                            <div className="text-center">
                                <Button
                                    variant="link"
                                    onClick={() => setShowBreakdown(false)}
                                    className="text-primary"
                                >
                                    Saisir total uniquement
                                </Button>
                            </div>
                        </div>
                    )}

                    <div className="flex gap-3 pt-4">
                        <Button variant="outline" onClick={onClose} className="flex-1">
                            Annuler
                        </Button>
                        <Button
                            onClick={handleSave}
                            disabled={!showBreakdown && (!totalCalories || totalCalories <= 0)}
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
