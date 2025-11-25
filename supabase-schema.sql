-- Création de la table pour stocker les entrées du journal
CREATE TABLE IF NOT EXISTS journal_entries (
    id TEXT PRIMARY KEY,
    date TIMESTAMP WITH TIME ZONE NOT NULL,
    type TEXT NOT NULL,
    
    -- Champs communs
    notes TEXT,
    
    -- Champs pour les migraines
    intensity TEXT,
    "painLocation" TEXT,
    symptoms TEXT[],
    "exactTime" TEXT,
    "endTime" TEXT,
    duration INTEGER,
    "medicationAttempts" JSONB,
    "medicationName" TEXT,
    "medicationDosage" INTEGER,
    "medicationTime" TEXT,
    "reliefDuration" INTEGER,
    "reliefWithMedication" BOOLEAN,
    
    -- Champs pour les activités
    "activityType" TEXT,
    "caloriesBurned" INTEGER,
    
    -- Champs pour les calories
    "totalCalories" INTEGER,
    "mealBreakdown" JSONB,
    
    -- Champs pour les traitements
    name TEXT,
    dosage TEXT,
    frequency TEXT,
    "startDate" TEXT,
    "nextDose" TEXT,
    
    -- Index pour améliorer les performances
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour accélérer les requêtes
CREATE INDEX IF NOT EXISTS idx_journal_entries_date ON journal_entries(date DESC);
CREATE INDEX IF NOT EXISTS idx_journal_entries_type ON journal_entries(type);

-- Activer Row Level Security (RLS) pour la sécurité
ALTER TABLE journal_entries ENABLE ROW LEVEL SECURITY;

-- Politique: Permettre à tous les utilisateurs anonymes de lire/écrire
-- Note: Pour une vraie application, vous devriez ajouter l'authentification
CREATE POLICY "Allow anonymous access" ON journal_entries
    FOR ALL
    USING (true)
    WITH CHECK (true);
