# 🛠️ Installation Flutter - Guide Complet

## 📋 Situation Actuelle

L'intégration Garmin/Strava a été créée avec succès, mais Flutter n'est pas installé sur votre système. Vous avez deux options :

---

## ✅ Option 1 : Installer Flutter (Recommandé)

### Pour Windows

1. **Télécharger Flutter SDK**
   - Aller sur : https://docs.flutter.dev/get-started/install/windows
   - Télécharger : `flutter_windows_3.24.5-stable.zip` (ou version plus récente)
   - Extraire dans : `C:\src\flutter`

2. **Ajouter au PATH**
   - Ouvrir "Modifier les variables d'environnement système"
   - Variables d'environnement → Path → Modifier
   - Ajouter : `C:\src\flutter\bin`
   - OK → Redémarrer terminal

3. **Vérifier installation**
   ```powershell
   flutter doctor
   ```

4. **Installer dépendances Windows**
   ```powershell
   # Visual Studio 2022 avec "Desktop development with C++"
   # Télécharger depuis : https://visualstudio.microsoft.com/downloads/
   ```

5. **Activer support Windows**
   ```powershell
   flutter config --enable-windows-desktop
   ```

### Pour WSL/Linux

```bash
# Télécharger Flutter
cd ~
git clone https://github.com/flutter/flutter.git -b stable

# Ajouter au PATH
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.zshrc
source ~/.zshrc

# Vérifier
flutter doctor

# Installer dépendances Linux
sudo apt-get update
sudo apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev
```

---

## 🚀 Option 2 : Utiliser VS Code avec Flutter Extension (Plus simple)

1. **Installer VS Code**
   - Télécharger : https://code.visualstudio.com/

2. **Installer extensions**
   - Flutter (par Dart Code)
   - Dart (automatiquement avec Flutter)

3. **Ouvrir projet**
   ```
   Code → Fichier → Ouvrir dossier
   Sélectionner : ~/project/Maven/migraine-tracker/migraine_tracker
   ```

4. **Flutter SDK**
   - VS Code détectera automatiquement l'absence de Flutter
   - Cliquer sur "Download SDK" dans la notification
   - Suivre les instructions

---

## ⚡ Option 3 : Tester sans Flutter (Vérification code)

En attendant l'installation de Flutter, vous pouvez :

### 1. Vérifier les fichiers créés

```bash
cd ~/project/Maven/migraine-tracker/migraine_tracker

# Vérifier modèles
ls -la lib/models/
# Devrait contenir :
# - garmin_health_data.dart ✓
# - strava_activity.dart ✓

# Vérifier service
ls -la lib/services/
# Devrait contenir :
# - health_sync_service.dart ✓

# Vérifier écran
ls -la lib/screens/
# Devrait contenir :
# - health_data_screen.dart ✓
```

### 2. Lire la documentation

```bash
# Guide complet d'intégration
cat ~/project/Maven/migraine-tracker/GARMIN_STRAVA_INTEGRATION.md

# Rapport détaillé
cat ~/project/Maven/migraine-tracker/INTEGRATION_REPORT.md

# Guide test rapide
cat ~/project/Maven/migraine-tracker/QUICKSTART_TEST.md
```

### 3. Vérifier le code

```bash
# Voir le modèle Garmin
cat lib/models/garmin_health_data.dart | head -50

# Voir le service de sync
cat lib/services/health_sync_service.dart | head -50
```

---

## 📦 Une fois Flutter installé

### Étape 1 : Aller dans le projet

```bash
cd ~/project/Maven/migraine-tracker/migraine_tracker
```

### Étape 2 : Ajouter dépendance HTTP

Modifier `pubspec.yaml`, ajouter dans `dependencies:` :

```yaml
dependencies:
  # ... existant ...
  http: ^1.2.0  # ← AJOUTER
```

### Étape 3 : Installer dépendances

```bash
flutter pub get
```

### Étape 4 : Générer fichiers Isar

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Cela va générer :
- `lib/models/garmin_health_data.g.dart`
- `lib/models/strava_activity.g.dart`

### Étape 5 : Mettre à jour database_service.dart

Ouvrir `lib/services/database_service.dart` et ajouter :

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

### Étape 6 : Lancer l'application

```bash
# Windows
flutter run -d windows

# Web
flutter run -d chrome

# Vérifier appareils disponibles
flutter devices
```

---

## 🔧 Dépannage

### "flutter: command not found"

**Cause** : Flutter pas dans le PATH

**Solution** :
```bash
# Vérifier si Flutter existe
ls ~/flutter/bin/flutter  # Linux/WSL
ls C:\src\flutter\bin\flutter.bat  # Windows

# Si oui, ajouter au PATH (voir instructions au début)
```

### "No devices found"

**Cause** : Pas d'appareil/émulateur configuré

**Solution** :
```bash
# Activer support Windows
flutter config --enable-windows-desktop

# Ou utiliser Chrome
flutter run -d chrome
```

### "Visual Studio not found"

**Cause** : VS 2022 pas installé (Windows)

**Solution** :
1. Télécharger Visual Studio 2022 Community
2. Installer "Desktop development with C++"
3. Redémarrer terminal
4. `flutter doctor` pour vérifier

---

## 📞 Résumé des Actions

### Action Immédiate

**Choisir et suivre une option d'installation** :
- Option 1 : Installer Flutter manuellement (30 min)
- Option 2 : Utiliser VS Code + Flutter extension (20 min)

### Après Installation

```bash
cd ~/project/Maven/migraine-tracker/migraine_tracker
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
# Modifier database_service.dart (ajouter schémas)
flutter run -d windows
```

### Fichiers Déjà Prêts ✅

- ✅ Modèles de données (Garmin + Strava)
- ✅ Service de synchronisation
- ✅ Interface utilisateur
- ✅ Documentation complète
- ✅ Guide de test

**Il ne manque que l'installation de Flutter pour tester !**

---

## 🎯 Prochaine Étape Recommandée

**Installer Flutter via Option 2 (VS Code)** car c'est le plus simple et le plus rapide.

Une fois installé, revenez vers moi et je vous guiderai pour :
1. Générer les fichiers Isar
2. Mettre à jour le service de base de données
3. Lancer l'application
4. Tester avec des données fictives

---

**Questions ? Besoin d'aide pour l'installation ?**
