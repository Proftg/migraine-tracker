# 🚀 Guide de Lancement Rapide - Migraine Tracker

## ✅ Checklist Pré-Lancement

### 1. Vérification de l'Installation Flutter

```bash
# Vérifier l'installation de Flutter
flutter --version

# Si Flutter n'est pas installé, suivez:
# https://docs.flutter.dev/get-started/install

# Vérifier les dépendances système
flutter doctor -v
```

**Résultat attendu**:
```
Flutter 3.24.0 • channel stable
✓ Flutter (Channel stable, 3.24.0, on ...)
✓ Android toolchain - develop for Android devices
✓ Chrome - develop for the web
✓ Android Studio (version ...)
✓ VS Code (version ...)
✓ Connected device (1 available)
✓ Network resources
```

### 2. Configuration du Projet

```bash
# Naviguer vers le projet
cd /path/to/migraine_tracker

# Installer les dépendances
flutter pub get

# Vérifier qu'il n'y a pas d'erreurs
flutter analyze
```

### 3. Génération des Fichiers Isar

```bash
# TRÈS IMPORTANT: Générer les fichiers .g.dart
flutter pub run build_runner build --delete-conflicting-outputs

# Vérifier que les fichiers sont générés
ls lib/models/migraine_attack.g.dart
```

**Si erreur**: Installer build_runner manuellement
```bash
flutter pub add build_runner --dev
flutter pub add isar_generator --dev
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🎯 Options de Lancement

### Option A: Android (Recommandé pour test)

#### 1. Avec Émulateur

```bash
# Lister les émulateurs disponibles
flutter emulators

# Lancer un émulateur (remplacer <ID> par l'ID de votre émulateur)
flutter emulators --launch <ID>

# Exemple:
# flutter emulators --launch Pixel_5_API_33

# Attendre que l'émulateur soit prêt, puis:
flutter run
```

#### 2. Avec Appareil Physique

```bash
# Connecter votre téléphone Android en USB
# Activer "Mode développeur" et "Débogage USB"

# Vérifier que l'appareil est détecté
flutter devices

# Lancer l'application
flutter run
```

**Résultat attendu**: L'application se lance et affiche le Dashboard

### Option B: Desktop (Windows/Mac/Linux)

#### Windows

```bash
# Lancer sur Windows
flutter run -d windows

# Ou build exécutable
flutter build windows --release
# L'exécutable sera dans: build/windows/runner/Release/migraine_tracker.exe
```

#### macOS

```bash
# Lancer sur macOS
flutter run -d macos

# Ou build app
flutter build macos --release
# L'app sera dans: build/macos/Build/Products/Release/migraine_tracker.app
```

#### Linux

```bash
# Lancer sur Linux
flutter run -d linux

# Ou build exécutable
flutter build linux --release
# L'exécutable sera dans: build/linux/x64/release/bundle/
```

### Option C: Web (Pour démo rapide)

```bash
# Lancer en mode web
flutter run -d chrome

# Ou build pour déploiement
flutter build web
# Les fichiers seront dans: build/web/
```

## 🧪 Génération de Données de Test

### Option 1: Via Code (Recommandé)

Ajouter cette ligne dans `lib/main.dart`, juste après `await db.initializeDefaultData();`:

```dart
// Dans la fonction main()
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);
  
  final db = DatabaseService();
  await db.initializeDefaultData();
  
  // AJOUTER CETTE LIGNE pour générer des données de test
  await generateTestData();  // ← AJOUTER ICI
  
  runApp(const MigraineTrackerApp());
}

// Et ajouter cet import en haut du fichier
import 'utils/test_data_generator.dart';
```

Puis relancer l'app:
```bash
flutter run
```

### Option 2: Manuellement

1. Lancer l'application
2. Cliquer sur **"+ ENREGISTRER UNE CRISE"**
3. Remplir les 3 étapes
4. Enregistrer plusieurs crises
5. Observer les statistiques s'actualiser

## 🔄 Hot Reload et Modifications

### Pendant le développement

```bash
# L'application est lancée avec: flutter run

# Faire des modifications dans le code
# Puis dans le terminal:
r    # Hot reload (rapide)
R    # Hot restart (complet)
q    # Quitter
```

### Voir les logs

```bash
# Logs en temps réel
flutter logs

# Logs avec filtre
flutter logs | grep "Error"
```

## 🐛 Résolution de Problèmes Courants

### Problème 1: "Isar not initialized"

**Solution**:
```bash
# Régénérer les fichiers Isar
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Problème 2: "No devices found"

**Solutions**:
```bash
# Vérifier les appareils disponibles
flutter devices

# Pour Android: Lancer un émulateur
flutter emulators
flutter emulators --launch <ID>

# Pour Desktop: Spécifier la plateforme
flutter run -d windows    # ou macos, linux
flutter run -d chrome      # ou edge
```

### Problème 3: Erreurs de build

**Solutions**:
```bash
# Nettoyer le cache
flutter clean

# Réinstaller les dépendances
flutter pub get

# Régénérer les fichiers
flutter pub run build_runner build --delete-conflicting-outputs

# Relancer
flutter run
```

### Problème 4: "Locked files" sur Windows

**Solution**:
```bash
# Tuer tous les processus Dart/Flutter
taskkill /F /IM dart.exe
taskkill /F /IM flutter.exe

# Puis réessayer
flutter run
```

### Problème 5: Intl/Localisation errors

**Solution**:
```bash
# Vérifier que intl est installé
flutter pub add intl

# Redémarrer l'app
flutter run
```

## 📱 Builds de Production

### Android APK (Pour distribution)

```bash
# Build APK de production
flutter build apk --release

# Le fichier APK sera dans:
# build/app/outputs/flutter-apk/app-release.apk

# Installer sur un appareil
adb install build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle (Pour Google Play)

```bash
# Build App Bundle
flutter build appbundle --release

# Le fichier AAB sera dans:
# build/app/outputs/bundle/release/app-release.aab
```

### iOS (Mac uniquement)

```bash
# Build iOS
flutter build ios --release

# Puis ouvrir dans Xcode pour signature et distribution
open ios/Runner.xcworkspace
```

## 🎨 Personnalisation

### Changer les Couleurs

Éditer `lib/main.dart`:
```dart
colorScheme: const ColorScheme.dark(
  primary: Color(0xFF4F46E5),  // Changer ici
  secondary: Color(0xFF7C3AED),
  // ...
),
```

### Changer la Langue

Éditer `lib/main.dart`:
```dart
locale: const Locale('fr', 'FR'),  // 'en', 'US' ou 'nl', 'NL'
```

### Changer les Données par Défaut

Éditer `lib/services/database_service.dart` dans la fonction `initializeDefaultData()`.

## 📊 Monitoring et Debug

### Flutter DevTools

```bash
# Lancer l'app en mode debug
flutter run

# Dans un autre terminal, lancer DevTools
flutter pub global activate devtools
flutter pub global run devtools

# Ouvrir le navigateur à l'URL indiquée
```

### Performance Overlay

Dans l'app, ajouter cette ligne dans `main.dart`:
```dart
MaterialApp(
  showPerformanceOverlay: true,  // Affiche les métriques de performance
  // ...
)
```

## 🚀 Commandes Rapides Récapitulatives

```bash
# Installation complète depuis zéro
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run

# Avec données de test (ajouter import dans main.dart d'abord)
# Décommenter la ligne "await generateTestData();" dans main.dart
flutter run

# Build production Android
flutter build apk --release

# Build production Windows
flutter build windows --release

# Nettoyer et rebuild
flutter clean && flutter pub get && flutter run
```

## ✅ Vérification Post-Installation

Une fois l'application lancée, vérifier:

1. ✅ Le Dashboard s'affiche correctement
2. ✅ Les statistiques mensuelles sont visibles
3. ✅ Le bouton "+ ENREGISTRER UNE CRISE" est accessible
4. ✅ Le formulaire d'ajout de crise (3 étapes) fonctionne
5. ✅ L'enregistrement d'une crise met à jour le Dashboard
6. ✅ La navigation bottom bar fonctionne
7. ✅ Les couleurs et le thème sombre sont appliqués

## 📞 Support

En cas de problème:

1. **Vérifier les erreurs**: `flutter analyze`
2. **Consulter les logs**: `flutter logs`
3. **Nettoyer le cache**: `flutter clean`
4. **Vérifier la documentation**: https://docs.flutter.dev
5. **Stack Overflow**: Rechercher l'erreur spécifique

## 🎉 Félicitations!

Si tout fonctionne, vous avez maintenant une application Migraine Tracker fonctionnelle! 🎉

**Prochaines étapes**:
1. Tester toutes les fonctionnalités
2. Enregistrer quelques crises
3. Observer les statistiques évoluer
4. Fournir des retours pour amélioration

---

**Bon développement! 💪**

_Version: 1.0.0_  
_Dernière mise à jour: Novembre 2025_
