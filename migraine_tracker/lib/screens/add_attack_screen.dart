import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/migraine_attack.dart';
import 'add_attack_step2_screen.dart';

class AddAttackScreen extends StatefulWidget {
  const AddAttackScreen({Key? key}) : super(key: key);

  @override
  State<AddAttackScreen> createState() => _AddAttackScreenState();
}

class _AddAttackScreenState extends State<AddAttackScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _intensity = 5;
  String _location = 'Droite (temporale)';
  String _painType = 'Pulsatile/Battements';
  bool _isUnilateral = true;

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
              '1/3',
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
            _buildSectionTitle('QUAND LA CRISE A-T-ELLE COMMENCÉ ?'),
            const SizedBox(height: 16),
            _buildDateTimeSection(),
            const SizedBox(height: 24),
            _buildSectionTitle('INTENSITÉ DE LA DOULEUR'),
            const SizedBox(height: 16),
            _buildIntensitySlider(),
            const SizedBox(height: 24),
            _buildSectionTitle('LOCALISATION DE LA DOULEUR'),
            const SizedBox(height: 16),
            _buildLocationSection(),
            const SizedBox(height: 24),
            _buildSectionTitle('TYPE DE DOULEUR'),
            const SizedBox(height: 16),
            _buildPainTypeSection(),
            const SizedBox(height: 32),
            _buildNextButton(),
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

  Widget _buildDateTimeSection() {
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
            '📅 Date',
            style: TextStyle(color: Color(0xFF94A3B8)),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime.now().subtract(const Duration(days: 90)),
                lastDate: DateTime.now(),
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
              if (date != null) {
                setState(() => _selectedDate = date);
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
                      DateFormat('EEEE d MMMM yyyy', 'fr_FR')
                          .format(_selectedDate),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Icon(Icons.calendar_today, color: Color(0xFF4F46E5)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '⏰ Heure',
            style: TextStyle(color: Color(0xFF94A3B8)),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: _selectedTime,
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
                setState(() => _selectedTime = time);
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
                      _selectedTime.format(context),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const Icon(Icons.access_time, color: Color(0xFF4F46E5)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  _selectedDate = DateTime.now();
                  _selectedTime = TimeOfDay.now();
                });
              },
              icon: const Icon(Icons.flash_on, color: Color(0xFF4F46E5)),
              label: const Text(
                'Maintenant',
                style: TextStyle(color: Color(0xFF4F46E5)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntensitySlider() {
    final emojis = ['😊', '🙂', '😐', '😟', '😫', '😰', '😱', '💀'];
    final emojiIndex = (_intensity - 1) ~/ 1.25;
    
    Color getIntensityColor() {
      if (_intensity <= 3) return const Color(0xFF10B981);
      if (_intensity <= 6) return const Color(0xFFF59E0B);
      return const Color(0xFFEF4444);
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            emojis[emojiIndex.clamp(0, emojis.length - 1)],
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(10, (index) {
              final value = index + 1;
              return Text(
                '$value',
                style: TextStyle(
                  color: _intensity == value
                      ? Colors.white
                      : const Color(0xFF64748B),
                  fontWeight: _intensity == value
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              );
            }),
          ),
          Slider(
            value: _intensity.toDouble(),
            min: 1,
            max: 10,
            divisions: 9,
            activeColor: getIntensityColor(),
            inactiveColor: const Color(0xFF16213E),
            onChanged: (value) {
              setState(() => _intensity = value.round());
            },
          ),
          Text(
            _intensity.toString(),
            style: TextStyle(
              color: getIntensityColor(),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Légère',
                  style: TextStyle(color: Color(0xFF10B981), fontSize: 12),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF59E0B).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Modérée',
                  style: TextStyle(color: Color(0xFFF59E0B), fontSize: 12),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEF4444).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Sévère',
                  style: TextStyle(color: Color(0xFFEF4444), fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Simple head diagram
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFF16213E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.face,
                    size: 80,
                    color: Color(0xFF4F46E5),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Toucher pour sélectionner',
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _location,
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
            items: PainLocations.locations.map((loc) {
              return DropdownMenuItem(
                value: loc,
                child: Text(loc),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _location = value);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPainTypeSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: PainTypes.types.map((type) {
          final isSelected = _painType == type;
          return FilterChip(
            selected: isSelected,
            label: Text(type),
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF94A3B8),
            ),
            backgroundColor: const Color(0xFF16213E),
            selectedColor: const Color(0xFF4F46E5),
            onSelected: (selected) {
              if (selected) {
                setState(() => _painType = type);
              }
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          // Create MigraineAttack object with current data
          final startDateTime = DateTime(
            _selectedDate.year,
            _selectedDate.month,
            _selectedDate.day,
            _selectedTime.hour,
            _selectedTime.minute,
          );

          final attack = MigraineAttack()
            ..startTime = startDateTime
            ..intensity = _intensity
            ..location = _location
            ..painType = _painType
            ..isUnilateral = _isUnilateral;

          // Navigate to step 2
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAttackStep2Screen(attack: attack),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4F46E5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'SUIVANT →',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
