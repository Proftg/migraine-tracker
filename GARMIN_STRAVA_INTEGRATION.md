# 🔗 Intégration Garmin Health & Strava Activities

## 📋 Vue d'ensemble

Cette intégration permet de synchroniser et d'analyser les données de santé Garmin et les activités Strava dans l'application Flutter Migraine Tracker, afin d'identifier les corrélations entre l'activité physique, la qualité du sommeil, le stress et les crises de migraine.

## 🏗️ Architecture

### Composants créés

```
lib/
├── models/
│   ├── garmin_health_data.dart        # Modèle données Garmin (sommeil, stress, activité)
│   └── strava_activity.dart           # Modèle activités Strava (sports)
├── services/
│   └── health_sync_service.dart       # Service synchronisation & requêtes
└── screens/
    └── health_data_screen.dart        # Interface utilisateur
```

### Flux de données

```
Backend API (Python)
        ↓
  HTTP Request
        ↓
Flutter App (health_sync_service.dart)
        ↓
  Parse JSON
        ↓
Isar Database (local storage)
        ↓
UI (health_data_screen.dart)
```

## 📊 Données collectées

### Garmin Health Data

| Métrique | Type | Description | Utilité Migraine |
|----------|------|-------------|------------------|
| **sleepScore** | int (0-100) | Score qualité sommeil | ⭐⭐⭐ Corrélation forte |
| **sleepDurationMinutes** | int | Durée totale sommeil | ⭐⭐⭐ Manque de sommeil = déclencheur |
| **deepSleepMinutes** | int | Phase sommeil profond | ⭐⭐ Récupération |
| **averageStress** | int (0-100) | Niveau stress moyen | ⭐⭐⭐ Stress = déclencheur majeur |
| **steps** | int | Nombre de pas | ⭐ Activité générale |
| **restingHeartRate** | int (bpm) | FC au repos | ⭐⭐ Indicateur santé |
| **bodyBatteryAverage** | int (0-100) | Niveau d'énergie | ⭐⭐ État général |

### Strava Activities

| Métrique | Type | Description | Utilité Migraine |
|----------|------|-------------|------------------|
| **activityType** | String | Type d'activité (Run, Ride, Swim) | ⭐⭐ Type d'effort |
| **durationSeconds** | int | Durée activité | ⭐⭐⭐ Effort prolongé = risque |
| **distanceMeters** | double | Distance parcourue | ⭐ Intensité |
| **averageHeartRate** | int (bpm) | FC moyenne | ⭐⭐⭐ Intensité cardiaque |
| **perceivedExertion** | int (1-10) | Effort perçu (RPE) | ⭐⭐⭐ Intensité subjective |
| **temperature** | double | Température extérieure | ⭐⭐ Chaleur = déclencheur |

## 🔧 Configuration requise

### 1. Dépendances Flutter (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  isar: ^3.1.0+1
  isar_flutter_libs: ^3.1.0+1
  http: ^1.1.0

dev_dependencies:
  isar_generator: ^3.1.0+1
  build_runner: ^2.4.6
```

### 2. Backend API

Le projet nécessite un backend pour gérer l'authentification Garmin/Strava et récupérer les données.

**Option A**: Utiliser le projet Next.js existant (`~/project/Maven/migraine-tracker`)

```bash
cd ~/project/Maven/migraine-tracker
npm install
npm run dev  # Lance sur http://localhost:3000
```

**Option B**: Créer des endpoints Python/Flask

```python
# Exemple endpoint Garmin
@app.route('/api/garmin/sync')
def garmin_sync():
    # Authentification Garmin via garth
    # Récupération données
    # Retour JSON
    pass

# Exemple endpoint Strava
@app.route('/api/strava/activities')
def strava_activities():
    # Authentification Strava OAuth
    # Récupération activités
    # Retour JSON
    pass
```

### 3. Variables d'environnement

**Backend** (`.env.garmin` et `.env.strava`):

```env
# Garmin
GARMIN_EMAIL=votre.email@example.com
GARMIN_PASSWORD=votre_mot_de_passe

# Strava
STRAVA_CLIENT_ID=12345
STRAVA_CLIENT_SECRET=abc123xyz
STRAVA_REFRESH_TOKEN=def456uvw
```

**Flutter** (constants.dart):

```dart
class ApiConstants {
  static const String baseUrl = 'http://localhost:3000';
  static const String garminEndpoint = '/api/garmin';
  static const String stravaEndpoint = '/api/strava';
}
```

## 🚀 Installation

### Étape 1 : Générer les fichiers Isar

```bash
cd ~/project/migraine_tracker
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

Cela génère :
- `lib/models/garmin_health_data.g.dart`
- `lib/models/strava_activity.g.dart`

### Étape 2 : Mettre à jour database_service.dart

Ajouter les nouvelles collections Isar :

```dart
// Dans database_service.dart
Future<void> initialize() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [
      MigraineAttackSchema,
      DailyLogSchema,
      MedicationSchema,
      InjectionRecordSchema,
      UserProfileSchema,
      GarminHealthDataSchema,      // ← Nouveau
      StravaActivitySchema,         // ← Nouveau
    ],
    directory: dir.path,
  );
}
```

### Étape 3 : Ajouter l'écran dans la navigation

```dart
// Dans main.dart ou dashboard
bottomNavigationBar: BottomNavigationBar(
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Journal'),
    BottomNavigationBarItem(icon: Icon(Icons.assessment), label: 'Rapports'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Santé'),  // ← Nouveau
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Réglages'),
  ],
  onTap: (index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => HealthDataScreen()),
      );
    }
  },
)
```

### Étape 4 : Configurer le backend

```bash
# Option A: Next.js existant
cd ~/project/Maven/migraine-tracker
npm install
cp .env.garmin.example .env.garmin
cp .env.strava.example .env.strava
# Éditer .env.garmin et .env.strava avec vos identifiants
npm run dev

# Option B: Python Flask
pip install garth stravalib flask flask-cors python-dotenv
python backend_server.py
```

## 📱 Utilisation

### Synchronisation initiale

```dart
// Dans HealthDataScreen
await _syncData();  // Synchronise les 30 derniers jours
```

### Requêtes de données

```dart
final syncService = HealthSyncService(isar);

// Récupérer données Garmin d'une date
final garminData = await syncService.getGarminDataForDate(DateTime.now());
print('Score sommeil: ${garminData?.sleepScore}');

// Récupérer activités Strava d'une date
final activities = await syncService.getStravaActivitiesForDate(DateTime.now());
print('Activités: ${activities.length}');

// Récupérer données période
final garminPeriod = await syncService.getGarminDataForPeriod(
  start: DateTime.now().subtract(Duration(days: 7)),
  end: DateTime.now(),
);
```

### Détection jours à risque

```dart
if (garminData.isHighRiskDay) {
  print('⚠️ Jour à risque détecté!');
  print('Facteurs: Mauvais sommeil + Stress élevé + Faible activité');
}
```

### Détection activités déclencheuses

```dart
if (activity.isPotentialTrigger) {
  print('⚠️ Activité potentiellement déclencheuse!');
  print('Facteurs: Haute intensité + Longue durée + Chaleur');
}
```

## 🧪 Tests

### 1. Test synchronisation manuelle

```bash
# Backend doit être lancé
cd ~/project/migraine_tracker
flutter run

# Dans l'app:
# 1. Aller sur l'écran "Santé"
# 2. Cliquer sur l'icône de synchronisation
# 3. Vérifier les logs
```

### 2. Test avec données de test

```dart
// Dans un fichier de test
void main() async {
  final isar = await Isar.open([GarminHealthDataSchema]);
  final syncService = HealthSyncService(isar);
  
  // Créer données de test
  final testData = GarminHealthData(
    sleepScore: 65,
    averageStress: 70,
    steps: 2500,
  )..date = DateTime.now();
  
  await isar.writeTxn(() async {
    await isar.garminHealthDatas.put(testData);
  });
  
  // Vérifier détection risque
  assert(testData.isHighRiskDay == true);
  print('✅ Test détection risque réussi');
}
```

## 📊 Analyses disponibles

### 1. Corrélation Sommeil - Migraines

```dart
// Comparer score sommeil les jours avec/sans migraine
final garminDataList = await syncService.getGarminDataForPeriod(...);
final migraineAttacks = await dbService.getAllMigraineAttacks();

// Calculer score sommeil moyen
double avgSleepWithMigraine = ...;
double avgSleepWithoutMigraine = ...;

// Afficher corrélation
print('Sommeil avec migraine: $avgSleepWithMigraine');
print('Sommeil sans migraine: $avgSleepWithoutMigraine');
```

### 2. Impact du stress

```dart
// Analyser stress les jours précédant une migraine
for (var attack in migraineAttacks) {
  final dayBefore = attack.startTime.subtract(Duration(days: 1));
  final garminData = await syncService.getGarminDataForDate(dayBefore);
  
  if (garminData?.averageStress != null && garminData!.averageStress! > 60) {
    print('Stress élevé détecté avant migraine du ${attack.startTime}');
  }
}
```

### 3. Activités déclencheuses

```dart
// Identifier types d'activités précédant migraines
for (var attack in migraineAttacks) {
  final sameDay = await syncService.getStravaActivitiesForDate(attack.startTime);
  
  for (var activity in sameDay) {
    if (activity.isPotentialTrigger) {
      print('Activité déclencheuse: ${activity.name} (${activity.activityType})');
    }
  }
}
```

## 🔐 Sécurité et Confidentialité

### Données stockées localement

- ✅ Toutes les données santé sont stockées dans Isar (base locale)
- ✅ Pas de synchronisation cloud par défaut
- ✅ Les identifiants Garmin/Strava restent côté backend
- ✅ Export de données possible (RGPD compliance)

### Authentification

- 🔒 Les credentials Garmin/Strava ne sont **jamais** stockés dans l'app Flutter
- 🔒 Authentification gérée par le backend
- 🔒 Communication via HTTPS en production

## 📈 Roadmap

### Phase 1 (MVP) ✅

- [x] Modèles de données Garmin/Strava
- [x] Service de synchronisation
- [x] Interface de visualisation
- [x] Détection jours à risque

### Phase 2 (Analyses) 🚧

- [ ] Graphiques évolution temporelle
- [ ] Corrélations automatiques
- [ ] Prédictions basées sur patterns
- [ ] Alertes préventives

### Phase 3 (IA) 📋

- [ ] Machine Learning pour prédiction
- [ ] Recommandations personnalisées
- [ ] Détection patterns complexes
- [ ] Intégration avec module IA existant

## 🐛 Dépannage

### Erreur: "No such table: GarminHealthData"

**Solution**: Régénérer les fichiers Isar

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Erreur: "Connection refused"

**Solution**: Vérifier que le backend est lancé

```bash
# Vérifier si le backend tourne
curl http://localhost:3000/api/garmin/health
```

### Pas de données synchronisées

**Solution**: Vérifier les logs backend et les credentials

```bash
# Logs Python
python scripts/garmin-sync.py  # Test manuel

# Logs Next.js
npm run dev  # Voir logs dans la console
```

### Données incomplètes

**Cause**: Garmin Connect peut avoir des données partielles

**Solution**: Synchroniser à nouveau le lendemain

## 📞 Support

Pour toute question sur l'intégration :

- 📧 Email: support@migrainetracker.app
- 🐛 Issues: GitHub Issues
- 📖 Documentation complète: Wiki du projet

---

**Version**: 1.0.0  
**Dernière mise à jour**: Décembre 2025  
**Auteur**: TAHAR GUENFOUD
