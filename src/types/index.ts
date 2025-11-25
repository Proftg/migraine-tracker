export type EntryType = 'migraine' | 'activity' | 'medication' | 'note' | 'treatment' | 'calories';

export interface BaseEntry {
    id: string;
    date: string; // ISO string
    type: EntryType;
    notes?: string;
}

// Multiple medication attempts tracking
export interface MedicationAttempt {
    medicationName: string;
    dosage: number;
    timeTaken: string;          // ISO time string
    reliefAchieved: boolean;
    reliefDuration?: number;    // Minutes until relief (if achieved)
}

export interface MigraineEntry extends BaseEntry {
    type: 'migraine';
    intensity: number;
    painLocation?: string;
    symptoms?: string[];
    exactTime?: string;         // Start time
    endTime?: string;           // NEW: End time for auto-duration calculation
    duration?: number;          // AUTO-CALCULATED from exactTime and endTime

    // Multiple medication attempts (NEW)
    medicationAttempts?: MedicationAttempt[];

    // Legacy medication fields (keep for backward compatibility)
    medicationName?: string;
    medicationDosage?: number;
    medicationTime?: string;
    reliefDuration?: number;
    reliefWithMedication?: boolean;

    // Enhanced tracking fields
    screenTimeBeforeCrisis?: number;  // Hours of screen time before crisis
    hadBreaks?: boolean;               // Regular breaks during screen time
    stressLevel?: number;              // 1-10 scale
}

export interface ActivityEntry extends BaseEntry {
    type: 'activity';
    activityType: 'Course à pieds' | 'Vélo' | 'Natation' | 'Musculation' | string;
    duration: number;
    intensity?: 'low' | 'medium' | 'high';
    exactTime?: string;         // NEW: Exact time of activity
    caloriesBurned?: number;    // NEW: Calories burned during activity
    notes?: string;
    // Enhanced sports tracking
    hydrationLevel?: 'low' | 'medium' | 'high';
    warmupDuration?: number;           // Minutes of warmup
    cooldownDuration?: number;         // Minutes of cooldown
    perceivedExertion?: number;        // 1-10 RPE scale
}

export interface MedicationEntry extends BaseEntry {
    type: 'medication';
    name: string;
    dosage: string;
}

export interface TreatmentEntry extends BaseEntry {
    type: 'treatment';
    medicationName: string;        // "Aimovig SC"
    dosage: string;                 // "140mg / 1ml"
    administrationRoute: string;    // "Injection sous-cutanée"
    nextDueDate?: string;          // ISO date for next injection
    isPreventive: boolean;         // true for Aimovig
}

// NEW: Daily calorie intake entry
export interface CalorieEntry extends BaseEntry {
    type: 'calories';
    totalCalories: number;      // Total calories consumed for the day
    mealBreakdown?: {
        breakfast?: number;
        lunch?: number;
        dinner?: number;
        snacks?: number;
    };
}

export interface NoteEntry extends BaseEntry {
    type: 'note';
}

export type JournalEntry = MigraineEntry | ActivityEntry | MedicationEntry | NoteEntry | TreatmentEntry | CalorieEntry;
