import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/migraine_attack.dart';
import '../services/database_service.dart';

class AddAttackStep3Screen extends StatefulWidget {
  final MigraineAttack attack;

  const AddAttackStep3Screen({Key? key, required this.attack})
      : super(key: key);

  @override
  State<AddAttackStep3Screen> createState() => _AddAttackStep3ScreenState();
}

class _AddAttackStep3ScreenState extends State<AddAttackStep3Screen> {
  final DatabaseService _db = DatabaseService();
  
  bool _hasMedication = false;
  String? _medicationName;
  int _dosage = 100;
  String _route = 'Oral';
  DateTime? _medicationTime;
  
  bool _hasRescueMedication = false;
  String? _rescueMedicationName;
  int _rescueDosage = 400;
  DateTime? _rescueTime;
  
  int? _intensityAfter2h;
  int? _intensityAfter4h;
  int _effectiveness = 3;
  
  DateTime? _endTime;
  
  final Set<String> _sideEffects = {};
  
  List<Medication> _availableMedications = [];
  
  @override
  void initState() {
    super.initState();
    _loadMedications();
    _medicationTime = widget.attack.startTime.add(const Duration(minutes: 30));
  }

  Future<void> _loadMedications() async {
    final meds = await _db.getAllMedications();
    setState(() => _availableMedications = meds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Nouvelle crise'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '3/3',
              style: TextStyle(color: Color(0xFF94A3B8)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('💊 TRAITEMENT PRIS'),
            const SizedBox(height: 16),
            _buildMedicationQuestion(),
            if (_hasMedication) ...[
              const SizedBox(height: 16),
              _buildFirstMedicationSection(),
              const SizedBox(height: 16),
              _buildEffectivenessSection(),
              const SizedBox(height: 16),
              _buildRescueMedicationQuestion(),
              if (_hasRescueMedication) ...[
                const SizedBox(height: 16),
                _buildRescueMedicationSection(),
              ],
            ],
            const SizedBox(height: 24),
            _buildEndTimeSection(),
            const SizedBox(height: 24),
            _buildSideEffectsSection(),
            const SizedBox(height: 24),
            _buildEffectivenessRating(),
            const SizedBox(height: 32),
            _buildNavigationButtons(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildMedicationQuestion() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Avez-vous pris un traitement ?',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() => _hasMedication = true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _hasMedication
                        ? const Color(0xFF4F46E5)
                        : const Color(0xFF16213E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Oui'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => setState(() => _hasMedication = false),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !_hasMedication
                        ? const Color(0xFF4F46E5)
                        : const Color(0xFF16213E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Non'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFirstMedicationSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PREMIER TRAITEMENT',
            style: TextStyle(
              color: Color(0xFF4F46E5),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text('Médicament', style: TextStyle(color: Color(0xFF94A3B8))),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _medicationName,
            hint: const Text('Sélectionner'),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF16213E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            dropdownColor: const Color(0xFF0F3460),
            style: const TextStyle(color: Colors.white),
            items: _availableMedications.map((med) {
              return DropdownMenuItem(
                value: med.name,
                child: Text(med.name),
              );
            }).toList(),
            onChanged: (value) => setState(() => _medicationName = value),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Dosage',
                        style: TextStyle(color: Color(0xFF94A3B8))),
                    const SizedBox(height: 8),
                    TextFormField(
                      initialValue: _dosage.toString(),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF16213E),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        suffixText: 'mg',
                        suffixStyle:
                            const TextStyle(color: Color(0xFF94A3B8)),
                      ),
                      onChanged: (value) =>
                          _dosage = int.tryParse(value) ?? _dosage,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Voie',
                        style: TextStyle(color: Color(0xFF94A3B8))),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _route,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF16213E),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      dropdownColor: const Color(0xFF0F3460),
                      style: const TextStyle(color: Colors.white),
                      items: ['Oral', 'Injectable', 'Nasal', 'Sublingual']
                          .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                          .toList(),
                      onChanged: (value) => setState(() => _route = value!),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text('Heure de prise',
              style: TextStyle(color: Color(0xFF94A3B8))),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(_medicationTime!),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.dark().copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: Color(0xFF4F46E5),
                        surface: Color(0xFF0F3460),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (time != null) {
                setState(() {
                  _medicationTime = DateTime(
                    widget.attack.startTime.year,
                    widget.attack.startTime.month,
                    widget.attack.startTime.day,
                    time.hour,
                    time.minute,
                  );
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF16213E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${TimeOfDay.fromDateTime(_medicationTime!).format(context)} (${_medicationTime!.difference(widget.attack.startTime).inMinutes} min après début)',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Icon(Icons.access_time, color: Color(0xFF4F46E5)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEffectivenessSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'EFFICACITÉ DU TRAITEMENT',
            style: TextStyle(
              color: Color(0xFF4F46E5),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Intensité après 2 heures:',
            style: TextStyle(color: Color(0xFF94A3B8)),
          ),
          const SizedBox(height: 8),
          Row(
            children: List.generate(11, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _intensityAfter2h = index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 40,
                    decoration: BoxDecoration(
                      color: _intensityAfter2h == index
                          ? const Color(0xFF4F46E5)
                          : const Color(0xFF16213E),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        '$index',
                        style: TextStyle(
                          color: _intensityAfter2h == index
                              ? Colors.white
                              : const Color(0xFF64748B),
                          fontWeight: _intensityAfter2h == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildRescueMedicationQuestion() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '⚠️ Douleur persistante?',
            style: TextStyle(
              color: Color(0xFFF59E0B),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text(
                    'Non, soulagé',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: false,
                  groupValue: _hasRescueMedication,
                  activeColor: const Color(0xFF4F46E5),
                  onChanged: (value) =>
                      setState(() => _hasRescueMedication = value!),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text(
                    'Oui, traitement secours',
                    style: TextStyle(color: Colors.white),
                  ),
                  value: true,
                  groupValue: _hasRescueMedication,
                  activeColor: const Color(0xFF4F46E5),
                  onChanged: (value) =>
                      setState(() => _hasRescueMedication = value!),
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRescueMedicationSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF59E0B).withOpacity(0.1),
        border: Border.all(color: const Color(0xFFF59E0B)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '💊 TRAITEMENT DE SECOURS',
            style: TextStyle(
              color: Color(0xFFF59E0B),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _rescueMedicationName,
            hint: const Text('Médicament'),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF16213E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
            dropdownColor: const Color(0xFF0F3460),
            style: const TextStyle(color: Colors.white),
            items: _availableMedications.map((med) {
              return DropdownMenuItem(
                value: med.name,
                child: Text(med.name),
              );
            }).toList(),
            onChanged: (value) =>
                setState(() => _rescueMedicationName = value),
          ),
          const SizedBox(height: 12),
          TextFormField(
            initialValue: _rescueDosage.toString(),
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Dosage',
              labelStyle: const TextStyle(color: Color(0xFF94A3B8)),
              filled: true,
              fillColor: const Color(0xFF16213E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              suffixText: 'mg',
              suffixStyle: const TextStyle(color: Color(0xFF94A3B8)),
            ),
            onChanged: (value) =>
                _rescueDosage = int.tryParse(value) ?? _rescueDosage,
          ),
        ],
      ),
    );
  }

  Widget _buildEndTimeSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '✅ FIN DE LA CRISE',
            style: TextStyle(
              color: Color(0xFF10B981),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.dark().copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: Color(0xFF4F46E5),
                        surface: Color(0xFF0F3460),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (time != null) {
                setState(() {
                  _endTime = DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    time.hour,
                    time.minute,
                  );
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF16213E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _endTime != null
                          ? TimeOfDay.fromDateTime(_endTime!).format(context)
                          : 'Sélectionner l\'heure de fin',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Icon(Icons.access_time, color: Color(0xFF4F46E5)),
                ],
              ),
            ),
          ),
          if (_endTime != null) ...[
            const SizedBox(height: 8),
            Text(
              'Durée totale: ${_endTime!.difference(widget.attack.startTime).inHours}h${_endTime!.difference(widget.attack.startTime).inMinutes % 60}min',
              style: const TextStyle(color: Color(0xFF94A3B8)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildSideEffectsSection() {
    final commonSideEffects = [
      'Somnolence',
      'Vertiges',
      'Nausées',
      'Fatigue',
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '⚠️ EFFETS SECONDAIRES (optionnel)',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: commonSideEffects.map((effect) {
              final isSelected = _sideEffects.contains(effect);
              return FilterChip(
                selected: isSelected,
                label: Text(effect),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF94A3B8),
                ),
                backgroundColor: const Color(0xFF16213E),
                selectedColor: const Color(0xFFEF4444),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      _sideEffects.add(effect);
                    } else {
                      _sideEffects.remove(effect);
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEffectivenessRating() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📊 EFFICACITÉ GLOBALE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _effectiveness ? Icons.star : Icons.star_border,
                  color: const Color(0xFFF59E0B),
                  size: 40,
                ),
                onPressed: () => setState(() => _effectiveness = index + 1),
              );
            }),
          ),
          Center(
            child: Text(
              '$_effectiveness/5',
              style: const TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF4F46E5)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              '← PRÉCÉDENT',
              style: TextStyle(color: Color(0xFF4F46E5)),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: _saveAttack,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF10B981),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              '✓ ENREGISTRER',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _saveAttack() async {
    // Update attack with medication data
    if (_hasMedication && _medicationName != null) {
      widget.attack.medications = [_medicationName!];
      widget.attack.medicationTimes = [_medicationTime!];
      widget.attack.medicationDosages = [_dosage];
      widget.attack.medicationRoutes = [_route];

      widget.attack.intensityAfter2h = _intensityAfter2h;
      widget.attack.overallEffectiveness = _effectiveness;

      if (_hasRescueMedication && _rescueMedicationName != null) {
        widget.attack.needRescueMedication = true;
        widget.attack.rescueMedicationName = _rescueMedicationName;
        widget.attack.rescueMedicationDosage = _rescueDosage;
      }
    }

    widget.attack.endTime = _endTime;
    widget.attack.sideEffects = _sideEffects.toList();

    // Save to database
    try {
      await _db.addMigraineAttack(widget.attack);

      if (!mounted) return;

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✓ Crise enregistrée avec succès'),
          backgroundColor: Color(0xFF10B981),
        ),
      );

      // Navigate back to dashboard (pop all add attack screens)
      Navigator.of(context).popUntil((route) => route.isFirst);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur: $e'),
          backgroundColor: const Color(0xFFEF4444),
        ),
      );
    }
  }
}
