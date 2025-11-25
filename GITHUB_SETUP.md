# Guide de Publication sur GitHub

Ce document vous guide pour publier le projet Migraine Tracker sur votre compte GitHub.

## Étape 1 : Créer le Repository sur GitHub

1. Allez sur https://github.com/Proftg
2. Cliquez sur le bouton vert "New" ou "New repository"
3. Remplissez les informations :
   - **Repository name** : `migraine-tracker`
   - **Description** : `🧠 Application web intelligente pour le suivi et l'analyse des migraines`
   - **Visibility** : Public (ou Private selon votre préférence)
   - **NE COCHEZ PAS** "Initialize this repository with a README" (nous en avons déjà un)
4. Cliquez sur "Create repository"

## Étape 2 : Configurer Git (si ce n'est pas déjà fait)

Ouvrez un terminal WSL dans le dossier du projet et exécutez :

```bash
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"
```

## Étape 3 : Publier le Projet

Exécutez les commandes suivantes dans le terminal WSL :

```bash
# 1. Ajouter tous les fichiers
git add .

# 2. Créer le premier commit
git commit -m "🎉 Initial commit - Migraine Tracker AI"

# 3. Renommer la branche principale en 'main'
git branch -M main

# 4. Ajouter le repository distant (REMPLACEZ 'Proftg' par votre nom d'utilisateur si différent)
git remote add origin https://github.com/Proftg/migraine-tracker.git

# 5. Pousser le code sur GitHub
git push -u origin main
```

## Étape 4 : Vérification

1. Retournez sur https://github.com/Proftg/migraine-tracker
2. Actualisez la page
3. Vous devriez voir tous vos fichiers, y compris le README.md qui s'affiche automatiquement

## Étape 5 : Ajouter des Screenshots (Optionnel mais Recommandé)

Pour rendre votre README plus attractif :

1. Créez un dossier `docs/screenshots/` dans votre projet
2. Prenez des captures d'écran de l'application
3. Ajoutez-les au dossier
4. Modifiez le README.md pour inclure les images :
   ```markdown
   ## 🎨 Captures d'Écran
   
   ![Dashboard](docs/screenshots/dashboard.png)
   ![Crisis Mode](docs/screenshots/crisis-mode.png)
   ![Medical Report](docs/screenshots/medical-report.png)
   ```
5. Committez et poussez les changements :
   ```bash
   git add .
   git commit -m "📸 Add screenshots"
   git push
   ```

## Commandes Git Utiles

### Pour les mises à jour futures :
```bash
# Voir les fichiers modifiés
git status

# Ajouter les modifications
git add .

# Créer un commit
git commit -m "Description des changements"

# Pousser sur GitHub
git push
```

### En cas de problème :
```bash
# Voir l'historique des commits
git log --oneline

# Annuler les modifications non commitées
git checkout -- .

# Voir les différences
git diff
```

## Conseils

- ✅ Utilisez des messages de commit clairs et descriptifs
- ✅ Committez régulièrement (petits commits fréquents)
- ✅ Ajoutez des emojis dans vos commits pour plus de clarté :
  - 🎉 `:tada:` - Initial commit
  - ✨ `:sparkles:` - Nouvelle fonctionnalité
  - 🐛 `:bug:` - Correction de bug
  - 📝 `:memo:` - Documentation
  - 🎨 `:art:` - Amélioration UI/UX
  - ⚡ `:zap:` - Performance
  - 🔧 `:wrench:` - Configuration

## Problèmes Courants

### "Permission denied (publickey)"
Vous devez configurer une clé SSH ou utiliser HTTPS avec un token d'accès personnel.

### "Repository not found"
Vérifiez que vous avez bien créé le repository sur GitHub et que l'URL est correcte.

### Conflits lors du push
Si le repository distant a des changements, faites d'abord :
```bash
git pull origin main --rebase
git push
```

---

Bon courage ! 🚀
