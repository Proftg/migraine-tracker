# 🚀 Migration vers Supabase - Guide Complet

## ✅ Ce qui a été fait

### 1. Installation
- ✅ Package `@supabase/supabase-js` installé
- ✅ Fichier `.env.local` créé avec vos clés Supabase
- ✅ Table `journal_entries` créée dans Supabase

### 2. Fichiers créés/modifiés
- ✅ `src/lib/supabase.ts` - Client Supabase et fonctions de base de données
- ✅ `src/lib/storage.ts` - Service de stockage mis à jour (async)
- ✅ `supabase-schema.sql` - Schéma de la base de données

## 🔄 Prochaines étapes

### Étape 4 : Mettre à jour page.tsx
Le fichier `src/app/page.tsx` doit être modifié pour utiliser les fonctions asynchrones.

**Changements principaux :**
- Toutes les fonctions `storage.*` sont maintenant `async`
- Utiliser `await` pour toutes les opérations de stockage
- Ajouter `useEffect` pour charger les données au démarrage

### Étape 5 : Migration des données
Une fois l'application mise à jour, vos données localStorage seront automatiquement migrées vers Supabase au premier chargement.

## 🎯 Avantages de Supabase

✅ **Synchronisation cloud** - Vos données sont sauvegardées en ligne
✅ **Multi-appareils** - Accédez depuis n'importe où
✅ **Sauvegarde automatique** - Plus de risque de perte
✅ **Fallback localStorage** - Si Supabase ne fonctionne pas, l'app utilise localStorage

## ⚙️ Configuration

### Variables d'environnement (.env.local)
```
NEXT_PUBLIC_SUPABASE_URL=https://havwpuuxnskrluulpaqk.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

### Activer/Désactiver Supabase
Dans `src/lib/storage.ts`, ligne 5 :
```typescript
const USE_SUPABASE = true; // Set to false to use localStorage only
```

## 🔒 Sécurité

- ✅ Row Level Security (RLS) activé
- ✅ Politique d'accès anonyme (pour le moment)
- ⚠️ **Note** : Pour une vraie application multi-utilisateurs, vous devriez ajouter l'authentification

## 📊 Structure de la base de données

Table : `journal_entries`
- Stocke toutes les entrées (migraines, activités, calories, etc.)
- Index sur `date` et `type` pour des requêtes rapides
- Support JSONB pour les données complexes (medicationAttempts, mealBreakdown)

## 🐛 Dépannage

### L'app ne se connecte pas à Supabase
1. Vérifiez que `.env.local` existe et contient les bonnes clés
2. Redémarrez le serveur Next.js (`npm run dev`)
3. Vérifiez la console du navigateur pour les erreurs

### Les données ne s'affichent pas
1. Ouvrez la console du navigateur (F12)
2. Regardez les erreurs réseau
3. Vérifiez que la table existe dans Supabase (SQL Editor → Tables)

### Revenir à localStorage
Changez `USE_SUPABASE = false` dans `src/lib/storage.ts`

## 📝 Prochaine étape

Je vais maintenant mettre à jour `page.tsx` pour utiliser les fonctions asynchrones.
Cela prendra quelques minutes car c'est un changement important.

**Êtes-vous prêt à continuer ?**
