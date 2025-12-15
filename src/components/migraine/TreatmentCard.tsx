import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Syringe, AlertCircle } from "lucide-react";
import { useState } from "react";
import { format, addMonths, differenceInDays } from "date-fns";
import { fr } from "date-fns/locale";
import { JournalEntry, TreatmentEntry } from "@/types";

interface TreatmentCardProps {
    entries: JournalEntry[];
    onLogTreatment: (data: any) => void;
}

export function TreatmentCard({ entries, onLogTreatment }: TreatmentCardProps) {
    const [showLogForm, setShowLogForm] = useState(false);
    const [date, setDate] = useState(new Date().toISOString().split('T')[0]);
    const [time, setTime] = useState(new Date().toTimeString().slice(0, 5));

    // Find last Aimovig injection
    const lastInjection = entries
        .filter(e => e.type === 'treatment' && e.medicationName?.includes('Aimovig'))
        .sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime())[0] as TreatmentEntry | undefined;

    const nextDate = lastInjection
        ? addMonths(new Date(lastInjection.date), 1)
        : null;

    const daysRemaining = nextDate ? differenceInDays(nextDate, new Date()) : 0;

    const isOverdue = daysRemaining < 0;
    const isDueSoon = daysRemaining <= 3 && daysRemaining >= 0;

    const handleSubmit = () => {
        const dateTime = new Date(`${date}T${time}`);

        const treatmentData = {
            medicationName: "Aimovig 140mg",
            dosage: "140mg",
            administrationRoute: "Injection",
            date: dateTime.toISOString(),
            isPreventive: true,
            notes: "Injection mensuelle Aimovig"
        };

        onLogTreatment(treatmentData);
        setShowLogForm(false);
    };

    return (
        <Card className="border-l-4 border-l-purple-500">
            <CardHeader className="pb-2">
                <div className="flex justify-between items-start">
                    <div>
                        <CardTitle className="text-xl flex items-center gap-2">
                            <Syringe className="h-5 w-5 text-purple-600" />
                            Traitement Aimovig
                        </CardTitle>
                        <CardDescription>Suivi des injections mensuelles (140mg)</CardDescription>
                    </div>
                </div>
            </CardHeader>
            <CardContent>
                {!showLogForm ? (
                    <div className="space-y-4">
                        {lastInjection ? (
                            <div className="grid grid-cols-2 gap-4">
                                <div className="p-3 bg-purple-50 rounded-lg border border-purple-100">
                                    <p className="text-xs text-muted-foreground mb-1">Dernière injection</p>
                                    <p className="font-semibold text-purple-900">
                                        {format(new Date(lastInjection.date), 'dd MMMM yyyy', { locale: fr })}
                                    </p>
                                    <p className="text-xs text-purple-700 mt-1">
                                        à {format(new Date(lastInjection.date), 'HH:mm')}
                                    </p>
                                </div>
                                <div className={`p-3 rounded-lg border ${isOverdue ? 'bg-red-50 border-red-100' :
                                    isDueSoon ? 'bg-orange-50 border-orange-100' :
                                        'bg-green-50 border-green-100'
                                    }`}>
                                    <p className="text-xs text-muted-foreground mb-1">Prochaine injection</p>
                                    <p className={`font-semibold ${isOverdue ? 'text-red-700' :
                                        isDueSoon ? 'text-orange-700' :
                                            'text-green-700'
                                        }`}>
                                        {nextDate ? format(nextDate, 'dd MMMM', { locale: fr }) : 'N/A'}
                                    </p>
                                    <p className="text-xs font-medium mt-1">
                                        {isOverdue ? `${Math.abs(daysRemaining)} jours de retard` :
                                            daysRemaining === 0 ? "Aujourd'hui !" :
                                                `Dans ${daysRemaining} jours`}
                                    </p>
                                </div>
                            </div>
                        ) : (
                            <div className="text-center p-4 bg-muted/50 rounded-lg">
                                <AlertCircle className="h-8 w-8 text-muted-foreground mx-auto mb-2" />
                                <p className="text-sm text-muted-foreground">Aucune injection enregistrée</p>
                            </div>
                        )}

                        <Button
                            className="w-full bg-purple-600 hover:bg-purple-700"
                            onClick={() => setShowLogForm(true)}
                        >
                            <PlusIcon className="h-4 w-4 mr-2" />
                            Enregistrer une injection
                        </Button>
                    </div>
                ) : (
                    <div className="space-y-4 animate-in slide-in-from-bottom-2">
                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <label className="text-sm font-medium">Date</label>
                                <input
                                    type="date"
                                    value={date}
                                    onChange={(e) => setDate(e.target.value)}
                                    className="w-full p-2 border rounded-md bg-background text-foreground"
                                />
                            </div>
                            <div className="space-y-2">
                                <label className="text-sm font-medium">Heure</label>
                                <input
                                    type="time"
                                    value={time}
                                    onChange={(e) => setTime(e.target.value)}
                                    className="w-full p-2 border rounded-md bg-background text-foreground"
                                />
                            </div>
                        </div>
                        <div className="flex gap-2">
                            <Button
                                variant="outline"
                                className="flex-1"
                                onClick={() => setShowLogForm(false)}
                            >
                                Annuler
                            </Button>
                            <Button
                                className="flex-1 bg-purple-600 hover:bg-purple-700"
                                onClick={handleSubmit}
                            >
                                Confirmer
                            </Button>
                        </div>
                    </div>
                )}
            </CardContent>
        </Card>
    );
}

function PlusIcon(props: any) {
    return (
        <svg
            {...props}
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
        >
            <path d="M5 12h14" />
            <path d="M12 5v14" />
        </svg>
    );
}
