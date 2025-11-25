import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { X, ArrowLeft } from "lucide-react";
import { useState } from "react";
import { MedicationAttempt } from "@/types";

interface CrisisModeProps {
    onClose: () => void;
    onLogCrisis: (data: CrisisData) => void;
}

export interface CrisisData {
    intensity: number;
    location: string;
    symptoms: string[];
    exactTime: string;
    endTime?: string;
    duration?: number;
    medicationAttempts?: MedicationAttempt[];
    // Legacy fields for backward compatibility
    medicationName?: string;
    medicationDosage?: number;
    medicationTime?: string;
    reliefDuration?: number;
    reliefWithMedication?: boolean;
}

const intensityEmojis = [
    { level: 1, emoji: "😊", label: "Très légère" },
    { level: 2, emoji: "🙂", label: "Légère" },
    { level: 3, emoji: "😐", label: "Modérée" },
    { level: 4, emoji: "😕", label: "Gênante" },
    { level: 5, emoji: "😟", label: "Inconfortable" },
    { level: 6, emoji: "😣", label: "Douloureuse" },
    { level: 7, emoji: "😖", label: "Très douloureuse" },
    { level: 8, emoji: "😫", label: "Intense" },
    { level: 9, emoji: "😭", label: "Insupportable" },
    { level: 10, emoji: "🤯", label: "Extrême" }
];

const commonSymptoms = [
    "Nausée", "Vomissements", "Photophobie", "Phonophobie",
    "Aura visuelle", "Vertiges", "Fatigue", "Vision floue"
];

const painLocations = [
    "Front gauche", "Front droit", "Tempe gauche", "Tempe droite",
    "Arrière gauche", "Arrière droit", "Toute la tête", "Nuque"
];

export function CrisisMode({ onClose, onLogCrisis }: CrisisModeProps) {
    const [step, setStep] = useState(0);
    const [intensity, setIntensity] = useState(5);
    const [location, setLocation] = useState('');
    const [symptoms, setSymptoms] = useState<string[]>([]);
    const [exactTime, setExactTime] = useState(new Date().toTimeString().slice(0, 5));
    const [endTime, setEndTime] = useState('');
    const [calculatedDuration, setCalculatedDuration] = useState<number | null>(null);

    // Medication tracking
    const [medicationAttempts, setMedicationAttempts] = useState<MedicationAttempt[]>([]);
    const [currentMedication, setCurrentMedication] = useState({
        name: '',
        dosage: 1,
        timeTaken: new Date().toTimeString().slice(0, 5)
    });
    const [hadRelief, setHadRelief] = useState<boolean | null>(null);
    const [reliefDuration, setReliefDuration] = useState<number | undefined>();

    // Calculate duration when end time changes
    const calculateDuration = (start: string, end: string): number | null => {
        if (!start || !end) return null;

        const today = new Date();
        const startDate = new Date(today.toDateString() + ' ' + start);
        let endDate = new Date(today.toDateString() + ' ' + end);

        // Handle overnight crises (e.g., start 23:00, end 02:00)
        if (endDate < startDate) {
            endDate.setDate(endDate.getDate() + 1);
        }

        const diffMs = endDate.getTime() - startDate.getTime();
        return Math.round(diffMs / (1000 * 60)); // Convert to minutes
    };

    const handleEndTimeChange = (time: string) => {
        setEndTime(time);
        const duration = calculateDuration(exactTime, time);
        setCalculatedDuration(duration);
    };

    const toggleSymptom = (symptom: string) => {
        setSymptoms(prev =>
            prev.includes(symptom)
                ? prev.filter(s => s !== symptom)
                : [...prev, symptom]
        );
    };

    const handleMedicationResponse = (relief: boolean) => {
        setHadRelief(relief);

        if (relief && reliefDuration) {
            // Add successful medication attempt
            const attempt: MedicationAttempt = {
                medicationName: currentMedication.name,
                dosage: currentMedication.dosage,
                timeTaken: currentMedication.timeTaken,
                reliefAchieved: true,
                reliefDuration: reliefDuration
            };
            setMedicationAttempts([...medicationAttempts, attempt]);
            // Move to finish
            setStep(step + 2);
        } else if (!relief) {
            // Add unsuccessful attempt
            const attempt: MedicationAttempt = {
                medicationName: currentMedication.name,
                dosage: currentMedication.dosage,
                timeTaken: currentMedication.timeTaken,
                reliefAchieved: false
            };
            setMedicationAttempts([...medicationAttempts, attempt]);
            // Ask if they want to try another medication
            setStep(step + 1);
        }
    };

    const handleAnotherMedication = (tryAnother: boolean) => {
        if (tryAnother) {
            // Reset current medication and go back to medication entry
            setCurrentMedication({
                name: '',
                dosage: 1,
                timeTaken: new Date().toTimeString().slice(0, 5)
            });
            setHadRelief(null);
            setReliefDuration(undefined);
            setStep(4); // Back to medication entry
        } else {
            // Finish without more medications
            handleFinish();
        }
    };

    const handleFinish = () => {
        const crisisData: CrisisData = {
            intensity,
            location,
            symptoms,
            exactTime,
            endTime,
            duration: calculatedDuration || undefined,
            medicationAttempts: medicationAttempts.length > 0 ? medicationAttempts : undefined
        };

        onLogCrisis(crisisData);
        onClose();
    };

    const handleNext = () => {
        if (step === 7) {
            handleFinish();
        } else {
            setStep(step + 1);
        }
    };

    const handleBack = () => {
        if (step > 0) {
            setStep(step - 1);
        }
    };

    const renderStep = () => {
        switch (step) {
            case 0: // Intensity
                return (
                    <div className="space-y-6">
                        <h2 className="text-2xl font-bold text-center">Quelle est l'intensité de votre crise ?</h2>
                        <div className="grid grid-cols-5 gap-3">
                            {intensityEmojis.map(({ level, emoji, label }) => (
                                <button
                                    key={level}
                                    onClick={() => setIntensity(level)}
                                    className={`p-4 rounded-lg border-2 transition-all ${intensity === level
                                            ? 'border-primary bg-primary/10 scale-105'
                                            : 'border-border hover:border-primary/50'
                                        }`}
                                >
                                    <div className="text-4xl mb-2">{emoji}</div>
                                    <div className="text-xs font-medium">{level}/10</div>
                                    <div className="text-xs text-muted-foreground">{label}</div>
                                </button>
                            ))}
                        </div>
                    </div>
                );

            case 1: // Location
                return (
                    <div className="space-y-6">
                        <h2 className="text-2xl font-bold text-center">Où est localisée la douleur ?</h2>
                        <div className="grid grid-cols-2 gap-3">
                            {painLocations.map((loc) => (
                                <Button
                                    key={loc}
                                    variant={location === loc ? "default" : "outline"}
                                    onClick={() => setLocation(loc)}
                                    className="h-16"
                                >
                                    {loc}
                                </Button>
                            ))}
                        </div>
                    </div>
                );

            case 2: // Symptoms
                return (
                    <div className="space-y-6">
                        <h2 className="text-2xl font-bold text-center">Quels symptômes ressentez-vous ?</h2>
                        <div className="grid grid-cols-2 gap-3">
                            {commonSymptoms.map((symptom) => (
                                <Button
                                    key={symptom}
                                    variant={symptoms.includes(symptom) ? "default" : "outline"}
                                    onClick={() => toggleSymptom(symptom)}
                                    className="h-14"
                                >
                                    {symptom}
                                </Button>
                            ))}
                        </div>
                        <p className="text-sm text-muted-foreground text-center">
                            Sélectionnez tous les symptômes qui s'appliquent
                        </p>
                    </div>
                );

            case 3: // Time
                return (
                    <div className="space-y-6">
                        <h2 className="text-2xl font-bold text-center">Quand la crise a-t-elle commencé et fini ?</h2>
                        <div className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium mb-2">Heure de début</label>
                                <input
                                    type="time"
                                    value={exactTime}
                                    onChange={(e) => {
                                        setExactTime(e.target.value);
                                        if (endTime) {
                                            const duration = calculateDuration(e.target.value, endTime);
                                            setCalculatedDuration(duration);
                                        }
                                    }}
                                    className="w-full p-3 text-lg border rounded-lg"
                                />
                            </div>
                            <div>
                                <label className="block text-sm font-medium mb-2">Heure de fin</label>
                                <input
                                    type="time"
                                    value={endTime}
                                    onChange={(e) => handleEndTimeChange(e.target.value)}
                                    className="w-full p-3 text-lg border rounded-lg"
                                />
                            </div>
                            {calculatedDuration !== null && (
                                <div className="p-4 bg-primary/10 rounded-lg">
                                    <p className="text-center font-semibold">
                                        Durée calculée : {calculatedDuration} minutes
                                        {calculatedDuration >= 60 && ` (${Math.floor(calculatedDuration / 60)}h${calculatedDuration % 60 > 0 ? ` ${calculatedDuration % 60}min` : ''})`}
                                    </p>
                                </div>
                            )}
                        </div>
                    </div>
                );

            case 4: // Medication
                return (
                    <div className="space-y-6">
                        <h2 className="text-2xl font-bold text-center">
                            {medicationAttempts.length > 0 ? 'Nouvelle tentative de médication' : 'Avez-vous pris un médicament ?'}
                        </h2>
                        {medicationAttempts.length > 0 && (
                            <div className="p-4 bg-muted rounded-lg">
                                <p className="text-sm font-medium mb-2">Tentatives précédentes :</p>
                                {medicationAttempts.map((attempt, idx) => (
                                    <p key={idx} className="text-sm text-muted-foreground">
                                        {idx + 1}. {attempt.medicationName} ({attempt.dosage}cp) - {attempt.reliefAchieved ? '✅ Soulagement' : '❌ Pas de soulagement'}
                                    </p>
                                ))}
                            </div>
                        )}
                        <div className="space-y-4">
                            <div>
                                <label className="block text-sm font-medium mb-2">Nom du médicament</label>
                                <input
                                    type="text"
                                    value={currentMedication.name}
                                    onChange={(e) => setCurrentMedication({ ...currentMedication, name: e.target.value })}
                                    placeholder="Ex: Paracétamol, Ibuprofène..."
                                    className="w-full p-3 border rounded-lg"
                                />
                            </div>
                            <div>
                                <label className="block text-sm font-medium mb-2">Dosage (nombre de comprimés)</label>
                                <input
                                    type="number"
                                    value={currentMedication.dosage}
                                    onChange={(e) => setCurrentMedication({ ...currentMedication, dosage: Number(e.target.value) })}
                                    min="1"
                                    className="w-full p-3 border rounded-lg"
                                />
                            </div>
                            <div>
                                <label className="block text-sm font-medium mb-2">Heure de prise</label>
                                <input
                                    type="time"
                                    value={currentMedication.timeTaken}
                                    onChange={(e) => setCurrentMedication({ ...currentMedication, timeTaken: e.target.value })}
                                    className="w-full p-3 border rounded-lg"
                                />
                            </div>
                        </div>
                    </div>
                );

            case 5: // Relief
                return (
                    <div className="space-y-6">
                        <h2 className="text-2xl font-bold text-center">Avez-vous eu un soulagement ?</h2>
                        <div className="grid grid-cols-2 gap-4">
                            <Button
                                variant={hadRelief === true ? "default" : "outline"}
                                onClick={() => setHadRelief(true)}
                                className="h-24 text-lg"
                            >
                                ✅ Oui
                            </Button>
                            <Button
                                variant={hadRelief === false ? "default" : "outline"}
                                onClick={() => setHadRelief(false)}
                                className="h-24 text-lg"
                            >
                                ❌ Non
                            </Button>
                        </div>
                        {hadRelief === true && (
                            <div className="mt-4">
                                <label className="block text-sm font-medium mb-2">
                                    Combien de temps après la prise ? (minutes)
                                </label>
                                <input
                                    type="number"
                                    value={reliefDuration || ''}
                                    onChange={(e) => setReliefDuration(Number(e.target.value))}
                                    placeholder="Ex: 30"
                                    className="w-full p-3 border rounded-lg"
                                />
                            </div>
                        )}
                    </div>
                );

            case 6: // Another medication?
                return (
                    <div className="space-y-6">
                        <h2 className="text-2xl font-bold text-center">
                            Voulez-vous enregistrer une autre prise de médicament ?
                        </h2>
                        <div className="grid grid-cols-2 gap-4">
                            <Button
                                variant="default"
                                onClick={() => handleAnotherMedication(true)}
                                className="h-24 text-lg"
                            >
                                💊 Oui, autre médicament
                            </Button>
                            <Button
                                variant="outline"
                                onClick={() => handleAnotherMedication(false)}
                                className="h-24 text-lg"
                            >
                                ✅ Non, terminer
                            </Button>
                        </div>
                    </div>
                );

            default:
                return null;
        }
    };

    const canProceed = () => {
        switch (step) {
            case 0: return intensity > 0;
            case 1: return location !== '';
            case 2: return symptoms.length > 0;
            case 3: return exactTime !== '' && endTime !== '';
            case 4: return currentMedication.name !== '';
            case 5: return hadRelief !== null && (hadRelief === false || (hadRelief === true && reliefDuration !== undefined));
            default: return true;
        }
    };

    return (
        <div className="fixed inset-0 z-50 bg-background/95 backdrop-blur-sm flex items-center justify-center p-4">
            <Card className="w-full max-w-2xl max-h-[90vh] overflow-y-auto">
                <CardHeader className="flex flex-row items-center justify-between">
                    <CardTitle className="text-2xl">🆘 Signaler une Crise</CardTitle>
                    <Button variant="ghost" size="icon" onClick={onClose}>
                        <X className="h-6 w-6" />
                    </Button>
                </CardHeader>
                <CardContent className="space-y-6">
                    {/* Progress indicator */}
                    <div className="flex items-center justify-center gap-2">
                        {[0, 1, 2, 3, 4, 5].map((s) => (
                            <div
                                key={s}
                                className={`h-2 w-12 rounded-full ${s <= step ? 'bg-primary' : 'bg-muted'
                                    }`}
                            />
                        ))}
                    </div>

                    {/* Step content */}
                    {renderStep()}

                    {/* Navigation buttons */}
                    <div className="flex justify-between pt-6">
                        <Button
                            variant="outline"
                            onClick={handleBack}
                            disabled={step === 0}
                        >
                            <ArrowLeft className="h-4 w-4 mr-2" />
                            Retour
                        </Button>
                        <Button
                            onClick={() => {
                                if (step === 5 && hadRelief !== null) {
                                    handleMedicationResponse(hadRelief);
                                } else {
                                    handleNext();
                                }
                            }}
                            disabled={!canProceed()}
                        >
                            {step === 3 ? 'Terminer' : 'Suivant'}
                        </Button>
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
