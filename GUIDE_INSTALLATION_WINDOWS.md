# 🚀 GUIDE D'INSTALLATION - Migraine Tracker sur Windows

## 📥 Étape 1 : Build l'application Web depuis WSL

Ouvrez un terminal WSL Ubuntu et exécutez :

```bash
cd ~/project/migraine_tracker

# Build l'application web en mode release
flutter build web --release
```

**Temps estimé :** 1-2 minutes

---

## 📂 Étape 2 : Copier les fichiers sur Windows

### Option A : PowerShell (Automatique - RECOMMANDÉ)

1. Téléchargez le fichier : [install_windows.ps1](lien vers le fichier)
2. Clic droit sur le fichier → **Exécuter avec PowerShell**
3. Si erreur de sécurité, ouvrez PowerShell en Admin et tapez :
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
4. Relancez le script

Le script va :
- ✅ Compiler l'application depuis WSL
- ✅ Copier les fichiers vers `C:\Users\tahar\AppData\Local\MigraineTracker`
- ✅ Créer un raccourci sur le Bureau
- ✅ Créer un script de mise à jour

### Option B : Manuel

1. Dans l'explorateur Windows, allez à :
   ```
   \\wsl.localhost\Ubuntu\home\tahar\project\migraine_tracker\build\web
   ```

2. Copiez **tout le contenu** du dossier `web`

3. Collez dans un nouveau dossier sur Windows, par exemple :
   ```
   C:\MigraineTracker
   ```

4. Téléchargez [Lancer_Migraine_Tracker.bat](lien vers le fichier)

5. Placez le fichier `.bat` dans `C:\MigraineTracker`

6. Double-cliquez sur `Lancer_Migraine_Tracker.bat` pour lancer l'app

---

## 🌐 Étape 3 : Lancer l'application

### Méthode 1 : Raccourci Bureau (si script PowerShell utilisé)
Double-cliquez sur **Migraine Tracker** sur votre Bureau

### Méthode 2 : Fichier BAT
Double-cliquez sur `Lancer_Migraine_Tracker.bat`

### Méthode 3 : Navigateur direct
Ouvrez dans Chrome/Brave/Edge :
```
C:\MigraineTracker\index.html
```

Ou avec serveur local (meilleur) :
```
http://localhost:8080
```

---

## 🎯 Accès permanent

### Créer un raccourci manuellement

1. Clic droit sur le Bureau → **Nouveau** → **Raccourci**
2. Emplacement :
   ```
   C:\MigraineTracker\migraine_tracker.html
   ```
   Ou pour lancer avec serveur :
   ```
   C:\MigraineTracker\Lancer_Migraine_Tracker.bat
   ```
3. Nom : **Migraine Tracker**
4. Cliquez sur **Terminer**

### Épingler dans le menu Démarrer

1. Clic droit sur le raccourci
2. **Épingler au menu Démarrer**

### Ajouter à la barre des tâches

1. Clic droit sur le raccourci
2. **Épingler à la barre des tâches**

---

## 🔄 Mise à jour de l'application

Quand vous modifiez le code dans WSL :

### Avec script PowerShell
```powershell
C:\Users\tahar\AppData\Local\MigraineTracker\update.ps1
```

### Manuellement
```bash
# Dans WSL
cd ~/project/migraine_tracker
flutter build web --release

# Puis copiez à nouveau les fichiers depuis :
\\wsl.localhost\Ubuntu\home\tahar\project\migraine_tracker\build\web
```

---

## 📊 Activer les données de test

Pour tester l'application avec des données réalistes :

1. Dans WSL, ouvrez `lib/main.dart` :
   ```bash
   nano ~/project/migraine_tracker/lib/main.dart
   ```

2. Décommentez la ligne :
   ```dart
   await TestDataGenerator.generateTestData();
   ```

3. Sauvegardez et rebuild :
   ```bash
   flutter build web --release
   ```

4. Recopiez les fichiers sur Windows

---

## 🐛 Dépannage

### L'application ne se lance pas
- Vérifiez que tous les fichiers de `build/web` ont été copiés
- Essayez d'ouvrir avec un navigateur différent
- Vérifiez qu'il n'y a pas d'extensions de navigateur qui bloquent

### "Cannot read properties of null"
- L'application utilise IndexedDB (base de données navigateur)
- Ouvrez dans un navigateur moderne (Chrome, Edge, Firefox, Brave)
- Autorisez le stockage local dans les paramètres du navigateur

### Le serveur Python ne démarre pas
- Installez Python depuis python.org
- Ou ouvrez directement `index.html` dans votre navigateur

### Les données ne persistent pas
- Les données sont stockées dans le navigateur
- Ne pas utiliser le mode navigation privée
- Ne pas nettoyer les données du site

---

## 📁 Structure des fichiers

```
C:\MigraineTracker\
├── index.html                          # Page principale
├── main.dart.js                        # Code compilé
├── flutter.js                          # Framework Flutter
├── flutter_service_worker.js           # Service worker
├── manifest.json                       # Métadonnées application
├── version.json                        # Informations version
├── assets/                             # Ressources
├── canvaskit/                          # Moteur de rendu
├── migraine_tracker.html               # Lanceur
└── Lancer_Migraine_Tracker.bat        # Script lancement

```

---

## ✅ Checklist de vérification

Avant de lancer l'application, vérifiez :

- [ ] Flutter build web exécuté avec succès
- [ ] Tous les fichiers de `build/web` copiés
- [ ] Fichier `index.html` présent
- [ ] Dossier `canvaskit` présent
- [ ] Navigateur moderne installé (Chrome/Edge/Firefox/Brave)
- [ ] JavaScript activé dans le navigateur

---

## 🎉 C'est prêt !

Votre application Migraine Tracker est maintenant installée sur Windows !

**Lien direct :** Ouvrez `C:\MigraineTracker\migraine_tracker.html`

**Avec serveur :** Double-cliquez sur `Lancer_Migraine_Tracker.bat`

---

## 📞 Support

Si vous rencontrez des problèmes :

1. Vérifiez la console du navigateur (F12)
2. Essayez un autre navigateur
3. Vérifiez que WSL et Flutter sont à jour
4. Rebuild l'application avec `flutter clean && flutter build web --release`

Bon suivi de vos migraines TAHAR ! 🎯
