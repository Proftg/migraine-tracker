# 🚀 Guide de Test Rapide - Intégration Garmin/Strava

## 📋 Résumé

Vous venez de recevoir une intégration complète Garmin Health et Strava Activities dans votre application Flutter Migraine Tracker.

**Nouveaux fichiers créés** (6):
1. `lib/models/garmin_health_data.dart` - Modèle données Garmin
2. `lib/models/strava_activity.dart` - Modèle activités Strava  
3. `lib/services/health_sync_service.dart` - Service de synchronisation
4. `lib/screens/health_data_screen.dart` - Interface utilisateur
5. `pubspec.yaml` - Configuration dépendances
6. `GARMIN_STRAVA_INTEGRATION.md` - Documentation complète

## ⚡ Test Rapide (5 minutes)

### Étape 1: Installer les dépendances

```bash
cd ~/project/migraine_tracker
flutter pub get
```

### Étape 2: Générer les fichiers Isar

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Cette commande génère automatiquement:
- `lib/models/garmin_health_data.g.dart`
- `lib/models/strava_activity.g.dart`

### Étape 3: Mettre à jour database_service.dart

Ouvrir `lib/services/database_service.dart` et ajouter les nouveaux schémas:

```dart
import '../models/garmin_health_data.dart';
import '../models/strava_activity.dart';

Future<void> initialize() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [
      MigraineAttackSchema,
      // ... autres schémas existants ...
      GarminHealthDataSchema,      // ← AJOUTER
      StravaActivitySchema,         // ← AJOUTER
    ],
    directory: dir.path,
  );
}
```

### Étape 4: Lancer l'application

```bash
flutter run
```

ou sur un appareil spécifique:

```bash
flutter run -d windows   # Windows
flutter run -d chrome    # Web
flutter run -d android   # Android (si émulateur/appareil connecté)
```

### Étape 5: Tester l'interface

1. Dans l'app, chercher le nouvel écran "Données Complètes" ou "Santé"
2. Cliquer sur l'onglet "Garmin Health"
3. Utiliser les flèches ←/→ pour naviguer entre les dates

## 📊 Test avec données fictives

Si vous n'avez pas encore de backend configuré, vous pouvez tester avec des données fictives.

### Créer un fichier de test

Créer `lib/utils/test_health_data.dart`:

```dart
import 'package:isar/isar.dart';
import '../models/garmin_health_data.dart';
import '../models/strava_activity.dart';

Future<void> populateTestData(Isar isar) async {
  // Données Garmin pour les 7 derniers jours
  final List<GarminHealthData> garminData = [];
  
  for (int i = 0; i < 7; i++) {
    final date = DateTime.now().subtract(Duration(days: i));
    
    garminData.add(GarminHealthData(
      sleepScore: 70 + (i * 5) % 30,
      sleepDurationMinutes: 420 + (i * 20),
      averageStress: 40 + (i * 10) % 40,
      steps: 6000 + (i * 1000),
      restingHeartRate: 60 + i,
    )
      ..date = DateTime(date.year, date.month, date.day)
      ..deepSleepMinutes = 90 + (i * 10)
      ..lightSleepMinutes = 200 + (i * 15)
      ..remSleepMinutes = 130 + (i * 5)
      ..maxStress = 60 + (i * 5)
      ..bodyBatteryAverage = 65 + i * 5
      ..lastSync = DateTime.now()
      ..source = 'test');
  }
  
  // Activités Strava fictives
  final List<StravaActivity> activities = [
    StravaActivity(
      stravaId: 12345001,
      startDate: DateTime.now().subtract(const Duration(days: 2, hours: 8)),
      activityType: 'Run',
      name: 'Morning Run',
      durationSeconds: 3600,
      distanceMeters: 10000,
    )
      ..averageHeartRate = 145
      ..maxHeartRate = 165
      ..perceivedExertion = 6
      ..calories = 750,
    
    StravaActivity(
      stravaId: 12345002,
      startDate: DateTime.now().subtract(const Duration(days: 5, hours: 18)),
      activityType: 'Ride',
      name: 'Evening Bike',
      durationSeconds: 5400,
      distanceMeters: 30000,
    )
      ..averageHeartRate = 135
      ..maxHeartRate = 160
      ..perceivedExertion = 7
      ..elevationGain = 450,
  ];
  
  // Insérer dans la base de données
  await isar.writeTxn(() async {
    await isar.garminHealthDatas.putAll(garminData);
    await isar.stravaActivitys.putAll(activities);
  });
  
  print('✅ ${garminData.length} jours Garmin et ${activities.length} activités Strava ajoutés');
}
```

### Appeler depuis le dashboard

Dans `dashboard_screen.dart` ou `main.dart`, ajouter un bouton "Charger données test":

```dart
FloatingActionButton(
  onPressed: () async {
    final dbService = DatabaseService();
    await dbService.initialize();
    await populateTestData(dbService.isar);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Données de test chargées!')),
    );
  },
  child: const Icon(Icons.science),
)
```

## 🔧 Dépannage rapide

### Erreur: "Could not resolve com.gu.option:option"

**Solution**: Dans `android/build.gradle`, changer:
```gradle
buildscript {
    ext.kotlin_version = '1.9.0'  // Version plus récente
}
```

### Erreur: "No such table: GarminHealthData"

**Solution**: Vous avez oublié l'étape 2 (build_runner)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Erreur: "Connection refused localhost:3000"

**Solution**: Normal si vous n'avez pas encore de backend. Utilisez les données de test (voir ci-dessus).

### Application ne compile pas

**Solution**: Vérifier que toutes les dépendances sont installées

```bash
flutter doctor      # Vérifier environnement Flutter
flutter clean       # Nettoyer le cache
flutter pub get     # Réinstaller dépendances
```

## 📱 Captures d'écran attendues

Après avoir lancé l'app avec succès, vous devriez voir:

1. **Dashboard principal** (inchangé)
2. **Nouvel onglet** "Données Complètes" ou "Santé"
3. **Interface Garmin** avec:
   - Sélecteur de date (←/→)
   - Métriques de sommeil, stress, activité
   - Alertes jours à risque (si critères remplis)
4. **Section Strava** avec:
   - Liste des activités du jour
   - Icônes par type (🏃 🚴 🏊)
   - Métriques (durée, distance, allure)
   - Alertes activités déclencheuses

## 🎯 Prochaines étapes

### Immédiat
- [ ] Tester l'application avec données fictives
- [ ] Vérifier l'affichage de toutes les métriques
- [ ] Tester la navigation entre dates

### Court terme (1-2 jours)
- [ ] Configurer le backend (Next.js ou Python)
- [ ] Tester synchronisation réelle Garmin
- [ ] Tester synchronisation réelle Strava
- [ ] Ajouter widget sur dashboard principal

### Moyen terme (1 semaine)
- [ ] Créer graphiques d'évolution temporelle
- [ ] Implémenter analyses de corrélation
- [ ] Ajouter alertes préventives
- [ ] Documentation utilisateur

## 📞 Support

Si vous rencontrez des problèmes:

1. Vérifier `flutter doctor` (environnement OK?)
2. Vérifier les logs (`flutter run --verbose`)
3. Consulter `GARMIN_STRAVA_INTEGRATION.md` (documentation complète)
4. Chercher l'erreur dans le rapport `INTEGRATION_REPORT.md`

---

**Bon test ! 🚀**

**TAHAR GUENFOUD**  
8 Décembre 2025
