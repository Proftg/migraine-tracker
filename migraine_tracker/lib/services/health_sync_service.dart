import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import '../models/garmin_health_data.dart';
import '../models/strava_activity.dart';

/// Service de synchronisation des données Garmin et Strava
/// 
/// Architecture:
/// 1. Appel API vers endpoints dédiés
/// 2. Parsing des données JSON
/// 3. Stockage local dans Isar
/// 4. Gestion cache et conflits
class HealthSyncService {
  final Isar isar;
  
  // URLs des endpoints (à configurer selon votre backend)
  static const String _garminApiUrl = 'http://localhost:3000/api/garmin';
  static const String _stravaApiUrl = 'http://localhost:3000/api/strava';

  HealthSyncService(this.isar);

  // ============================================
  // SYNCHRONISATION GARMIN
  // ============================================

  /// Synchroniser les données Garmin pour une période
  /// 
  /// [startDate]: Date de début
  /// [endDate]: Date de fin (par défaut aujourd'hui)
  /// [force]: Forcer la re-synchronisation même si données existantes
  Future<SyncResult> syncGarminData({
    required DateTime startDate,
    DateTime? endDate,
    bool force = false,
  }) async {
    try {
      endDate ??= DateTime.now();
      
      print('🔄 Synchronisation Garmin: $startDate -> $endDate');
      
      // Appel API
      final response = await http.get(
        Uri.parse('$_garminApiUrl/sync')
            .replace(queryParameters: {
          'start_date': startDate.toIso8601String(),
          'end_date': endDate.toIso8601String(),
          'force': force.toString(),
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> healthData = data['data'] ?? [];

        int imported = 0;
        int updated = 0;
        int skipped = 0;

        for (var dayData in healthData) {
          final result = await _importGarminDay(dayData, force);
          
          switch (result) {
            case ImportResult.imported:
              imported++;
              break;
            case ImportResult.updated:
              updated++;
              break;
            case ImportResult.skipped:
              skipped++;
              break;
          }
        }

        print('✅ Sync Garmin terminé: $imported importés, $updated mis à jour, $skipped ignorés');
        
        return SyncResult(
          success: true,
          imported: imported,
          updated: updated,
          skipped: skipped,
        );
        
      } else {
        throw Exception('Erreur API Garmin: ${response.statusCode}');
      }
      
    } catch (e) {
      print('❌ Erreur sync Garmin: $e');
      return SyncResult(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Importer les données d'une journée Garmin
  Future<ImportResult> _importGarminDay(Map<String, dynamic> data, bool force) async {
    try {
      final dateStr = data['date'];
      if (dateStr == null) return ImportResult.skipped;
      
      final date = DateTime.parse(dateStr);

      // Vérifier si données existent déjà
      final existing = await isar.garminHealthDatas
          .filter()
          .dateEqualTo(date)
          .findFirst();

      if (existing != null && !force) {
        return ImportResult.skipped;
      }

      // Créer ou mettre à jour l'entrée
      final healthData = GarminHealthData(
        sleepScore: data['sleep_score'],
        sleepDurationMinutes: data['sleep_duration_minutes'],
        averageStress: data['average_stress'],
        steps: data['steps'],
        restingHeartRate: data['resting_heart_rate'],
      )
        ..date = date
        ..deepSleepMinutes = data['deep_sleep_minutes']
        ..lightSleepMinutes = data['light_sleep_minutes']
        ..remSleepMinutes = data['rem_sleep_minutes']
        ..awakenings = data['awakenings']
        ..maxStress = data['max_stress']
        ..restMinutes = data['rest_minutes']
        ..distanceMeters = data['distance_meters']?.toDouble()
        ..activeCalories = data['active_calories']
        ..moderateActivityMinutes = data['moderate_activity_minutes']
        ..vigorousActivityMinutes = data['vigorous_activity_minutes']
        ..minHeartRate = data['min_heart_rate']
        ..maxHeartRate = data['max_heart_rate']
        ..averageHeartRate = data['average_heart_rate']
        ..bodyBatteryAverage = data['body_battery_average']
        ..bodyBatteryMin = data['body_battery_min']
        ..bodyBatteryMax = data['body_battery_max']
        ..lastSync = DateTime.now()
        ..source = 'garmin'
        ..rawData = json.encode(data);

      // Sauvegarder
      await isar.writeTxn(() async {
        if (existing != null) {
          healthData.id = existing.id;
        }
        await isar.garminHealthDatas.put(healthData);
      });

      return existing != null ? ImportResult.updated : ImportResult.imported;
      
    } catch (e) {
      print('❌ Erreur import journée Garmin: $e');
      return ImportResult.skipped;
    }
  }

  // ============================================
  // SYNCHRONISATION STRAVA
  // ============================================

  /// Synchroniser les activités Strava pour une période
  Future<SyncResult> syncStravaActivities({
    required DateTime startDate,
    DateTime? endDate,
    bool force = false,
  }) async {
    try {
      endDate ??= DateTime.now();
      
      print('🔄 Synchronisation Strava: $startDate -> $endDate');
      
      // Appel API
      final response = await http.get(
        Uri.parse('$_stravaApiUrl/activities')
            .replace(queryParameters: {
          'after': (startDate.millisecondsSinceEpoch ~/ 1000).toString(),
          'before': (endDate.millisecondsSinceEpoch ~/ 1000).toString(),
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> activities = json.decode(response.body);

        int imported = 0;
        int updated = 0;
        int skipped = 0;

        for (var activityData in activities) {
          final result = await _importStravaActivity(activityData, force);
          
          switch (result) {
            case ImportResult.imported:
              imported++;
              break;
            case ImportResult.updated:
              updated++;
              break;
            case ImportResult.skipped:
              skipped++;
              break;
          }
        }

        print('✅ Sync Strava terminé: $imported importés, $updated mis à jour, $skipped ignorés');
        
        return SyncResult(
          success: true,
          imported: imported,
          updated: updated,
          skipped: skipped,
        );
        
      } else {
        throw Exception('Erreur API Strava: ${response.statusCode}');
      }
      
    } catch (e) {
      print('❌ Erreur sync Strava: $e');
      return SyncResult(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Importer une activité Strava
  Future<ImportResult> _importStravaActivity(Map<String, dynamic> data, bool force) async {
    try {
      final stravaId = data['id'];
      if (stravaId == null) return ImportResult.skipped;

      // Vérifier si activité existe déjà
      final existing = await isar.stravaActivitys
          .filter()
          .stravaIdEqualTo(stravaId)
          .findFirst();

      if (existing != null && !force) {
        return ImportResult.skipped;
      }

      // Parser la date
      final startDateStr = data['start_date'];
      final startDate = DateTime.parse(startDateStr);

      // Créer ou mettre à jour l'entrée
      final activity = StravaActivity(
        stravaId: stravaId,
        startDate: startDate,
        activityType: data['type'] ?? 'Unknown',
        name: data['name'] ?? 'Activité',
        durationSeconds: data['moving_time'] ?? 0,
        distanceMeters: (data['distance'] ?? 0).toDouble(),
      )
        ..elevationGain = data['total_elevation_gain']?.toDouble()
        ..averageSpeed = data['average_speed']?.toDouble()
        ..maxSpeed = data['max_speed']?.toDouble()
        ..calories = data['calories']?.toInt()
        ..averageHeartRate = data['average_heartrate']?.toInt()
        ..maxHeartRate = data['max_heartrate']?.toInt()
        ..perceivedExertion = data['perceived_exertion']?.toInt()
        ..sufferScore = data['suffer_score']?.toDouble()
        ..description = data['description']
        ..workoutType = data['workout_type']
        ..lastSync = DateTime.now()
        ..rawData = json.encode(data);

      // Sauvegarder
      await isar.writeTxn(() async {
        if (existing != null) {
          activity.id = existing.id;
        }
        await isar.stravaActivitys.put(activity);
      });

      return existing != null ? ImportResult.updated : ImportResult.imported;
      
    } catch (e) {
      print('❌ Erreur import activité Strava: $e');
      return ImportResult.skipped;
    }
  }

  // ============================================
  // REQUÊTES DONNÉES
  // ============================================

  /// Récupérer les données Garmin pour une date
  Future<GarminHealthData?> getGarminDataForDate(DateTime date) async {
    return await isar.garminHealthDatas
        .filter()
        .dateEqualTo(date)
        .findFirst();
  }

  /// Récupérer les activités Strava pour une date
  Future<List<StravaActivity>> getStravaActivitiesForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return await isar.stravaActivitys
        .filter()
        .startDateBetween(startOfDay, endOfDay)
        .findAll();
  }

  /// Récupérer les données Garmin pour une période
  Future<List<GarminHealthData>> getGarminDataForPeriod({
    required DateTime start,
    required DateTime end,
  }) async {
    return await isar.garminHealthDatas
        .filter()
        .dateBetween(start, end)
        .sortByDate()
        .findAll();
  }

  /// Récupérer les activités Strava pour une période
  Future<List<StravaActivity>> getStravaActivitiesForPeriod({
    required DateTime start,
    required DateTime end,
  }) async {
    return await isar.stravaActivitys
        .filter()
        .startDateBetween(start, end)
        .sortByStartDate()
        .findAll();
  }
}

// ============================================
// CLASSES UTILITAIRES
// ============================================

enum ImportResult {
  imported,
  updated,
  skipped,
}

class SyncResult {
  final bool success;
  final int imported;
  final int updated;
  final int skipped;
  final String? error;

  SyncResult({
    required this.success,
    this.imported = 0,
    this.updated = 0,
    this.skipped = 0,
    this.error,
  });

  @override
  String toString() {
    if (!success) return 'Erreur: $error';
    return 'Importé: $imported, Mis à jour: $updated, Ignoré: $skipped';
  }
}
