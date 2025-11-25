import { createClient } from '@supabase/supabase-js';
import { JournalEntry } from '@/types';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

// Database table name
const TABLE_NAME = 'journal_entries';

export const supabaseStorage = {
    // Initialize: Create table if it doesn't exist (will be done via Supabase dashboard)

    getEntries: async (): Promise<JournalEntry[]> => {
        const { data, error } = await supabase
            .from(TABLE_NAME)
            .select('*')
            .order('date', { ascending: false });

        if (error) {
            console.error('Error fetching entries:', error);
            return [];
        }

        return data || [];
    },

    addEntry: async (entry: JournalEntry): Promise<JournalEntry[]> => {
        const { error } = await supabase
            .from(TABLE_NAME)
            .insert([entry]);

        if (error) {
            console.error('Error adding entry:', error);
            throw error;
        }

        return await supabaseStorage.getEntries();
    },

    deleteEntry: async (id: string): Promise<JournalEntry[]> => {
        const { error } = await supabase
            .from(TABLE_NAME)
            .delete()
            .eq('id', id);

        if (error) {
            console.error('Error deleting entry:', error);
            throw error;
        }

        return await supabaseStorage.getEntries();
    },

    clearAllData: async (): Promise<void> => {
        const { error } = await supabase
            .from(TABLE_NAME)
            .delete()
            .neq('id', ''); // Delete all rows

        if (error) {
            console.error('Error clearing data:', error);
            throw error;
        }
    },

    getTreatments: async (): Promise<JournalEntry[]> => {
        const entries = await supabaseStorage.getEntries();
        return entries.filter(e => e.type === 'treatment');
    },

    getLastTreatment: async (): Promise<JournalEntry | null> => {
        const treatments = await supabaseStorage.getTreatments();
        if (treatments.length === 0) return null;
        return treatments[0]; // Already sorted by date descending
    },

    getCrisisFreeDays: async (): Promise<number> => {
        const entries = await supabaseStorage.getEntries();
        const migraines = entries.filter(e => e.type === 'migraine');

        if (migraines.length === 0) return 0;

        const lastMigraine = new Date(migraines[0].date);
        const today = new Date();
        const diffTime = Math.abs(today.getTime() - lastMigraine.getTime());
        const diffDays = Math.floor(diffTime / (1000 * 60 * 60 * 24));

        return diffDays;
    },

    // Migration helper: Import data from localStorage
    migrateFromLocalStorage: async (localData: JournalEntry[]): Promise<void> => {
        if (localData.length === 0) return;

        const { error } = await supabase
            .from(TABLE_NAME)
            .insert(localData);

        if (error) {
            console.error('Error migrating data:', error);
            throw error;
        }
    }
};
