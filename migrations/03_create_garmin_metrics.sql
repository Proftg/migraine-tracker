-- Création/mise à jour de la table garmin_metrics pour les données de santé Garmin
-- Cette table stocke les métriques de santé quotidiennes synchronisées depuis Garmin

-- Créer la table si elle n'existe pas
CREATE TABLE IF NOT EXISTS garmin_metrics (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL UNIQUE,
    
    -- Sleep metrics
    sleep_score INTEGER,                    -- Score de sommeil (0-100)
    sleep_seconds INTEGER,                  -- Durée totale de sommeil en secondes
    deep_sleep_seconds INTEGER,             -- Sommeil profond en secondes
    light_sleep_seconds INTEGER,            -- Sommeil léger en secondes
    rem_sleep_seconds INTEGER,              -- Sommeil paradoxal en secondes
    awake_seconds INTEGER,                  -- Temps éveillé en secondes
    
    -- Stress metrics
    stress_avg INTEGER,                     -- Stress moyen (0-100)
    stress_max INTEGER,                     -- Stress maximum (0-100)
    
    -- Heart rate metrics
    resting_hr INTEGER,                     -- Fréquence cardiaque au repos
    min_hr INTEGER,                         -- FC minimale
    max_hr INTEGER,                         -- FC maximale
    avg_hr_7days INTEGER,                   -- FC repos moyenne sur 7 jours
    
    -- Activity metrics
    steps INTEGER,                          -- Nombre de pas
    calories_total NUMERIC,                 -- Calories totales
    calories_active NUMERIC,                -- Calories actives
    distance_meters NUMERIC,                -- Distance en mètres
    
    -- Body Battery (peut être NULL si non disponible)
    body_battery_max INTEGER,               -- Body Battery max
    body_battery_min INTEGER,               -- Body Battery min
    
    -- Training load
    training_load NUMERIC,                  -- Charge d'entraînement
    
    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index pour améliorer les performances des requêtes
CREATE INDEX IF NOT EXISTS idx_garmin_metrics_date ON garmin_metrics(date DESC);
CREATE INDEX IF NOT EXISTS idx_garmin_metrics_created_at ON garmin_metrics(created_at DESC);

-- Activer Row Level Security
ALTER TABLE garmin_metrics ENABLE ROW LEVEL SECURITY;

-- Politique: Permettre l'accès anonyme (à ajuster selon vos besoins de sécurité)
CREATE POLICY IF NOT EXISTS "Allow anonymous access to garmin_metrics" 
ON garmin_metrics
    FOR ALL
    USING (true)
    WITH CHECK (true);

-- Fonction pour mettre à jour automatiquement updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger pour mettre à jour updated_at automatiquement
DROP TRIGGER IF EXISTS update_garmin_metrics_updated_at ON garmin_metrics;
CREATE TRIGGER update_garmin_metrics_updated_at
    BEFORE UPDATE ON garmin_metrics
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- Commentaires sur les colonnes
COMMENT ON TABLE garmin_metrics IS 'Métriques de santé quotidiennes synchronisées depuis Garmin';
COMMENT ON COLUMN garmin_metrics.date IS 'Date des métriques (une entrée par jour)';
COMMENT ON COLUMN garmin_metrics.sleep_score IS 'Score de qualité du sommeil (0-100)';
COMMENT ON COLUMN garmin_metrics.sleep_seconds IS 'Durée totale de sommeil en secondes';
COMMENT ON COLUMN garmin_metrics.stress_avg IS 'Niveau de stress moyen de la journée (0-100)';
COMMENT ON COLUMN garmin_metrics.resting_hr IS 'Fréquence cardiaque au repos (bpm)';
COMMENT ON COLUMN garmin_metrics.steps IS 'Nombre total de pas dans la journée';
COMMENT ON COLUMN garmin_metrics.body_battery_max IS 'Niveau maximum de Body Battery (0-100)';
