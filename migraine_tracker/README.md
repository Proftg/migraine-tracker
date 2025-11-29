# 🎯 Migraine Tracker - Application de Suivi des Migraines

Application Flutter complète pour le suivi intelligent des crises de migraine avec support IA, rapports détaillés et export PDF/Excel.

## ✨ Fonctionnalités MVP

- ✅ **Dashboard interactif** avec statistiques mensuelles
- ✅ **Enregistrement détaillé des crises** (3 étapes guidées)
- ✅ **Suivi des médicaments** avec traitement de secours
- ✅ **Indicateurs d'évolution mensuelle** (changement vs mois précédent)
- ✅ **Base de données locale** (Isar)
- ✅ **Interface sombre** optimisée pour les migraines
- 🚧 **Journal quotidien** (à venir)
- 🚧 **Rapports et graphiques** (à venir)
- 🚧 **Export PDF/Excel** (à venir)
- 🚧 **Analyse IA** (à venir)

## 📋 Prérequis

1. **Flutter SDK** (version 3.24.0 ou supérieure)
   - Télécharger: https://docs.flutter.dev/get-started/install
   - Vérifier: `flutter --version`

2. **Android Studio** ou **VS Code** avec extensions Flutter

3. **Un émulateur** (Android/iOS) ou **un appareil physique**

## 🚀 Installation et Lancement

### Étape 1: Récupérer le projet

```bash
# Naviguer vers le dossier du projet
cd migraine_tracker
```

### Étape 2: Installer les dépendances

```bash
flutter pub get
```

### Étape 3: Générer les fichiers Isar

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Cette commande génère les fichiers `.g.dart` nécessaires pour Isar (base de données).

### Étape 4: Lancer l'application

#### Option A: Sur émulateur Android/iOS

```bash
# Démarrer un émulateur
flutter emulators --launch <emulator_id>

# Puis lancer l'app
flutter run
```

#### Option B: Sur appareil physique

```bash
# Connecter votre appareil en USB (mode développeur activé)
flutter devices  # Pour vérifier que l'appareil est détecté

flutter run
```

#### Option C: Version Desktop (Windows/macOS/Linux)

```bash
# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

## 📱 Utilisation de l'Application

### 1. Premier Lancement

Au premier lancement, l'application:
- Initialise la base de données
- Crée un profil utilisateur par défaut (TAHAR GUENFOUD)
- Charge des médicaments prédéfinis (Sumatriptan, Ibuprofène, etc.)

### 2. Enregistrer une Crise

1. Sur le **Dashboard**, cliquer sur **"+ ENREGISTRER UNE CRISE"**
2. **Étape 1/3**: Date, heure, intensité, localisation
3. **Étape 2/3**: Symptômes associés
4. **Étape 3/3**: Traitements et efficacité
5. Cliquer sur **"✓ ENREGISTRER"**

### 3. Consulter les Statistiques

Le Dashboard affiche automatiquement:
- Nombre de crises du mois en cours
- Évolution vs mois précédent (%)
- Intensité moyenne
- Jours avec médication
- Prochaine injection préventive

## 🏗️ Structure du Projet

```
migraine_tracker/
├── lib/
│   ├── main.dart                          # Point d'entrée
│   ├── models/
│   │   ├── migraine_attack.dart           # Modèles de données
│   │   └── migraine_attack.g.dart         # Généré par Isar
│   ├── services/
│   │   └── database_service.dart          # Service base de données
│   └── screens/
│       ├── dashboard_screen.dart          # Écran principal
│       ├── add_attack_screen.dart         # Étape 1: Crise
│       ├── add_attack_step2_screen.dart   # Étape 2: Symptômes
│       └── add_attack_step3_screen.dart   # Étape 3: Traitement
├── pubspec.yaml                           # Dépendances
└── README.md                              # Ce fichier
```

## 🎨 Design

### Palette de Couleurs (Mode Sombre)

- **Background**: `#1A1A2E` (Bleu très sombre)
- **Cards**: `#0F3460` (Bleu foncé)
- **Accent**: `#4F46E5` (Indigo vif)
- **Success**: `#10B981` (Vert)
- **Warning**: `#F59E0B` (Orange)
- **Error**: `#EF4444` (Rouge doux)

### Navigation

- 🏠 **Accueil**: Dashboard principal
- 📝 **Journal**: Journal quotidien (placeholder)
- 📊 **Rapports**: Analyses et graphiques (placeholder)
- ⚙️ **Paramètres**: Configuration (placeholder)

## 🔧 Dépannage

### Problème: "Isar not found"

**Solution**:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Problème: "No devices found"

**Solution**:
```bash
# Vérifier les appareils disponibles
flutter devices

# Lancer un émulateur
flutter emulators
flutter emulators --launch <id>
```

### Problème: Erreurs de compilation

**Solution**:
```bash
# Nettoyer le cache
flutter clean

# Réinstaller les dépendances
flutter pub get

# Reconstruire
flutter run
```

## 📊 Base de Données

L'application utilise **Isar** (base de données NoSQL locale):

- **Avantages**: Rapide, efficace, multiplateforme
- **Localisation**: `/data/data/com.example.migraine_tracker/databases/`
- **Collections**:
  - `MigraineAttack`: Crises de migraine
  - `DailyLog`: Journal quotidien
  - `Medication`: Médicaments
  - `InjectionRecord`: Injections préventives
  - `UserProfile`: Profil utilisateur

## 🚧 Développement Futur

### Phase 2 (Prochaine)

- [ ] Journal quotidien fonctionnel
- [ ] Intégration API météo
- [ ] Graphiques d'évolution
- [ ] Calendrier mensuel des crises

### Phase 3

- [ ] Module IA (détection de patterns)
- [ ] Export PDF/Excel
- [ ] Synchronisation cloud (optionnelle)
- [ ] Notifications intelligentes

### Phase 4

- [ ] Intégration wearables
- [ ] Partage avec médecin
- [ ] Support multilingue complet (FR/EN/NL)

## 📝 Notes Importantes

### Données de Test

Pour tester l'application avec des données simulées, vous pouvez:

1. Enregistrer manuellement quelques crises
2. Ou créer un script de génération de données (voir section ci-dessous)

### Personnalisation

Pour adapter l'application à votre profil:

1. Aller dans **Paramètres**
2. Modifier **Informations personnelles**
3. Configurer **Traitement préventif**
4. Ajuster **Objectifs thérapeutiques**

## 🔐 Confidentialité

- ✅ Données stockées **localement uniquement**
- ✅ Aucune connexion internet requise
- ✅ Pas de compte utilisateur
- ✅ Export de données disponible
- ✅ Conforme RGPD

## 📞 Support

Pour toute question ou problème:
- 📧 Email: support@migrainetracker.app
- 🐛 Issues: GitHub Issues
- 📖 Documentation: Wiki du projet

## 📄 Licence

MIT License - Libre d'utilisation et modification

---

## 🎯 Guide de Démarrage Rapide

```bash
# 1. Installer les dépendances
flutter pub get

# 2. Générer les fichiers Isar
flutter pub run build_runner build --delete-conflicting-outputs

# 3. Lancer l'application
flutter run

# 4. Profiter! 🎉
```

**Version**: 1.0.0 (MVP)  
**Dernière mise à jour**: Novembre 2025  
**Développé pour**: TAHAR GUENFOUD

---

💡 **Astuce**: Pour une meilleure expérience, utilisez l'application en mode sombre (activé par défaut) pour réduire la fatigue visuelle pendant les crises.
