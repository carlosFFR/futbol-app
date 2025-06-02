import 'package:app_futbol/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../controllers/player_controller.dart';
import '../../controllers/team_controller.dart';
import '../../models/player_model.dart';
import '../../models/team_model.dart';

class AddPlayerScreen extends StatefulWidget {
  final int teamId;

  const AddPlayerScreen({super.key, required this.teamId});

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _shirtNumberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

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

  Future<void> _savePlayer() async {
    if (_formKey.currentState!.validate() && _team != null) {
      final player = Player(
        name: _nameController.text.trim(),
        position: _positionController.text.trim(),
        shirtNumber: int.parse(_shirtNumberController.text.trim()),
        age: int.parse(_ageController.text.trim()),
        teamId: _team!.id!,
      );

      await PlayerController.insertPlayer(player);

      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Jugador creado con éxito')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear Nuevo Jugador')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            _team == null
                ? const Center(child: CircularProgressIndicator())
                : Form(
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
                          hintText: 'Nombre del Jugador',
                          icon: Icons.person_outline,
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _positionController,
                        decoration: AppTheme.textFieldDecoration(
                          hintText: 'Posición',
                          icon: Icons.sports_soccer,
                        ),
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Este campo es obligatorio';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _shirtNumberController,
                        decoration: AppTheme.textFieldDecoration(
                          hintText: 'Número de Camiseta',
                          icon: Icons.confirmation_number_outlined,
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
                        controller: _ageController,
                        decoration: AppTheme.textFieldDecoration(
                          hintText: 'Edad',
                          icon: Icons.calendar_today_outlined,
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
                      const SizedBox(height: 30),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.save, color: AppTheme.white),

                        label: const Text('Guardar Jugador'),
                        onPressed: _savePlayer,
                        style: AppTheme.elevatedButtonStyle,
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
