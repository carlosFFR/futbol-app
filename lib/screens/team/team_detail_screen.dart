import 'dart:io';

import 'package:app_futbol/widgets/card_players.dart';
import 'package:flutter/material.dart';
import '../../controllers/team_controller.dart';
import '../../models/player_model.dart';
import '../../models/coach_model.dart';
import '../../models/team_model.dart';
import '../../theme/app_theme.dart'; // Asegúrate de tener AppTheme definido

class TeamDetailScreen extends StatefulWidget {
  final int teamId;

  const TeamDetailScreen({super.key, required this.teamId});

  @override
  State<TeamDetailScreen> createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
  Team? team;
  Coach? coach;
  List<Player> players = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTeamData();
  }

  Future<void> _loadTeamData() async {
    final fullData = await TeamController.getFullTeamDetails(widget.teamId);
    if (fullData != null) {
      setState(() {
        team = fullData.team;
        coach = fullData.coach;
        players = fullData.players;
        isLoading = false;
      });
    }
  }

  Widget _buildCoachCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppTheme.green.withValues(alpha: 0.2),

      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: 48,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Entrenador:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Nombre: ', style: const TextStyle(fontSize: 16)),
            Text(' ${coach!.name}', style: const TextStyle(fontSize: 15)),
            Text('Edad: ${coach!.age}', style: const TextStyle(fontSize: 16)),
            Text(
              'Estrategia: ${coach!.strategy}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppTheme.green.withValues(alpha: 0.2),

      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              team!.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (team!.image != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(team!.image!),
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del equipo')),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildTeamCard()),
                          const SizedBox(width: 12), // Espacio entre cards
                          Expanded(child: _buildCoachCard()),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Jugadores:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: players.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 4,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemBuilder: (context, index) {
                          final player = players[index];
                          return PlayerCard(player: player);
                        },
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
