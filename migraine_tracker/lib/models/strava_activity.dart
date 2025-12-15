import 'package:isar/isar.dart';

part 'strava_activity.g.dart';

/// Modèle pour stocker les activités Strava synchronisées
/// 
/// Enregistre toutes les activités sportives :
/// - Course, vélo, natation, triathlon, etc.
/// - Métriques de performance
/// - Intensité et effort perçu
@collection
class StravaActivity {
  Id id = Isar.autoIncrement;

  /// ID Strava original
  @Index(unique: true)
  late int stravaId;

  /// Date et heure de début de l'activité
  @Index()
  late DateTime startDate;

  /// Type d'activité (Run, Ride, Swim, etc.)
  late String activityType;

  /// Nom de l'activité
  late String name;

  // === MÉTRIQUES DE BASE ===
  /// Durée en secondes
  late int durationSeconds;
  
  /// Distance en mètres
  late double distanceMeters;
  
  /// Dénivelé positif en mètres
  double? elevationGain;

  // === PERFORMANCE ===
  /// Vitesse moyenne (m/s)
  double? averageSpeed;
  
  /// Vitesse maximale (m/s)
  double? maxSpeed;
  
  /// Allure moyenne (min/km pour course, km/h pour vélo)
  String? averagePace;
  
  /// Calories brûlées
  int? calories;

  // === FRÉQUENCE CARDIAQUE ===
  /// FC moyenne (bpm)
  int? averageHeartRate;
  
  /// FC maximale (bpm)
  int? maxHeartRate;

  // === EFFORT ===
  /// Effort perçu (RPE 1-10)
  int? perceivedExertion;
  
  /// Score de souffrance Strava (0-10)
  double? sufferScore;
  
  /// Charge d'entraînement relative
  int? relativeEffort;

  // === CONTEXTE ===
  /// Description/notes de l'activité
  String? description;
  
  /// A été réalisée sur un appareil Garmin
  bool fromGarmin = false;
  
  /// Type d'entraînement (workout, race, long run, etc.)
  String? workoutType;

  // === MÉTÉO (si disponible) ===
  /// Température en °C
  double? temperature;
  
  /// Conditions météo
  String? weatherCondition;

  // === MÉTADONNÉES ===
  /// Date de synchronisation
  DateTime? lastSync;
  
  /// Données brutes JSON
  String? rawData;

  /// Constructeur
  StravaActivity({
    required this.stravaId,
    required this.startDate,
    required this.activityType,
    required this.name,
    required this.durationSeconds,
    required this.distanceMeters,
  });

  /// Formater la durée (HH:MM:SS)
  String get formattedDuration {
    int hours = durationSeconds ~/ 3600;
    int minutes = (durationSeconds % 3600) ~/ 60;
    int seconds = durationSeconds % 60;
    
    if (hours > 0) {
      return '${hours}h${minutes.toString().padLeft(2, '0')}m${seconds.toString().padLeft(2, '0')}s';
    }
    return '${minutes}m${seconds.toString().padLeft(2, '0')}s';
  }

  /// Formater la distance
  String get formattedDistance {
    double km = distanceMeters / 1000;
    return '${km.toStringAsFixed(2)} km';
  }

  /// Calculer la vitesse moyenne en km/h
  double get averageSpeedKmh {
    if (averageSpeed == null) return 0;
    return (averageSpeed! * 3.6);
  }

  /// Calculer l'allure moyenne (min/km pour course)
  String get pacePerKm {
    if (distanceMeters == 0) return '-';
    double kmDistance = distanceMeters / 1000;
    double minutesPerKm = (durationSeconds / 60) / kmDistance;
    int minutes = minutesPerKm.floor();
    int seconds = ((minutesPerKm - minutes) * 60).round();
    return '${minutes}:${seconds.toString().padLeft(2, '0')} /km';
  }

  /// Déterminer l'intensité de l'activité (Low, Moderate, High, Very High)
  String get intensityLevel {
    if (perceivedExertion != null) {
      if (perceivedExertion! <= 3) return 'Faible';
      if (perceivedExertion! <= 5) return 'Modérée';
      if (perceivedExertion! <= 7) return 'Élevée';
      return 'Très élevée';
    }
    
    // Fallback sur la FC si disponible
    if (averageHeartRate != null) {
      if (averageHeartRate! < 130) return 'Faible';
      if (averageHeartRate! < 150) return 'Modérée';
      if (averageHeartRate! < 170) return 'Élevée';
      return 'Très élevée';
    }
    
    return 'Inconnue';
  }

  /// Icône selon le type d'activité
  String get activityIcon {
    switch (activityType.toLowerCase()) {
      case 'run':
        return '🏃';
      case 'ride':
        return '🚴';
      case 'swim':
        return '🏊';
      case 'walk':
        return '🚶';
      case 'hike':
        return '🥾';
      case 'yoga':
        return '🧘';
      case 'workout':
        return '💪';
      default:
        return '⚡';
    }
  }

  /// Vérifier si l'activité était potentiellement déclencheur de migraine
  /// Critères : haute intensité + longue durée + chaleur
  bool get isPotentialTrigger {
    bool highIntensity = perceivedExertion != null && perceivedExertion! >= 8;
    bool longDuration = durationSeconds > 7200; // > 2h
    bool hotWeather = temperature != null && temperature! > 28;

    // Au moins 2 facteurs de risque
    int riskFactors = [highIntensity, longDuration, hotWeather]
        .where((factor) => factor)
        .length;

    return riskFactors >= 2;
  }
}
