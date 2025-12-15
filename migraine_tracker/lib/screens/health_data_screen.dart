import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../services/health_sync_service.dart';
import '../models/garmin_health_data.dart';
import '../models/strava_activity.dart';

/// Écran de visualisation des données Garmin Health et Strava
/// 
/// Fonctionnalités:
/// - Affichage des données de santé quotidiennes
/// - Liste des activités sportives
/// - Synchronisation manuelle
/// - Indicateurs de corrélation avec migraines
class HealthDataScreen extends StatefulWidget {
  const HealthDataScreen({Key? key}) : super(key: key);

  @override
  State<HealthDataScreen> createState() => _HealthDataScreenState();
}

class _HealthDataScreenState extends State<HealthDataScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late HealthSyncService _syncService;
  
  bool _isLoading = false;
  bool _isSyncing = false;
  DateTime _selectedDate = DateTime.now();
  
  GarminHealthData? _garminData;
  List<StravaActivity> _stravaActivities = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _initService();
  }

  Future<void> _initService() async {
    final dbService = DatabaseService();
    await dbService.initialize();
    _syncService = HealthSyncService(dbService.isar);
    await _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    
    try {
      final garminData = await _syncService.getGarminDataForDate(_selectedDate);
      final stravaActivities = await _syncService.getStravaActivitiesForDate(_selectedDate);
      
      setState(() {
        _garminData = garminData;
        _stravaActivities = stravaActivities;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      _showError('Erreur chargement données: $e');
    }
  }

  Future<void> _syncData() async {
    setState(() => _isSyncing = true);
    
    try {
      // Synchroniser les 30 derniers jours
      final endDate = DateTime.now();
      final startDate = endDate.subtract(const Duration(days: 30));
      
      // Sync Garmin
      final garminResult = await _syncService.syncGarminData(
        startDate: startDate,
        endDate: endDate,
      );
      
      // Sync Strava
      final stravaResult = await _syncService.syncStravaActivities(
        startDate: startDate,
        endDate: endDate,
      );
      
      setState(() => _isSyncing = false);
      
      if (garminResult.success && stravaResult.success) {
        _showSuccess('Synchronisation réussie!\n'
            'Garmin: ${garminResult}\n'
            'Strava: ${stravaResult}');
        await _loadData();
      } else {
        _showError('Erreur synchronisation:\n'
            'Garmin: ${garminResult.error ?? "OK"}\n'
            'Strava: ${stravaResult.error ?? "OK"}');
      }
    } catch (e) {
      setState(() => _isSyncing = false);
      _showError('Erreur synchronisation: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        title: const Text('Données Complètes'),
        backgroundColor: const Color(0xFF0F3460),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Journal & Météo'),
            Tab(text: 'Garmin Health'),
          ],
        ),
        actions: [
          IconButton(
            icon: _isSyncing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Icon(Icons.sync),
            onPressed: _isSyncing ? null : _syncData,
            tooltip: 'Synchroniser',
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildJournalTab(),
          _buildGarminTab(),
        ],
      ),
    );
  }

  Widget _buildJournalTab() {
    return const Center(
      child: Text(
        'Journal quotidien\n(À implémenter)',
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildGarminTab() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sélecteur de date
              _buildDateSelector(),
              const SizedBox(height: 24),
              
              // Données Garmin
              _buildGarminSection(),
              const SizedBox(height: 24),
              
              // Activités Strava
              _buildStravaSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector() {
    return Card(
      color: const Color(0xFF0F3460),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white),
              onPressed: () {
                setState(() {
                  _selectedDate = _selectedDate.subtract(const Duration(days: 1));
                });
                _loadData();
              },
            ),
            Text(
              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.white),
              onPressed: () {
                if (_selectedDate.isBefore(DateTime.now())) {
                  setState(() {
                    _selectedDate = _selectedDate.add(const Duration(days: 1));
                  });
                  _loadData();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGarminSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Données Garmin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        
        if (_garminData == null)
          _buildNoDataCard('Aucune donnée Garmin pour cette date')
        else
          Column(
            children: [
              _buildGarminMetricRow(
                '😴 Score Sommeil',
                _garminData!.sleepScore?.toString() ?? '-',
                color: _getScoreColor(_garminData!.sleepScore),
              ),
              _buildGarminMetricRow(
                '🛌 Durée',
                _garminData!.formattedSleepDuration,
              ),
              _buildGarminMetricRow(
                '😰 Stress Moyen',
                _garminData!.averageStress?.toString() ?? '-',
                color: _getStressColor(_garminData!.averageStress),
              ),
              _buildGarminMetricRow(
                '🚶 Pas',
                _garminData!.steps?.toString() ?? '-',
              ),
              _buildGarminMetricRow(
                '❤️ FC Repos',
                _garminData!.restingHeartRate != null
                    ? '${_garminData!.restingHeartRate} bpm'
                    : '-',
              ),
              _buildGarminMetricRow(
                '🔋 Body Battery',
                _garminData!.bodyBatteryAverage?.toString() ?? '-',
                color: _getScoreColor(_garminData!.bodyBatteryAverage),
              ),
              
              const SizedBox(height: 16),
              
              // Alerte journée à risque
              if (_garminData!.isHighRiskDay)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    border: Border.all(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.warning, color: Colors.red),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Journée à risque de migraine détectée',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }

  Widget _buildStravaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Activités Strava',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        
        if (_stravaActivities.isEmpty)
          _buildNoDataCard('Aucune activité Strava pour cette date')
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _stravaActivities.length,
            itemBuilder: (context, index) {
              final activity = _stravaActivities[index];
              return _buildActivityCard(activity);
            },
          ),
      ],
    );
  }

  Widget _buildActivityCard(StravaActivity activity) {
    return Card(
      color: const Color(0xFF0F3460),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  activity.activityIcon,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        activity.activityType,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActivityMetric(
                  '⏱️',
                  activity.formattedDuration,
                ),
                _buildActivityMetric(
                  '📏',
                  activity.formattedDistance,
                ),
                _buildActivityMetric(
                  '⚡',
                  activity.pacePerKm,
                ),
              ],
            ),
            if (activity.averageHeartRate != null) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildActivityMetric(
                    '❤️ Moy',
                    '${activity.averageHeartRate} bpm',
                  ),
                  _buildActivityMetric(
                    '❤️ Max',
                    '${activity.maxHeartRate ?? "-"} bpm',
                  ),
                  _buildActivityMetric(
                    '🔥 Intensité',
                    activity.intensityLevel,
                  ),
                ],
              ),
            ],
            
            // Alerte déclencheur potentiel
            if (activity.isPotentialTrigger) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.2),
                  border: Border.all(color: Colors.orange, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.info_outline, color: Colors.orange, size: 16),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Activité potentiellement déclencheuse',
                        style: TextStyle(color: Colors.orange, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildActivityMetric(String icon, String value) {
    return Column(
      children: [
        Text(
          icon,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildGarminMetricRow(String label, String value, {Color? color}) {
    return Card(
      color: const Color(0xFF0F3460),
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: color ?? Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoDataCard(String message) {
    return Card(
      color: const Color(0xFF0F3460),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Color _getScoreColor(int? score) {
    if (score == null) return Colors.white;
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  Color _getStressColor(int? stress) {
    if (stress == null) return Colors.white;
    if (stress <= 25) return Colors.green;
    if (stress <= 50) return Colors.orange;
    return Colors.red;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
