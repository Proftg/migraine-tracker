# 🔧 Guide de Correction - Synchronisation Garmin

## 📋 Problèmes Identifiés

### 1. Endpoints Garmin Non Fonctionnels
❌ **Body Battery**: Tous les endpoints Body Battery retournent 404
❌ **Hydration, Respiration, Steps individuels, SpO2**: Non accessibles

### 2. Schéma Base de Données Incomplet
❌ La table `garmin_metrics` manque plusieurs colonnes requises par le script de sync

## ✅ Solutions Implémentées

### Étape 1: Diagnostic des Endpoints Garmin

Script créé: `scripts/diagnose_garmin.py`

**Endpoints fonctionnels identifiés:**
- ✅ User Summary (Steps, Calories, Distance)
- ✅ Sleep Data (Score, durée, phases de sommeil)
- ✅ Stress Data (Stress moyen/max)
- ✅ Heart Rate (FC repos/min/max)
- ✅ Activities (Liste des activités récentes)

**Utilisation:**
```bash
cd ~/project/Maven/migraine-tracker
python3 scripts/diagnose_garmin.py
```

### Étape 2: Script de Synchronisation Corrigé

Fichier créé: `scripts/garmin-sync-fixed.py`

**Améliorations:**
- ✅ Utilise uniquement les endpoints fonctionnels
- ✅ Extraction détaillée des phases de sommeil (profond, léger, REM, éveillé)
- ✅ Métriques de fréquence cardiaque complètes
- ✅ Données d'activité (steps, calories, distance)
- ✅ Gestion des erreurs améliorée
- ❌ Body Battery retiré (endpoint non disponible)

**Nouvelles métriques extraites:**
```python
# Sommeil
- sleep_score: Score global
- sleep_seconds: Durée totale
- deep_sleep_seconds: Sommeil profond
- light_sleep_seconds: Sommeil léger
- rem_sleep_seconds: Sommeil paradoxal
- awake_seconds: Temps éveillé

# Fréquence Cardiaque
- resting_hr: FC au repos
- min_hr: FC minimale
- max_hr: FC maximale
- avg_hr_7days: Moyenne sur 7 jours

# Activité
- steps: Nombre de pas
- calories_total: Calories totales
- calories_active: Calories actives
- distance_meters: Distance parcourue

# Stress
- stress_avg: Stress moyen
- stress_max: Stress maximum
```

### Étape 3: Migration Base de Données

Fichier créé: `migrations/03_create_garmin_metrics.sql`

**Cette migration:**
- ✅ Crée la table `garmin_metrics` avec toutes les colonnes nécessaires
- ✅ Ajoute des index pour optimiser les performances
- ✅ Active Row Level Security (RLS)
- ✅ Crée un trigger pour `updated_at`
- ✅ Ajoute des commentaires sur les colonnes

**Application de la migration:**

**Option A: Via Supabase Dashboard (Recommandé)**
1. Accéder au SQL Editor:
   ```
   https://supabase.com/dashboard/project/[votre-project-id]/editor
   ```

2. Copier le contenu de `migrations/03_create_garmin_metrics.sql`

3. Coller dans l'éditeur SQL et exécuter

**Option B: Via Supabase CLI**
```bash
# Installer le CLI si nécessaire
npm install -g supabase

# Lier le projet
supabase link --project-ref [votre-project-id]

# Appliquer les migrations
supabase db push
```

### Étape 4: Test de la Synchronisation

**Test complet:**
```bash
cd ~/project/Maven/migraine-tracker

# 1. Vérifier les endpoints
python3 scripts/diagnose_garmin.py

# 2. Appliquer la migration (manuellement via Supabase Dashboard)

# 3. Tester la synchronisation
python3 scripts/garmin-sync-fixed.py

# 4. Vérifier les données
python3 -c "
from supabase import create_client
from dotenv import load_dotenv
import os

load_dotenv('.env.local')
supabase = create_client(
    os.getenv('NEXT_PUBLIC_SUPABASE_URL'),
    os.getenv('NEXT_PUBLIC_SUPABASE_ANON_KEY')
)

result = supabase.table('garmin_metrics').select('*').limit(5).execute()
print(f'✅ Found {len(result.data)} records')
for record in result.data:
    print(f\"  - {record['date']}: Sleep={record.get('sleep_score')}, Steps={record.get('steps')}\")
"
```

## 📊 Comparaison Avant/Après

### Avant (Script Original)
```
❌ 0/30 jours synchronisés
❌ 100% d'erreurs 404 sur Body Battery
❌ Colonnes manquantes dans la base de données
```

### Après (Script Corrigé)
```
✅ Endpoints validés et fonctionnels
✅ Schéma base de données complet
✅ Extraction de 16 métriques de santé
✅ Gestion d'erreurs robuste
```

## 🔄 Synchronisation Automatique

### Configuration Cron (Optionnel)

**Créer le job cron:**
```bash
# Éditer la crontab
crontab -e

# Ajouter cette ligne pour sync quotidienne à 6h du matin
0 6 * * * cd ~/project/Maven/migraine-tracker && python3 scripts/garmin-sync-fixed.py >> logs/garmin-sync.log 2>&1
```

**Vérifier le cron:**
```bash
crontab -l
```

### Via l'API Next.js

L'endpoint `/api/garmin/sync` peut appeler le script Python:

```typescript
// src/app/api/garmin/sync/route.ts
export async function POST() {
    const { spawn } = require('child_process');
    
    const python = spawn('python3', [
        'scripts/garmin-sync-fixed.py'
    ]);
    
    // Gérer la sortie...
}
```

## 🚨 Limitations Connues

### Body Battery
**Problème:** Endpoint non disponible via l'API Garmin Connect
**Impact:** Pas de données Body Battery dans l'application
**Alternatives possibles:**
1. Utiliser le package `garminconnect` (une bibliothèque tierce)
2. Scraper les données depuis l'interface web Garmin (non recommandé)
3. Attendre une mise à jour de l'API officielle

### Hydration/Respiration
**Problème:** Endpoints non accessibles
**Impact:** Ces métriques ne seront pas synchronisées
**Solution:** Utiliser les données de sommeil qui contiennent des informations respiratoires

## 📝 Checklist de Déploiement

- [x] Script de diagnostic créé (`diagnose_garmin.py`)
- [x] Script de sync corrigé (`garmin-sync-fixed.py`)
- [x] Migration base de données créée (`03_create_garmin_metrics.sql`)
- [ ] Migration appliquée sur Supabase
- [ ] Tests de synchronisation effectués
- [ ] Vérification des données dans l'interface
- [ ] Documentation mise à jour
- [ ] Ancien script sauvegardé/archivé

## 🔗 Fichiers Modifiés/Créés

```
migraine-tracker/
├── scripts/
│   ├── diagnose_garmin.py          ✨ NOUVEAU - Diagnostic endpoints
│   ├── garmin-sync-fixed.py        ✨ NOUVEAU - Script corrigé
│   ├── garmin-sync.py              📝 ANCIEN - À remplacer
│   └── apply_migrations.py         ✨ NOUVEAU - Helper migrations
├── migrations/
│   └── 03_create_garmin_metrics.sql ✨ NOUVEAU - Schéma table
└── FIX_GARMIN_SYNC.md              📋 CE FICHIER
```

## 🎯 Prochaines Étapes

1. **Appliquer la migration** sur Supabase (étape manuelle)
2. **Remplacer** `garmin-sync.py` par `garmin-sync-fixed.py`
3. **Tester** la synchronisation complète
4. **Mettre à jour** l'interface pour refléter les nouvelles données disponibles
5. **Configurer** la synchronisation automatique (cron ou API)

## 📞 Support

En cas de problème:
1. Vérifier les logs: `cat sync_log.txt`
2. Tester les endpoints: `python3 scripts/diagnose_garmin.py`
3. Vérifier la session Garmin: `ls -la ~/.garth/`
4. Re-authentifier si nécessaire: `rm -rf ~/.garth/ && python3 scripts/garmin-sync-fixed.py`

---

**Dernière mise à jour:** 8 décembre 2025  
**Version:** 2.0  
**Auteur:** Claude (Assistant IA)
