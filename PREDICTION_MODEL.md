# 🧠 Modèle de Prédiction de Migraine - Documentation

## 📊 Vue d'ensemble

Le modèle de prédiction utilise un réseau de neurones (TensorFlow.js) pour prédire la probabilité d'une migraine le lendemain en analysant **11 features** différentes.

## 🎯 Features utilisées (11 au total)

### 1-4: Données de base
1. **Jours depuis la dernière migraine** (0-30 jours normalisé)
2. **Pression atmosphérique** (950-1050 hPa normalisé)
3. **Température** (-10°C à 40°C normalisé)
4. **Migraine hier** (0 ou 1)

### 5-7: Données Garmin (si disponibles)
5. **Heures de sommeil** (0-12h normalisé)
6. **Qualité du sommeil** (score 0-100 normalisé)
7. **Niveau de stress** (0-100 normalisé)

### 8-10: Données de temps d'écran (nouvelles !)
8. **Durée du temps d'écran** (0-16h normalisé)
9. **Pauses régulières** (0 = non, 1 = oui)
10. **Filtre lumière bleue** (0 = non, 1 = oui)

### 11: Données nutritionnelles (nouvelles !)
11. **Calories journalières** (0-3000 kcal normalisé)

## 🔄 Gestion des données manquantes

Le modèle est conçu pour fonctionner **même si certaines données manquent** :

- **Données Garmin manquantes** : Utilise des valeurs neutres (sommeil moyen, stress moyen)
- **Temps d'écran non enregistré** : Considéré comme 0 (pas d'impact)
- **Calories non enregistrées** : Considéré comme 0 (pas d'impact)
- **Météo non disponible** : Utilise des valeurs moyennes

### ✅ Avantages de cette approche :
- Le modèle fonctionne toujours, même avec peu de données
- Plus vous enregistrez de données, plus les prédictions sont précises
- Les nouvelles données (temps d'écran, calories) améliorent progressivement le modèle

## 📈 Architecture du modèle

```
Input Layer: 11 features
    ↓
Dense Layer: 12 neurons (ReLU)
    ↓
Dropout: 30% (prévention overfitting)
    ↓
Dense Layer: 6 neurons (ReLU)
    ↓
Dropout: 20%
    ↓
Output Layer: 1 neuron (Sigmoid)
    ↓
Probabilité: 0-95% (limité pour éviter fausses certitudes)
```

## 🎓 Entraînement

- **Epochs**: 50 (réduit pour éviter l'overfitting)
- **Batch size**: 4
- **Validation split**: 10%
- **Learning rate**: 0.003
- **Minimum de données**: 5 entrées dans le journal

## 🔍 Facteurs contributifs identifiés

Le modèle identifie automatiquement les facteurs de risque :

### Facteurs de base
- Cycle long détecté (>14 jours sans migraine)
- Basse pression atmosphérique
- Suite de crise (migraine hier)

### Facteurs Garmin
- Sommeil insuffisant (<6h)
- Mauvaise qualité de sommeil (<60/100)
- Stress élevé (>60/100)

### Facteurs temps d'écran (nouveaux !)
- Temps d'écran élevé (>8h)
- Pas de pauses régulières (>4h sans pause)
- Pas de filtre lumière bleue (>6h sans filtre)

### Facteurs nutritionnels (nouveaux !)
- Apport calorique faible (<1200 kcal)
- Apport calorique élevé (>2500 kcal)

## 💡 Recommandations d'utilisation

### Pour de meilleures prédictions :

1. **Enregistrez régulièrement vos migraines** avec tous les détails
2. **Activez la synchronisation Garmin** (si vous avez une montre)
3. **Enregistrez votre temps d'écran quotidien** via le bouton 💻
4. **Notez vos calories journalières** via le bouton 📊
5. **Laissez le modèle s'entraîner** : Plus vous avez de données historiques, meilleures sont les prédictions

### Données minimales requises :
- ✅ Au moins 5 entrées dans le journal
- ✅ Au moins 1 migraine enregistrée
- ⭐ Idéalement : 20+ entrées pour une bonne confiance

## 🔧 Améliorations continues

Le modèle s'améliore automatiquement à chaque nouvelle donnée :
- Il se réentraîne à chaque chargement de la page
- Il apprend les patterns spécifiques à votre profil
- Il s'adapte aux nouvelles données (temps d'écran, calories)

## ⚠️ Limitations

- Les prédictions sont **probabilistes**, pas certaines
- La probabilité est limitée à 95% max pour éviter les fausses certitudes
- Le modèle nécessite des données de qualité pour être fiable
- Les corrélations ne sont pas des causalités

## 📝 Notes techniques

- **Framework**: TensorFlow.js
- **Type**: Réseau de neurones séquentiel
- **Fonction d'activation**: ReLU (couches cachées), Sigmoid (sortie)
- **Loss function**: Binary Crossentropy
- **Optimizer**: Adam
- **Normalisation**: Toutes les features sont normalisées entre 0 et 1
