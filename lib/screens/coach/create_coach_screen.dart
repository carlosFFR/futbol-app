import 'package:app_futbol/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../controllers/coach_controller.dart';
import '../../controllers/team_controller.dart';
import '../../models/coach_model.dart';
import '../../models/team_model.dart';

class AddCoachScreen extends StatefulWidget {
  final int teamId;
  const AddCoachScreen({super.key, required this.teamId});

  @override
  State<AddCoachScreen> createState() => _AddCoachScreenState();
}

class _AddCoachScreenState extends State<AddCoachScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _strategyController = TextEditingController();

  Team? _team;

  @override
  void initState() {
    super.initState();
    _loadTeam();
  }

  Future<void> _loadTeam() async {
    final team = await TeamController.getTeamById(widget.teamId);
    setState(() {
      _team = team;
    });
  }

  Future<void> _saveCoach() async {
    if (_formKey.currentState!.validate() && _team != null) {
      final coach = Coach(
        name: _nameController.text.trim(),
        age: int.parse(_ageController.text.trim()),
        strategy: _strategyController.text.trim(),
        teamId: _team!.id!,
      );

      await CoachController.insertCoach(coach);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Entrenador creado con éxito')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _team == null
              ? 'Cargando...'
              : 'Crear Entrenador para ${_team!.name}',
        ),
      ),
      body:
          _team == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Text(
                        'Equipo: ${_team!.name}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _nameController,
                        decoration: AppTheme.textFieldDecoration(
                          hintText: 'Nombre del Entrenador',
                          icon: Icons.person,
                        ),
                        validator:
                            (val) =>
                                val == null || val.isEmpty
                                    ? 'Este campo es obligatorio'
                                    : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _ageController,
                        decoration: AppTheme.textFieldDecoration(
                          hintText: 'Edad',
                          icon: Icons.cake,
                        ),
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          if (int.tryParse(val) == null) {
                            return 'Debe ser un número válido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _strategyController,
                        decoration: AppTheme.textFieldDecoration(
                          hintText: 'Estrategia',
                          icon: Icons.lightbulb_outline,
                        ),
                        validator:
                            (val) =>
                                val == null || val.isEmpty
                                    ? 'Este campo es obligatorio'
                                    : null,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.save, color: AppTheme.white),
                        label: const Text('Guardar Entrenador'),
                        onPressed: _saveCoach,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
