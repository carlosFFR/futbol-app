import 'dart:io';

import 'package:flutter/material.dart';
import '../../controllers/team_controller.dart';
import '../../models/team_model.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  late Future<List<Team>> _teamsFuture;

  @override
  void initState() {
    super.initState();
    _teamsFuture = TeamController.getTopWinners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking de Equipos'),
      ),
      body: FutureBuilder<List<Team>>(
        future: _teamsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final teams = snapshot.data ?? [];

          if (teams.isEmpty) {
            return const Center(child: Text('No hay equipos para mostrar.'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: teams.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final team = teams[index];
              return ListTile(
                leading: CircleAvatar(
                   backgroundImage:
                                      team.image != null
                                          ? FileImage(File(team.image!))
                                          : null,
                  child: team.image == null ? const Icon(Icons.sports_soccer) : null,
                ),
                title: Text(team.name),
                trailing: Text(
                  '${team.wins} victorias',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Posición: ${index + 1}'),
              );
            },
          );
        },
      ),
    );
  }
}
