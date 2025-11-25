# 🧠 Migraine Tracker AI

Une application web moderne et intelligente pour le suivi et l'analyse des migraines, développée avec Next.js et TypeScript.

![Next.js](https://img.shields.io/badge/Next.js-14.2.3-black?style=flat-square&logo=next.js)
![TypeScript](https://img.shields.io/badge/TypeScript-5-blue?style=flat-square&logo=typescript)
![React](https://img.shields.io/badge/React-18-61DAFB?style=flat-square&logo=react)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.4-38B2AC?style=flat-square&logo=tailwind-css)

## ✨ Fonctionnalités

### 📊 Suivi Détaillé des Crises
- **Enregistrement complet** : Intensité, localisation, symptômes, durée
- **Calcul automatique** : Durée calculée automatiquement à partir des heures de début et fin
- **Gestion des crises nocturnes** : Support des crises qui traversent minuit
- **Médicaments multiples** : Enregistrez plusieurs prises de médicaments par crise avec leur efficacité

### 🏃 Suivi d'Activité Sportive
- **Types d'activités** : Course, Vélo, Natation, Musculation
- **Détails précis** : Heure exacte, durée, intensité
- **Calories brûlées** : Suivi optionnel des calories dépensées

### 🍽️ Suivi Calorique
- **Rappel quotidien** : Widget intelligent pour ne jamais oublier
- **Saisie flexible** : Total journalier ou détail par repas
- **Analyse de corrélation** : Découvrez les liens entre alimentation et migraines

### 📈 Analyses et Rapports Médicaux
- **Tableaux de bord interactifs** : Visualisations avec Recharts
- **Analyse avant/après traitement** : Évaluez l'efficacité d'Aimovig ou autres traitements préventifs
- **Corrélations multiples** :
  - Temps d'écran et migraines
  - Activité sportive et déclencheurs
  - Apport/dépense calorique et risque de crise
  - Efficacité des médicaments
- **Export professionnel** : PDF et Excel pour vos consultations médicales

### 🎯 Interface Utilisateur
- **Actions rapides** : Deux boutons principaux pour un accès instantané
- **Mode crise** : Workflow guidé étape par étape
- **Design moderne** : Interface claire et intuitive avec Shadcn/UI
- **Responsive** : Fonctionne sur tous les appareils

## 🚀 Installation

### Prérequis
- Node.js 18+ et npm
- WSL2 (pour Windows) ou environnement Linux/macOS

### Installation Standard

```bash
# Cloner le repository
git clone https://github.com/Proftg/migraine-tracker.git
cd migraine-tracker

# Installer les dépendances
npm install

# Lancer le serveur de développement
npm run dev
```

L'application sera accessible sur [http://localhost:3000](http://localhost:3000)

### Installation Windows avec Lanceur

Pour une expérience optimale sous Windows avec WSL :

1. Suivez les étapes d'installation standard ci-dessus
2. Créez un raccourci du fichier `Lancer_Migraine_Tracker.bat` sur votre bureau
3. Double-cliquez sur le raccourci pour lancer l'application automatiquement

Le lanceur :
- ✅ Vérifie WSL automatiquement
- ✅ Démarre le serveur de développement
- ✅ Ouvre votre navigateur sur l'application

## 📦 Technologies Utilisées

### Frontend
- **Next.js 14** - Framework React avec App Router
- **TypeScript** - Typage statique pour plus de robustesse
- **TailwindCSS** - Styling utilitaire moderne
- **Shadcn/UI** - Composants UI accessibles et personnalisables

### Visualisation & Export
- **Recharts** - Graphiques interactifs et responsives
- **jsPDF** - Génération de rapports PDF
- **xlsx** - Export Excel pour analyses externes

### Utilitaires
- **date-fns** - Manipulation de dates
- **Lucide React** - Icônes modernes
- **clsx & tailwind-merge** - Gestion des classes CSS

## 🗂️ Structure du Projet

```
migraine-tracker/
├── src/
│   ├── app/                    # Pages Next.js (App Router)
│   │   └── page.tsx           # Dashboard principal
│   ├── components/
│   │   ├── charts/            # Composants de visualisation
│   │   │   ├── BeforeAfterChart.tsx
│   │   │   ├── CalorieCorrelationChart.tsx
│   │   │   ├── FrequencyTrendChart.tsx
│   │   │   └── ...
│   │   ├── migraine/          # Composants métier
│   │   │   ├── CrisisMode.tsx
│   │   │   ├── DailyCalorieReminder.tsx
│   │   │   ├── MedicalReport.tsx
│   │   │   ├── SportsQuickEntry.tsx
│   │   │   └── ...
│   │   └── ui/                # Composants UI de base (Shadcn)
│   ├── lib/
│   │   ├── analytics.ts       # Moteur d'analyse des données
│   │   ├── storage.ts         # Gestion du localStorage
│   │   └── exportService.ts   # Export PDF/Excel
│   └── types/
│       └── index.ts           # Définitions TypeScript
├── public/                     # Assets statiques
├── Lancer_Migraine_Tracker.bat # Lanceur Windows
└── package.json
```

## 💾 Stockage des Données

Les données sont stockées localement dans le navigateur via `localStorage`, garantissant :
- ✅ **Confidentialité totale** : Vos données restent sur votre appareil
- ✅ **Pas de serveur requis** : Fonctionne entièrement hors ligne
- ✅ **Accès instantané** : Pas de latence réseau

> ⚠️ **Important** : Pensez à exporter régulièrement vos données en PDF ou Excel pour éviter toute perte.

## 🎨 Captures d'Écran

<!-- TODO: Ajouter des captures d'écran -->

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :
1. Fork le projet
2. Créer une branche pour votre fonctionnalité (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📝 License

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 👤 Auteur

**Tahar** - [@Proftg](https://github.com/Proftg)

## 🙏 Remerciements

- [Shadcn/UI](https://ui.shadcn.com/) pour les composants UI
- [Recharts](https://recharts.org/) pour les graphiques
- [Lucide](https://lucide.dev/) pour les icônes
- La communauté Next.js pour l'excellent framework

## 📧 Support

Pour toute question ou suggestion, n'hésitez pas à ouvrir une issue sur GitHub.

---

<div align="center">
Fait avec ❤️ pour aider à mieux comprendre et gérer les migraines
</div>
