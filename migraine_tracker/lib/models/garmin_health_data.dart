import 'package:isar/isar.dart';

part 'garmin_health_data.g.dart';

/// Modèle pour stocker les données de santé Garmin synchronisées
/// 
/// Collecte les métriques clés de Garmin Connect :
/// - Sommeil : durée, qualité, phases
/// - Stress : niveau moyen et maximum
/// - Activité : pas, distance, calories
/// - Fréquence cardiaque : repos, min, max
@collection
class GarminHealthData {
  Id id = Isar.autoIncrement;

  /// Date des données (unique - une entrée par jour)
  @Index(unique: true)
  late DateTime date;

  // === SOMMEIL ===
  /// Score de sommeil Garmin (0-100)
  int? sleepScore;
  
  /// Durée totale de sommeil en minutes
  int? sleepDurationMinutes;
  
  /// Sommeil profond en minutes
  int? deepSleepMinutes;
  
  /// Sommeil léger en minutes
  int? lightSleepMinutes;
  
  /// Sommeil paradoxal (REM) en minutes
  int? remSleepMinutes;
  
  /// Nombre de réveils nocturnes
  int? awakenings;

  // === STRESS ===
  /// Niveau de stress moyen (0-100)
  int? averageStress;
  
  /// Niveau de stress maximum (0-100)
  int? maxStress;
  
  /// Minutes de repos (stress < 25)
  int? restMinutes;

  // === ACTIVITÉ ===
  /// Nombre de pas
  int? steps;
  
  /// Distance parcourue en mètres
  double? distanceMeters;
  
  /// Calories actives brûlées
  int? activeCalories;
  
  /// Minutes d'activité modérée
  int? moderateActivityMinutes;
  
  /// Minutes d'activité intense
  int? vigorousActivityMinutes;

  // === FRÉQUENCE CARDIAQUE ===
  /// Fréquence cardiaque au repos (bpm)
  int? restingHeartRate;
  
  /// FC minimale de la journée (bpm)
  int? minHeartRate;
  
  /// FC maximale de la journée (bpm)
  int? maxHeartRate;
  
  /// FC moyenne (bpm)
  int? averageHeartRate;

  // === BODY BATTERY (ÉNERGIE) ===
  /// Niveau d'énergie moyen (0-100)
  int? bodyBatteryAverage;
  
  /// Niveau d'énergie minimum (0-100)
  int? bodyBatteryMin;
  
  /// Niveau d'énergie maximum (0-100)
  int? bodyBatteryMax;

  // === MÉTADONNÉES ===
  /// Date de dernière synchronisation
  DateTime? lastSync;
  
  /// Source de données (garmin, manual)
  String source = 'garmin';
  
  /// Données brutes JSON (pour debug)
  String? rawData;

  /// Constructeur
  GarminHealthData({
    this.sleepScore,
    this.sleepDurationMinutes,
    this.averageStress,
    this.steps,
    this.restingHeartRate,
  });

  /// Calculer la qualité générale de la journée (0-100)
  /// Basé sur sommeil, stress et activité
  int get overallDayQuality {
    int score = 0;
    int factors = 0;

    // Sommeil (40% du score)
    if (sleepScore != null) {
      score += sleepScore!;
      factors++;
    }

    // Stress inversé (30% du score)
    if (averageStress != null) {
      score += (100 - averageStress!);
      factors++;
    }

    // Activité (30% du score) - basé sur les pas
    if (steps != null) {
      int activityScore = (steps! / 100).clamp(0, 100).toInt();
      score += activityScore;
      factors++;
    }

    return factors > 0 ? (score / factors).round() : 0;
  }

  /// Vérifier si la journée était à risque de migraine
  /// Critères : mauvais sommeil + stress élevé + faible activité
  bool get isHighRiskDay {
    bool poorSleep = sleepScore != null && sleepScore! < 70;
    bool highStress = averageStress != null && averageStress! > 60;
    bool lowActivity = steps != null && steps! < 3000;

    // Au moins 2 facteurs de risque
    int riskFactors = [poorSleep, highStress, lowActivity]
        .where((factor) => factor)
        .length;

    return riskFactors >= 2;
  }

  /// Formater la durée de sommeil
  String get formattedSleepDuration {
    if (sleepDurationMinutes == null) return '-';
    int hours = sleepDurationMinutes! ~/ 60;
    int minutes = sleepDurationMinutes! % 60;
    return '${hours}h${minutes.toString().padLeft(2, '0')}';
  }

  /// Formater la distance
  String get formattedDistance {
    if (distanceMeters == null) return '-';
    double km = distanceMeters! / 1000;
    return '${km.toStringAsFixed(2)} km';
  }
}
