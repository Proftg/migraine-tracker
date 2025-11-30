import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/migraine_attack.dart';
import '../services/database_service.dart';
import 'add_attack_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DatabaseService _db = DatabaseService();
  Map<String, dynamic>? _currentMonthStats;
  Map<String, dynamic>? _comparison;
  InjectionRecord? _nextInjection;
  List<MigraineAttack> _recentAttacks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);

    try {
      final now = DateTime.now();
      final currentMonth = DateTime(now.year, now.month);
      final previousMonth =
          DateTime(now.year, now.month - 1);

      final currentStats = await _db.getMonthlyStatistics(currentMonth);
      final comparison = await _db.compareMonths(currentMonth, previousMonth);
      final latestInjection = await _db.getLatestInjection();
      final attacks = await _db.getMigraineAttacksByMonth(currentMonth);

      setState(() {
        _currentMonthStats = currentStats;
        _comparison = comparison;
        _nextInjection = latestInjection;
        _recentAttacks = attacks.take(3).toList();
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading dashboard data: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bonjour TAHAR 👋',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              DateFormat('EEEE d MMMM yyyy', 'fr_FR').format(DateTime.now()),
              style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadData,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMonthlyStatsCard(),
                    const SizedBox(height: 16),
                    _buildNextInjectionCard(),
                    const SizedBox(height: 16),
                    _buildRecentActivitiesCard(),
                    const SizedBox(height: 16),
                    _buildInsightsCard(),
                    const SizedBox(height: 100), // Space for FAB
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddAttackScreen(),
            ),
          );
          if (result == true) {
            _loadData(); // Refresh data after adding attack
          }
        },
        backgroundColor: const Color(0xFF4F46E5),
        icon: const Icon(Icons.add),
        label: const Text('ENREGISTRER UNE CRISE'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildMonthlyStatsCard() {
    if (_currentMonthStats == null || _comparison == null) {
      return const SizedBox.shrink();
    }

    final stats = _currentMonthStats!;
    final comparison = _comparison!;
    final attackCount = stats['attackCount'] as int;
    final avgIntensity = (stats['avgIntensity'] as double).toStringAsFixed(1);
    final attackChange = comparison['attackChange'] as int;
    final intensityChange = comparison['intensityChange'] as int;

    final now = DateTime.now();
    final monthName = DateFormat('MMMM yyyy', 'fr_FR').format(now);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.calendar_today,
                  color: Color(0xFF4F46E5), size: 20),
              const SizedBox(width: 8),
              Text(
                'CE MOIS-CI ($monthName)',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Traitement préventif: Injection 3/12',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                '$attackCount crises',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: attackCount / 12,
            backgroundColor: const Color(0xFF16213E),
            valueColor: AlwaysStoppedAnimation<Color>(
              attackCount <= 4
                  ? const Color(0xFF10B981)
                  : const Color(0xFFF59E0B),
            ),
            minHeight: 8,
          ),
          const SizedBox(height: 8),
          Text(
            'Objectif: <4 crises',
            style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
          ),
          const SizedBox(height: 16),
          _buildEvolutionIndicator(
            attackChange,
            'vs mois dernier',
          ),
          const SizedBox(height: 8),
          Text(
            'Intensité moyenne: $avgIntensity/10  ${_getChangeText(intensityChange)}',
            style: const TextStyle(color: Color(0xFF94A3B8)),
          ),
          const SizedBox(height: 8),
          Text(
            'Jours avec médication: ${stats['daysWithMedication']}  ${stats['daysWithMedication'] <= 10 ? '✓ Normal' : '⚠️ Élevé'}',
            style: const TextStyle(color: Color(0xFF94A3B8)),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate to reports
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F46E5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('📊 Voir détails'),
          ),
        ],
      ),
    );
  }

  Widget _buildEvolutionIndicator(int change, String label) {
    String arrow;
    String text;
    Color color;

    if (change <= -30) {
      arrow = '↓↓';
      text = 'AMÉLIORATION SIGNIFICATIVE';
      color = const Color(0xFF10B981);
    } else if (change < -10) {
      arrow = '↓';
      text = 'AMÉLIORATION MODÉRÉE';
      color = const Color(0xFF10B981);
    } else if (change <= 10) {
      arrow = '→';
      text = 'STABLE';
      color = const Color(0xFF94A3B8);
    } else if (change <= 30) {
      arrow = '↑';
      text = 'AUGMENTATION MODÉRÉE';
      color = const Color(0xFFF59E0B);
    } else {
      arrow = '↑↑';
      text = 'AUGMENTATION SIGNIFICATIVE';
      color = const Color(0xFFEF4444);
    }

    return Row(
      children: [
        Text(
          '$arrow ${change.abs()}%',
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ),
      ],
    );
  }

  String _getChangeText(int change) {
    if (change < 0) {
      return '↓ ${change.abs()}%';
    } else if (change > 0) {
      return '↑ $change%';
    }
    return '→ 0%';
  }

  Widget _buildNextInjectionCard() {
    // Calculate next injection date (mock data for now)
    final nextDate = DateTime(2025, 11, 28);
    final daysUntil = nextDate.difference(DateTime.now()).inDays;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.medical_services,
                  color: Color(0xFF4F46E5), size: 20),
              SizedBox(width: 8),
              Text(
                'PROCHAINE INJECTION',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Color(0xFF94A3B8)),
              const SizedBox(width: 8),
              Text(
                DateFormat('d MMMM yyyy', 'fr_FR').format(nextDate),
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.access_time, color: Color(0xFF94A3B8)),
              const SizedBox(width: 8),
              Text(
                'Dans $daysUntil jours',
                style: const TextStyle(color: Color(0xFF94A3B8)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Set reminder
                },
                icon: const Icon(Icons.notifications, size: 18),
                label: const Text('Définir rappel'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF16213E),
                  foregroundColor: const Color(0xFF4F46E5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivitiesCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📈 DERNIÈRES ACTIVITÉS',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          if (_recentAttacks.isEmpty)
            const Text(
              'Aucune crise enregistrée ce mois',
              style: TextStyle(color: Color(0xFF94A3B8)),
            )
          else
            ..._recentAttacks.map((attack) => _buildActivityItem(attack)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(MigraineAttack attack) {
    final date = DateFormat('EEEE, HH:mm', 'fr_FR').format(attack.startTime);
    final duration = attack.durationMinutes != null
        ? '${(attack.durationMinutes! / 60).floor()}h'
        : 'En cours';

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFFEF4444),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Intensité: ${attack.intensity}/10 | Durée: $duration',
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🤖 INSIGHTS IA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF16213E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '💡 Pattern détecté:',
                  style: TextStyle(
                    color: Color(0xFF4F46E5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '75% de vos crises surviennent après <6h de sommeil',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    // Navigate to full analysis
                  },
                  child: const Text(
                    'Voir analyse complète →',
                    style: TextStyle(color: Color(0xFF4F46E5)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
