import 'package:flutter/material.dart';
import '../models/migraine_attack.dart';
import 'add_attack_step3_screen.dart';

class AddAttackStep2Screen extends StatefulWidget {
  final MigraineAttack attack;

  const AddAttackStep2Screen({Key? key, required this.attack})
      : super(key: key);

  @override
  State<AddAttackStep2Screen> createState() => _AddAttackStep2ScreenState();
}

class _AddAttackStep2ScreenState extends State<AddAttackStep2Screen> {
  final Set<String> _selectedSymptoms = {};
  final TextEditingController _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
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
              '2/3',
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
            _buildSectionTitle('SYMPTÔMES ASSOCIÉS'),
            const SizedBox(height: 16),
            _buildSymptomCategory(
              '🧠 SYMPTÔMES NEUROLOGIQUES',
              MigraineSymptomsEnum.neurologicalSymptoms,
            ),
            const SizedBox(height: 16),
            _buildSymptomCategory(
              '🤢 SYMPTÔMES DIGESTIFS',
              MigraineSymptomsEnum.digestiveSymptoms,
            ),
            const SizedBox(height: 16),
            _buildSymptomCategory(
              '👁️ SENSIBILITÉS',
              MigraineSymptomsEnum.sensitivities,
            ),
            const SizedBox(height: 16),
            _buildSymptomCategory(
              '💧 SYMPTÔMES AUTONOMIQUES',
              MigraineSymptomsEnum.autonomicSymptoms,
            ),
            const SizedBox(height: 16),
            _buildSymptomCategory(
              '⚡ SYMPTÔMES PRÉMONITOIRES',
              MigraineSymptomsEnum.premonitorySymptoms,
            ),
            const SizedBox(height: 24),
            _buildNotesSection(),
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

  Widget _buildSymptomCategory(String title, List<String> symptoms) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F3460),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF4F46E5),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...symptoms.map((symptom) {
            final isSelected = _selectedSymptoms.contains(symptom);
            return CheckboxListTile(
              title: Text(
                symptom,
                style: const TextStyle(color: Colors.white),
              ),
              value: isSelected,
              activeColor: const Color(0xFF4F46E5),
              checkColor: Colors.white,
              contentPadding: EdgeInsets.zero,
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _selectedSymptoms.add(symptom);
                  } else {
                    _selectedSymptoms.remove(symptom);
                  }
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildNotesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '📝 NOTES ADDITIONNELLES (optionnel)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0F3460),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _notesController,
            maxLines: 4,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Saisissez des notes...',
              hintStyle: TextStyle(color: Color(0xFF64748B)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
        ),
      ],
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
            onPressed: () {
              // Update attack object
              widget.attack.symptoms = _selectedSymptoms.toList();
              widget.attack.notes = _notesController.text.isEmpty
                  ? null
                  : _notesController.text;

              // Navigate to step 3
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddAttackStep3Screen(
                    attack: widget.attack,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F46E5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              'SUIVANT →',
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
}
