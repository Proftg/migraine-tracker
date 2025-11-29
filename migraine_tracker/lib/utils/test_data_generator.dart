import 'package:flutter/material.dart';
import 'dart:math';
import '../models/migraine_attack.dart';
import '../services/database_service.dart';

/// Script de génération de données de test pour l'application
/// 
/// Pour l'utiliser:
/// 1. Importer ce fichier dans main.dart
/// 2. Appeler `await generateTestData()` après l'initialisation de la DB
/// 3. Commenter ou supprimer l'appel après le premier lancement
class TestDataGenerator {
  static final DatabaseService _db = DatabaseService();
  static final Random _random = Random();

  /// Génère des données de test pour les 3 derniers mois
  static Future<void> generateTestData() async {
    print('🔄 Génération des données de test...');

    await _generateMigraineAttacks();
    await _generateDailyLogs();
    await _generateInjectionRecords();

    print('✅ Données de test générées avec succès!');
  }

  /// Génère des crises de migraine réalistes
  static Future<void> _generateMigraineAttacks() async {
    final now = DateTime.now();
    
    // Générer pour les 3 derniers mois
    for (int monthOffset = 2; monthOffset >= 0; monthOffset--) {
      final month = DateTime(now.year, now.month - monthOffset);
      
      // Nombre décroissant de crises (simulation du traitement)
      // Mois 1: 14 crises (baseline)
      // Mois 2: 12 crises (-14%)
      // Mois 3: 8 crises (-43% vs baseline)
      int attackCount;
      if (monthOffset == 2) {
        attackCount = 14; // Juin (avant traitement)
      } else if (monthOffset == 1) {
        attackCount = 12; // Octobre
      } else {
        attackCount = 8; // Novembre (mois actuel)
      }

      for (int i = 0; i < attackCount; i++) {
        // Date aléatoire dans le mois
        final day = _random.nextInt(28) + 1;
        final hour = _random.nextInt(16) + 6; // Entre 6h et 22h
        final minute = _random.nextInt(60);
        
        final startTime = DateTime(
          month.year,
          month.month,
          day,
          hour,
          minute,
        );

        // Intensité: tendance à diminuer avec le temps
        int intensity;
        if (monthOffset == 2) {
          intensity = _random.nextInt(3) + 7; // 7-9
        } else if (monthOffset == 1) {
          intensity = _random.nextInt(3) + 6; // 6-8
        } else {
          intensity = _random.nextInt(4) + 5; // 5-8
        }

        // Durée: 2-8 heures
        final durationHours = _random.nextInt(7) + 2;
        final endTime = startTime.add(Duration(hours: durationHours));

        // Localisation
        final locations = PainLocations.locations;
        final location = locations[_random.nextInt(locations.length)];

        // Type de douleur
        final painTypes = PainTypes.types;
        final painType = painTypes[_random.nextInt(painTypes.length)];

        // Symptômes (2-5 symptômes aléatoires)
        final allSymptoms = [
          ...MigraineSymptomsEnum.neurologicalSymptoms,
          ...MigraineSymptomsEnum.digestiveSymptoms,
          ...MigraineSymptomsEnum.sensitivities,
        ];
        final numSymptoms = _random.nextInt(4) + 2;
        final symptoms = <String>[];
        for (int j = 0; j < numSymptoms; j++) {
          final symptom = allSymptoms[_random.nextInt(allSymptoms.length)];
          if (!symptoms.contains(symptom)) {
            symptoms.add(symptom);
          }
        }

        // Médicaments
        final medications = ['Sumatriptan', 'Ibuprofène', 'Paracétamol'];
        final medication = medications[_random.nextInt(medications.length)];
        final medicationTime = startTime.add(Duration(
          minutes: _random.nextInt(60) + 15, // 15-75 min après début
        ));

        // Traitement de secours (25% des cas)
        final needRescue = _random.nextDouble() < 0.25;

        // Efficacité (meilleure avec le temps)
        int effectiveness;
        if (monthOffset == 2) {
          effectiveness = _random.nextInt(2) + 2; // 2-3
        } else if (monthOffset == 1) {
          effectiveness = _random.nextInt(2) + 3; // 3-4
        } else {
          effectiveness = _random.nextInt(2) + 4; // 4-5
        }

        // Créer l'attaque
        final attack = MigraineAttack()
          ..startTime = startTime
          ..endTime = endTime
          ..intensity = intensity
          ..location = location
          ..painType = painType
          ..isUnilateral = _random.nextBool()
          ..symptoms = symptoms
          ..medications = [medication]
          ..medicationTimes = [medicationTime]
          ..medicationDosages = [100]
          ..medicationRoutes = ['Oral']
          ..needRescueMedication = needRescue
          ..rescueMedicationName = needRescue ? 'Ibuprofène' : null
          ..rescueMedicationDosage = needRescue ? 400 : null
          ..intensityAfter2h = intensity - _random.nextInt(4) - 2
          ..overallEffectiveness = effectiveness;

        await _db.addMigraineAttack(attack);
      }

      print('✅ ${attackCount} crises générées pour ${month.month}/${month.year}');
    }
  }

  /// Génère des logs quotidiens
  static Future<void> _generateDailyLogs() async {
    final now = DateTime.now();
    
    // Générer pour les 30 derniers jours
    for (int i = 0; i < 30; i++) {
      final date = now.subtract(Duration(days: i));
      
      final log = DailyLog()
        ..date = DateTime(date.year, date.month, date.day)
        ..generalWellbeing = _random.nextInt(5) + 1 // 1-5
        ..sleepHours = (_random.nextInt(5) + 5).toDouble() // 5-9h
        ..sleepQuality = _random.nextInt(5) + 1 // 1-5
        ..stressLevel = _random.nextInt(11) // 0-10
        ..physicalActivity = ActivityLevels.levels[_random.nextInt(4)]
        ..activityDuration = _random.nextInt(60) + 20 // 20-80 min
        ..waterGlasses = _random.nextInt(5) + 4 // 4-8 verres
        ..hadCaffeine = _random.nextDouble() < 0.7 // 70% du temps
        ..hadAlcohol = _random.nextDouble() < 0.2 // 20% du temps
        ..skippedMeal = _random.nextDouble() < 0.15 // 15% du temps
        ..temperature = 10 + _random.nextDouble() * 10 // 10-20°C
        ..pressure = 1010 + _random.nextDouble() * 20 // 1010-1030 hPa
        ..humidity = 50 + _random.nextDouble() * 30; // 50-80%

      // Ajouter des déclencheurs alimentaires aléatoires
      if (_random.nextDouble() < 0.3) {
        final triggers = FoodTriggers.triggers;
        log.foodTriggers = [
          triggers[_random.nextInt(triggers.length)]
        ];
      }

      await _db.addDailyLog(log);
    }

    print('✅ 30 jours de logs quotidiens générés');
  }

  /// Génère des enregistrements d'injections
  static Future<void> _generateInjectionRecords() async {
    final now = DateTime.now();
    
    // 3 injections (une par mois)
    for (int i = 1; i <= 3; i++) {
      final injectionDate = DateTime(
        now.year,
        now.month - (3 - i),
        1,
      );

      final injection = InjectionRecord()
        ..injectionDate = injectionDate
        ..medicationName = 'Anti-CGRP (Erenumab)'
        ..cycleNumber = i
        ..sideEffects = _random.nextDouble() < 0.3
            ? ['Douleur au site d\'injection']
            : []
        ..sideEffectsSeverity = _random.nextInt(3) + 1; // 1-3

      await _db.addInjectionRecord(injection);
    }

    print('✅ 3 injections préventives générées');
  }

  /// Nettoie toutes les données de test
  static Future<void> clearTestData() async {
    print('🗑️ Suppression des données de test...');
    await _db.clearAllData();
    print('✅ Données supprimées');
  }
}

/// Fonction helper pour appeler depuis main.dart
Future<void> generateTestData() async {
  await TestDataGenerator.generateTestData();
}

Future<void> clearTestData() async {
  await TestDataGenerator.clearTestData();
}
