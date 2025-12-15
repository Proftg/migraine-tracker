# 🧠 MigraineChecker - Assistant Intelligent de Suivi des Migraines

Application web moderne pour le suivi, l'analyse et la prédiction des crises de migraine, alimentée par l'IA et connectée à vos données de santé.

![Status](https://img.shields.io/badge/Status-Beta-blue)
![Tech](https://img.shields.io/badge/Stack-Next.js_14-black)

## ✨ Fonctionnalités Principales

### 📊 Dashboard Intelligent
- **Score de Risque en Temps Réel** : Analyse multi-factorielle (Météo, Sommeil, Stress, Activité).
- **Prédictions IA** : Suggestions basées sur vos historiques et modèles détectés.
- **Météo Intégrée** : Pression atmosphérique, humidité et température locales.

### 📝 Suivi Détaillé
- **Mode SOS (Crise)** : Enregistrement rapide avec support des crises multi-jours (Date début/fin).
- **Suivi des Traitements** : 
  - Module dédié **Aimovig** (Injections mensuelles, rappels, compte à rebours).
  - Suivi de l'efficacité des médicaments de crise.
- **Activités & Facteurs** : Importation de données (Sport, Temps d'écran, Calories).

### 🔗 Intégrations & Données
- **Garmin & Strava** : Synchronisation automatique des données de santé (Sommeil, Stress, Body Battery, Sport).
- **Supabase** : Stockage cloud sécurisé et synchronisé.
- **Rapports Médicaux** : Génération de rapports PDF complets pour votre neurologue, incluant l'analyse "Avant/Après" traitement.

## 🛠️ Stack Technique

- **Frontend** : Next.js 14 (App Router), React, TypeScript.
- **UI/UX** : Tailwind CSS, Shadcn UI, Lucide Icons.
- **Backend/Storage** : Supabase (PostgreSQL), LocalStorage (mode hors ligne).
- **Analytics** : Chart.js, Recharts, TensorFlow.js (pour les prédictions locales).
- **Connecteurs** : Scripts Python pour l'import Garmin/Strava.

## 🚀 Installation et Lancement

1. **Cloner le projet**
   ```bash
   git clone <url-du-repo>
   cd migraine-tracker
   ```

2. **Installer les dépendances**
   ```bash
   npm install
   ```

3. **Configuration**
   Créez un fichier `.env.local` avec vos clés API (Supabase, Garmin, etc.) :
   ```env
   NEXT_PUBLIC_SUPABASE_URL=votre_url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=votre_cle
   ```

4. **Lancer en développement**
   ```bash
   npm run dev
   ```
   L'application sera accessible sur `http://localhost:3000` (ou 3002 selon config).

5. **Lancer avec le script Windows**
   Double-cliquez sur `Lancer_Migraine_Tracker.bat` pour démarrer l'environnement complet (WSL + Navigateur).

## 🔄 Mises à Jour Récentes

- **Aimovig Tracking** : Ajout d'une carte de suivi des injections avec calcul automatique de la prochaine date.
- **SOS Amélioré** : Support complet des dates et heures pour les crises longues (>24h).
- **Correctifs Analytics** : Amélioration de la précision des calculs d'intensité moyenne.

## 📄 Licence

Projet personnel - Tous droits réservés.
