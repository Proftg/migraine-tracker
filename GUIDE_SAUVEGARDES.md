# Guide d'utilisation des sauvegardes

## 📁 Dossier de sauvegarde

Les sauvegardes sont stockées dans :
```
\\wsl.localhost\Ubuntu\home\tahar\project\Maven\migraine-tracker\sauvegardes\
```

## 💾 Comment sauvegarder vos données

### Méthode automatique (recommandée)

1. Dans l'application, cliquez sur le bouton **"💾 Sauvegarder"**
2. Le fichier sera téléchargé dans `C:\Users\tahar\Downloads\`
3. Double-cliquez sur `Copier_Sauvegardes.bat` dans le dossier du projet
4. Le script copiera automatiquement tous les fichiers de sauvegarde dans le dossier `sauvegardes/`

### Méthode manuelle

1. Cliquez sur **"💾 Sauvegarder"** dans l'application
2. Le fichier est téléchargé dans vos Téléchargements
3. Coupez/collez manuellement le fichier dans :
   ```
   \\wsl.localhost\Ubuntu\home\tahar\project\Maven\migraine-tracker\sauvegardes\
   ```

## 📂 Restaurer vos données

1. Cliquez sur **"📂 Restaurer"** dans l'application
2. Sélectionnez un fichier `.json` depuis n'importe quel emplacement
3. Vos données seront fusionnées avec les données existantes

## 🔄 Sauvegarde régulière recommandée

- **Quotidienne** : Si vous utilisez l'app tous les jours
- **Hebdomadaire** : Pour un usage occasionnel
- **Avant mise à jour** : Toujours sauvegarder avant de mettre à jour l'application

## 📝 Format des fichiers

Les fichiers de sauvegarde sont nommés :
```
migraine-backup-YYYY-MM-DD.json
```

Exemple : `migraine-backup-2024-11-25.json`
