import 'package:isar/isar.dart';

part 'migraine_attack.g.dart';

@collection
class MigraineAttack {
  Id id = Isar.autoIncrement;

  // Temporalité
  late DateTime startTime;
  DateTime? endTime;

  // Caractéristiques de la douleur
  late int intensity; // 0-10
  late String location; // "Droite", "Gauche", "Bilatérale", "Frontale", etc.
  late String painType; // "Pulsatile", "Lancinante", "Pression", etc.
  late bool isUnilateral;

  // Symptômes associés
  List<String> symptoms = [];

  // Traitements
  List<String> medications = [];
  List<DateTime> medicationTimes = [];
  List<int> medicationDosages = [];
  List<String> medicationRoutes = [];

  // Traitement de secours
  bool needRescueMedication = false;
  String? rescueMedicationName;
  int? rescueMedicationDosage;
  DateTime? rescueMedicationTime;
  int? minutesBeforeRescue;

  // Efficacité
  int? intensityAfter2h;
  int? intensityAfter4h;
  int? overallEffectiveness; // 0-5

  // Effets secondaires
  List<String> sideEffects = [];

  // Notes
  String? notes;

  // Calculé
  int? get durationMinutes {
    if (endTime != null) {
      return endTime!.difference(startTime).inMinutes;
    }
    return null;
  }

  bool get isActive => endTime == null;
}

@collection
class DailyLog {
  Id id = Isar.autoIncrement;

  late DateTime date;

  // État général
  int? generalWellbeing; // 1-5 (1=très mal, 5=très bien)

  // Sommeil
  double? sleepHours;
  int? sleepQuality; // 1-5

  // Stress
  int? stressLevel; // 0-10

  // Activité physique
  String? physicalActivity; // "Aucune", "Légère", "Modérée", "Intense"
  int? activityDuration; // minutes

  // Hydratation
  int? waterGlasses; // nombre de verres

  // Facteurs alimentaires
  List<String> foodTriggers = [];
  bool skippedMeal = false;
  bool hadCaffeine = false;
  bool hadAlcohol = false;

  // Météo (automatique)
  double? temperature;
  double? pressure;
  double? humidity;

  // Migraine
  bool hadMigraine = false;
  int? migraineAttackId;

  // Notes
  String? notes;
}

@collection
class Medication {
  Id id = Isar.autoIncrement;

  late String name;
  late String type; // "Préventif", "Aigu", "Secours", "Symptomatique"
  String? dosage;
  String? unit; // "mg", "mL", "comprimés"
  String? route; // "Oral", "Injectable", "Nasal", "Sublingual"

  // Statistiques d'utilisation
  int timesUsed = 0;
  double? averageEffectiveness;

  // Prédéfini ou personnalisé
  bool isCustom = false;
}

@collection
class InjectionRecord {
  Id id = Isar.autoIncrement;

  late DateTime injectionDate;
  late String medicationName;
  int cycleNumber = 1;

  // Effets secondaires de l'injection
  List<String> sideEffects = [];
  int? sideEffectsSeverity; // 0-10

  // Notes
  String? notes;
}

@collection
class UserProfile {
  Id id = 1; // Singleton

  late String name;
  int? age;
  String? gender;

  // Traitement préventif
  bool hasPreventiveTreatment = false;
  String? preventiveMedicationName;
  DateTime? treatmentStartDate;
  int? injectionFrequencyDays; // 28 jours par défaut

  // Objectifs
  int targetAttacksPerMonth = 4;
  int targetMaxIntensity = 6;

  // Baseline (avant traitement)
  double? baselineAttacksPerMonth;
  double? baselineAvgIntensity;

  // Localisation
  String? city;
  String? country;

  // Préférences
  String language = 'fr';
  bool darkMode = true;
  bool enableNotifications = true;
  bool enableWeatherData = true;
}

// Énumérations pour les valeurs prédéfinies
class MigraineSymptomsEnum {
  static const List<String> neurologicalSymptoms = [
    'Aura visuelle',
    'Troubles visuels',
    'Fourmillements',
    'Difficultés d\'élocution',
    'Vertiges',
  ];

  static const List<String> digestiveSymptoms = [
    'Nausées',
    'Vomissements',
    'Perte d\'appétit',
  ];

  static const List<String> sensitivities = [
    'Photophobie (lumière)',
    'Phonophobie (bruit)',
    'Osmophobie (odeurs)',
  ];

  static const List<String> autonomicSymptoms = [
    'Larmoiement',
    'Congestion nasale',
    'Rougeur du visage',
    'Transpiration',
  ];

  static const List<String> premonitorySymptoms = [
    'Fatigue inhabituelle',
    'Bâillements excessifs',
    'Raideur de la nuque',
    'Changements d\'humeur',
    'Fringales',
  ];
}

class PainTypes {
  static const List<String> types = [
    'Pulsatile/Battements',
    'Lancinante',
    'Pression/Étau',
    'Brûlure',
    'Autre',
  ];
}

class PainLocations {
  static const List<String> locations = [
    'Droite (temporale)',
    'Gauche (temporale)',
    'Bilatérale',
    'Frontale',
    'Occipitale (arrière)',
    'Vertex (sommet)',
  ];
}

class ActivityLevels {
  static const List<String> levels = [
    'Aucune',
    'Légère',
    'Modérée',
    'Intense',
  ];
}

class FoodTriggers {
  static const List<String> triggers = [
    'Chocolat',
    'Fromage affiné',
    'Aliments fermentés',
    'Charcuterie',
    'Agrumes',
    'Noix',
    'Glutamate (MSG)',
    'Édulcorants artificiels',
  ];
}
