import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/migraine_attack.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Isar? _isar;

  Future<Isar> get isar async {
    if (_isar != null) return _isar!;
    _isar = await _initDB();
    return _isar!;
  }

  Future<Isar> _initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        MigraineAttackSchema,
        DailyLogSchema,
        MedicationSchema,
        InjectionRecordSchema,
        UserProfileSchema,
      ],
      directory: dir.path,
    );
  }

  // CRUD pour MigraineAttack
  Future<int> addMigraineAttack(MigraineAttack attack) async {
    final db = await isar;
    return await db.writeTxn(() async {
      return await db.migraineAttacks.put(attack);
    });
  }

  Future<MigraineAttack?> getMigraineAttack(int id) async {
    final db = await isar;
    return await db.migraineAttacks.get(id);
  }

  Future<List<MigraineAttack>> getAllMigraineAttacks() async {
    final db = await isar;
    return await db.migraineAttacks.where().sortByStartTimeDesc().findAll();
  }

  Future<List<MigraineAttack>> getMigraineAttacksByMonth(
      DateTime month) async {
    final db = await isar;
    final startOfMonth = DateTime(month.year, month.month, 1);
    final endOfMonth = DateTime(month.year, month.month + 1, 0, 23, 59, 59);

    return await db.migraineAttacks
        .where()
        .filter()
        .startTimeBetween(startOfMonth, endOfMonth)
        .sortByStartTimeDesc()
        .findAll();
  }

  Future<void> updateMigraineAttack(MigraineAttack attack) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.migraineAttacks.put(attack);
    });
  }

  Future<void> deleteMigraineAttack(int id) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.migraineAttacks.delete(id);
    });
  }

  // CRUD pour DailyLog
  Future<int> addDailyLog(DailyLog log) async {
    final db = await isar;
    return await db.writeTxn(() async {
      return await db.dailyLogs.put(log);
    });
  }

  Future<DailyLog?> getDailyLogByDate(DateTime date) async {
    final db = await isar;
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    return await db.dailyLogs
        .where()
        .filter()
        .dateBetween(startOfDay, endOfDay)
        .findFirst();
  }

  Future<List<DailyLog>> getDailyLogsByMonth(DateTime month) async {
    final db = await isar;
    final startOfMonth = DateTime(month.year, month.month, 1);
    final endOfMonth = DateTime(month.year, month.month + 1, 0, 23, 59, 59);

    return await db.dailyLogs
        .where()
        .filter()
        .dateBetween(startOfMonth, endOfMonth)
        .sortByDateDesc()
        .findAll();
  }

  // CRUD pour Medication
  Future<int> addMedication(Medication medication) async {
    final db = await isar;
    return await db.writeTxn(() async {
      return await db.medications.put(medication);
    });
  }

  Future<List<Medication>> getAllMedications() async {
    final db = await isar;
    return await db.medications.where().sortByName().findAll();
  }

  Future<List<Medication>> getMedicationsByType(String type) async {
    final db = await isar;
    return await db.medications
        .where()
        .filter()
        .typeEqualTo(type)
        .sortByName()
        .findAll();
  }

  // CRUD pour InjectionRecord
  Future<int> addInjectionRecord(InjectionRecord record) async {
    final db = await isar;
    return await db.writeTxn(() async {
      return await db.injectionRecords.put(record);
    });
  }

  Future<List<InjectionRecord>> getAllInjectionRecords() async {
    final db = await isar;
    return await db.injectionRecords
        .where()
        .sortByInjectionDateDesc()
        .findAll();
  }

  Future<InjectionRecord?> getLatestInjection() async {
    final db = await isar;
    return await db.injectionRecords
        .where()
        .sortByInjectionDateDesc()
        .findFirst();
  }

  // CRUD pour UserProfile
  Future<void> saveUserProfile(UserProfile profile) async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.userProfiles.put(profile);
    });
  }

  Future<UserProfile?> getUserProfile() async {
    final db = await isar;
    return await db.userProfiles.get(1);
  }

  // Statistiques et analyses
  Future<Map<String, dynamic>> getMonthlyStatistics(DateTime month) async {
    final attacks = await getMigraineAttacksByMonth(month);
    final logs = await getDailyLogsByMonth(month);

    final attackCount = attacks.length;
    final avgIntensity = attacks.isEmpty
        ? 0.0
        : attacks.map((a) => a.intensity).reduce((a, b) => a + b) /
            attacks.length;

    final daysWithMedication =
        attacks.where((a) => a.medications.isNotEmpty).length;

    final rescueMedicationCount =
        attacks.where((a) => a.needRescueMedication).length;

    return {
      'attackCount': attackCount,
      'avgIntensity': avgIntensity,
      'daysWithMedication': daysWithMedication,
      'rescueMedicationCount': rescueMedicationCount,
      'rescuePercentage':
          attackCount > 0 ? (rescueMedicationCount / attackCount * 100) : 0,
    };
  }

  Future<Map<String, dynamic>> compareMonths(
      DateTime currentMonth, DateTime previousMonth) async {
    final currentStats = await getMonthlyStatistics(currentMonth);
    final previousStats = await getMonthlyStatistics(previousMonth);

    final attackChange = previousStats['attackCount'] > 0
        ? ((currentStats['attackCount'] - previousStats['attackCount']) /
                previousStats['attackCount'] *
                100)
            .round()
        : 0;

    final intensityChange = previousStats['avgIntensity'] > 0
        ? ((currentStats['avgIntensity'] - previousStats['avgIntensity']) /
                previousStats['avgIntensity'] *
                100)
            .round()
        : 0;

    return {
      'currentStats': currentStats,
      'previousStats': previousStats,
      'attackChange': attackChange,
      'intensityChange': intensityChange,
    };
  }

  // Initialiser des données par défaut
  Future<void> initializeDefaultData() async {
    final profile = await getUserProfile();
    if (profile == null) {
      // Créer profil par défaut
      final defaultProfile = UserProfile()
        ..name = 'TAHAR GUENFOUD'
        ..age = 35
        ..gender = 'Homme'
        ..city = 'Bruxelles'
        ..country = 'BE'
        ..language = 'fr'
        ..darkMode = true
        ..enableNotifications = true
        ..enableWeatherData = true;

      await saveUserProfile(defaultProfile);
    }

    // Ajouter médicaments prédéfinis si aucun n'existe
    final medications = await getAllMedications();
    if (medications.isEmpty) {
      final defaultMedications = [
        Medication()
          ..name = 'Sumatriptan'
          ..type = 'Aigu'
          ..dosage = '100'
          ..unit = 'mg'
          ..route = 'Oral'
          ..isCustom = false,
        Medication()
          ..name = 'Ibuprofène'
          ..type = 'Aigu'
          ..dosage = '400'
          ..unit = 'mg'
          ..route = 'Oral'
          ..isCustom = false,
        Medication()
          ..name = 'Paracétamol'
          ..type = 'Aigu'
          ..dosage = '1000'
          ..unit = 'mg'
          ..route = 'Oral'
          ..isCustom = false,
        Medication()
          ..name = 'Naproxène'
          ..type = 'Aigu'
          ..dosage = '500'
          ..unit = 'mg'
          ..route = 'Oral'
          ..isCustom = false,
      ];

      for (var med in defaultMedications) {
        await addMedication(med);
      }
    }
  }

  // Nettoyer la base de données (pour testing)
  Future<void> clearAllData() async {
    final db = await isar;
    await db.writeTxn(() async {
      await db.migraineAttacks.clear();
      await db.dailyLogs.clear();
      await db.injectionRecords.clear();
    });
  }
}
