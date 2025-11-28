# 🏃‍♂️ Configuration de la Synchronisation Strava

Pour importer vos activités Strava dans MigraineTracker, vous devez configurer l'accès à l'API Strava.

## Étape 1 : Créer une Application Strava

1. Connectez-vous à votre compte Strava sur votre ordinateur.
2. Allez sur : [https://www.strava.com/settings/api](https://www.strava.com/settings/api)
3. Créez une application avec les informations suivantes :
   - **Application Name**: MigraineTracker
   - **Category**: "My App" (ou autre)
   - **Club**: (Laisser vide)
   - **Website**: `http://localhost`
   - **Authorization Callback Domain**: `localhost`
4. Cliquez sur "Create".
5. Vous obtiendrez une page avec :
   - **Client ID** (ex: 12345)
   - **Client Secret** (ex: a1b2c3d4...)
   - **Your Access Token**
   - **Your Refresh Token**

## Étape 2 : Configurer les variables d'environnement

1. Créez un fichier `.env.strava` à la racine du projet (copiez `.env.strava.example`).
2. Remplissez-le avec vos identifiants :

```env
STRAVA_CLIENT_ID=votre_client_id
STRAVA_CLIENT_SECRET=votre_client_secret
STRAVA_REFRESH_TOKEN=votre_refresh_token
```

> **Note importante** : Le "Refresh Token" est crucial car les "Access Token" expirent toutes les 6 heures. Le script utilisera le Refresh Token pour générer de nouveaux Access Tokens automatiquement.

## Étape 3 : Installer les dépendances

Le script utilise la librairie `stravalib`.

```bash
pip install stravalib
```

## Étape 4 : Lancer la synchronisation

Une fois configuré, vous pourrez lancer la synchronisation manuellement ou automatiquement (comme pour Garmin).

```bash
python3 scripts/strava-sync.py
```
