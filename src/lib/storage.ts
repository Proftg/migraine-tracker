import { JournalEntry } from '@/types';

const STORAGE_KEY = 'migraine-tracker-data';

export const storage = {
    getEntries: (): JournalEntry[] => {
        if (typeof window === 'undefined') return [];
        const data = localStorage.getItem(STORAGE_KEY);
        return data ? JSON.parse(data) : [];
    },

    addEntry: (entry: JournalEntry): JournalEntry[] => {
        const entries = storage.getEntries();
        const newEntries = [entry, ...entries];
        localStorage.setItem(STORAGE_KEY, JSON.stringify(newEntries));
        return newEntries;
    },

    deleteEntry: (id: string): JournalEntry[] => {
        const entries = storage.getEntries();
        const newEntries = entries.filter(e => e.id !== id);
        localStorage.setItem(STORAGE_KEY, JSON.stringify(newEntries));
        return newEntries;
    },

    clearAllData: (): void => {
        localStorage.removeItem(STORAGE_KEY);
    },

    getTreatments: (): JournalEntry[] => {
        return storage.getEntries().filter(e => e.type === 'treatment');
    },

    getLastTreatment: (): JournalEntry | null => {
        const treatments = storage.getTreatments();
        if (treatments.length === 0) return null;
        return treatments.sort((a, b) =>
            new Date(b.date).getTime() - new Date(a.date).getTime()
        )[0];
    },

    getCrisisFreeDays: (): number => {
        const entries = storage.getEntries();
        const migraines = entries.filter(e => e.type === 'migraine').sort((a, b) =>
            new Date(b.date).getTime() - new Date(a.date).getTime()
        );

        if (migraines.length === 0) return 0;

        const lastMigraine = new Date(migraines[0].date);
        const today = new Date();
        const diffTime = Math.abs(today.getTime() - lastMigraine.getTime());
        const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));

        return diffDays;
    },

    // Mock AI Analysis (Simple keyword matching for now)
    analyzeText: (text: string): Partial<JournalEntry> => {
        const lower = text.toLowerCase();

        if (lower.includes('migraine') || lower.includes('mal de tête') || lower.includes('douleur')) {
            return {
                type: 'migraine',
                intensity: lower.includes('fort') ? 8 : 5,
                notes: text
            };
        }

        if (lower.includes('couru') || lower.includes('sport') || lower.includes('vélo')) {
            return {
                type: 'activity',
                activityType: lower.includes('vélo') ? 'Vélo' : 'Course',
                duration: 60, // default
                notes: text
            };
        }

        return {
            type: 'note',
            notes: text
        };
    }
};
