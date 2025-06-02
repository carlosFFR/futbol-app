import 'dart:io';

import 'package:app_futbol/routes/routes.dart';
import 'package:flutter/material.dart';
import '../../controllers/team_controller.dart';
import '../../models/team_model.dart';
import 'create_team_screen.dart';
import '../../theme/app_theme.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({super.key});

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  List<Team> _teams = [];

  @override
  void initState() {
    super.initState();
    _loadTeams();
  }

  Future<void> _loadTeams() async {
    final teams = await TeamController.getAllTeams();
    setState(() {
      _teams = teams;
    });
  }

  void _goToCreateTeam() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddTeamScreen()),
    );
    _loadTeams(); // recargar lista
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Equipos', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botón moderno para añadir equipo
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: _goToCreateTeam,
                  icon: const Icon(Icons.add, size: 20, color: Colors.white),
                  label: const Text('Nuevo Equipo'),
                  style: AppTheme.elevatedButtonStyle.copyWith(
                    backgroundColor: WidgetStateProperty.all(AppTheme.green),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Equipos Registrados',
                style: AppTheme.textTitle.copyWith(color: AppTheme.white),
              ),
              const SizedBox(height: 16),
              Expanded(
                child:
                    _teams.isEmpty
                        ? const Center(
                          child: Text(
                            'No hay equipos registrados.',
                            style: TextStyle(color: Colors.white70),
                          ),
                        )
                        : ListView.builder(
                          itemCount: _teams.length,
                          itemBuilder: (context, index) {
                            final team = _teams[index];
                            return Card(
                              color: Colors.white10,
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: AppTheme.green,
                                  backgroundImage:
                                      team.image != null
                                          ? FileImage(File(team.image!))
                                          : null,
                                  child:
                                      team.image == null
                                          ? const Icon(
                                            Icons.shield,
                                            color: Colors.white,
                                          )
                                          : null,
                                ),
                                title: Text(
                                  team.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  'Victorias: ${team.wins}',
                                  style: const TextStyle(color: Colors.white70),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white70,
                                  size: 18,
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.teamOptions,
                                    arguments: {
                                      'teamId': team.id,
                                      'teamName': team.name,
                                    },
                                  );
                                },
                              ),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
