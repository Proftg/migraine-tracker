import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { X } from "lucide-react";
import { useState } from "react";

interface DailyCalorieReminderProps {
    onClose: () => void;
    onSave: (data: CalorieData) => void;
}

export interface CalorieData {
    totalCalories: number;
    mealBreakdown?: {
        breakfast?: number;
        lunch?: number;
        dinner?: number;
        snacks?: number;
    };
}

export function DailyCalorieReminder({ onClose, onSave }: DailyCalorieReminderProps) {
    const [totalCalories, setTotalCalories] = useState<number | undefined>();
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
        if (showBreakdown) {
            const calculatedTotal = calculateTotal();
            if (calculatedTotal > 0) {
                onSave({
                    totalCalories: calculatedTotal,
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
                totalCalories: totalCalories
            });
        }
        onClose();
    };

    return (
        <div className="fixed inset-0 z-50 bg-background/95 backdrop-blur-sm flex items-center justify-center p-4">
            <Card className="w-full max-w-md">
                <CardHeader className="flex flex-row items-center justify-between">
                    <CardTitle className="text-2xl">🍎 Suivi Calories</CardTitle>
                    <Button variant="ghost" size="icon" onClick={onClose}>
                        <X className="h-6 w-6" />
                    </Button>
                </CardHeader>
                <CardContent className="space-y-6">
                    <p className="text-muted-foreground text-center">
                        Combien de calories avez-vous consommé aujourd'hui ?
                    </p>

                    {!showBreakdown ? (
                        <div className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium mb-2">Total Calories</label>
                                <input
                                    type="number"
                                    className="w-full p-3 text-lg border rounded-lg bg-background"
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
                                    <input
                                        type="number"
                                        className="w-full p-2 border rounded-lg bg-background"
                                        value={breakdown.breakfast || ''}
                                        onChange={(e) => setBreakdown({ ...breakdown, breakfast: Number(e.target.value) })}
                                    />
                                </div>
                                <div>
                                    <label className="block text-sm font-medium mb-1">Déjeuner</label>
                                    <input
                                        type="number"
                                        className="w-full p-2 border rounded-lg bg-background"
                                        value={breakdown.lunch || ''}
                                        onChange={(e) => setBreakdown({ ...breakdown, lunch: Number(e.target.value) })}
                                    />
                                </div>
                                <div>
                                    <label className="block text-sm font-medium mb-1">Dîner</label>
                                    <input
                                        type="number"
                                        className="w-full p-2 border rounded-lg bg-background"
                                        value={breakdown.dinner || ''}
                                        onChange={(e) => setBreakdown({ ...breakdown, dinner: Number(e.target.value) })}
                                    />
                                </div>
                                <div>
                                    <label className="block text-sm font-medium mb-1">Collations</label>
                                    <input
                                        type="number"
                                        className="w-full p-2 border rounded-lg bg-background"
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
                            Plus tard
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
