import { JournalEntry } from '@/types';
import { supabaseStorage } from './supabase';

const STORAGE_KEY = 'migraine-tracker-data';
const USE_SUPABASE = true; // Set to false to use localStorage only

export const storage = {
    getEntries: async (): Promise<JournalEntry[]> => {
        if (USE_SUPABASE) {
            try {
                return await supabaseStorage.getEntries();
            } catch (error) {
                console.error('Supabase error, falling back to localStorage:', error);
                // Fallback to localStorage if Supabase fails
                if (typeof window === 'undefined') return [];
                const data = localStorage.getItem(STORAGE_KEY);
                return data ? JSON.parse(data) : [];
            }
        } else {
            if (typeof window === 'undefined') return [];
            const data = localStorage.getItem(STORAGE_KEY);
            return data ? JSON.parse(data) : [];
        }
    },

    addEntry: async (entry: JournalEntry): Promise<JournalEntry[]> => {
        if (USE_SUPABASE) {
            try {
                return await supabaseStorage.addEntry(entry);
            } catch (error) {
                console.error('Supabase error, falling back to localStorage:', error);
                const entries = await storage.getEntries();
                const newEntries = [entry, ...entries];
                localStorage.setItem(STORAGE_KEY, JSON.stringify(newEntries));
                return newEntries;
            }
        } else {
            const entries = await storage.getEntries();
            const newEntries = [entry, ...entries];
            localStorage.setItem(STORAGE_KEY, JSON.stringify(newEntries));
            return newEntries;
        }
    },

    deleteEntry: async (id: string): Promise<JournalEntry[]> => {
        if (USE_SUPABASE) {
            try {
                return await supabaseStorage.deleteEntry(id);
            } catch (error) {
                console.error('Supabase error, falling back to localStorage:', error);
                const entries = await storage.getEntries();
                const newEntries = entries.filter(e => e.id !== id);
                localStorage.setItem(STORAGE_KEY, JSON.stringify(newEntries));
                return newEntries;
            }
        } else {
            const entries = await storage.getEntries();
            const newEntries = entries.filter(e => e.id !== id);
            localStorage.setItem(STORAGE_KEY, JSON.stringify(newEntries));
            return newEntries;
        }
    },

    clearAllData: async (): Promise<void> => {
        if (USE_SUPABASE) {
            try {
                await supabaseStorage.clearAllData();
            } catch (error) {
                console.error('Supabase error:', error);
            }
        }
        localStorage.removeItem(STORAGE_KEY);
    },

    getTreatments: async (): Promise<JournalEntry[]> => {
        const entries = await storage.getEntries();
        return entries.filter(e => e.type === 'treatment');
    },

    getLastTreatment: async (): Promise<JournalEntry | null> => {
        const treatments = await storage.getTreatments();
        if (treatments.length === 0) return null;
        return treatments[0];
    },

    getCrisisFreeDays: async (): Promise<number> => {
        const entries = await storage.getEntries();
        const migraines = entries.filter(e => e.type === 'migraine');

        if (migraines.length === 0) return 0;

        const lastMigraine = new Date(migraines[0].date);
        const today = new Date();
        const diffTime = Math.abs(today.getTime() - lastMigraine.getTime());
        const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));

        return diffDays;
    },

    // Migration helper: Migrate localStorage data to Supabase
    migrateToSupabase: async (): Promise<void> => {
        if (typeof window === 'undefined') return;

        const localData = localStorage.getItem(STORAGE_KEY);
        if (!localData) return;

        const entries: JournalEntry[] = JSON.parse(localData);
        if (entries.length === 0) return;

        try {
            await supabaseStorage.migrateFromLocalStorage(entries);
            console.log(`✅ Migrated ${entries.length} entries to Supabase`);
        } catch (error) {
            console.error('Migration error:', error);
        }
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
