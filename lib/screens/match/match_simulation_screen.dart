import 'package:flutter/material.dart';
import '../../controllers/match_controller.dart';
import '../../controllers/team_controller.dart';
import '../../models/team_model.dart';

class SimulateMatchScreen extends StatefulWidget {
  const SimulateMatchScreen({super.key});

  @override
  State<SimulateMatchScreen> createState() => _SimulateMatchScreenState();
}

class _SimulateMatchScreenState extends State<SimulateMatchScreen> {
  List<Team> _teams = [];
  Team? _selectedTeamA;
  Team? _selectedTeamB;
  String _resultMessage = '';

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

  Future<void> _simulate() async {
    if (_selectedTeamA == null || _selectedTeamB == null) {
      setState(() {
        _resultMessage = 'Por favor selecciona ambos equipos.';
      });
      return;
    }
    if (_selectedTeamA!.id == _selectedTeamB!.id) {
      setState(() {
        _resultMessage = 'Los equipos deben ser diferentes.';
      });
      return;
    }

    final winnerId = await MatchController.simulateMatch(
        _selectedTeamA!.id!, _selectedTeamB!.id!);

    String result;
    if (winnerId == null) {
      result = 'El partido terminó en empate.';
    } else if (winnerId == _selectedTeamA!.id) {
      result = 'Ganador: ${_selectedTeamA!.name}';
    } else {
      result = 'Ganador: ${_selectedTeamB!.name}';
    }

    setState(() {
      _resultMessage = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simular Partido')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<Team>(
              decoration: const InputDecoration(labelText: 'Equipo A'),
              items: _teams
                  .map((team) => DropdownMenuItem(
                        value: team,
                        child: Text(team.name),
                      ))
                  .toList(),
              value: _selectedTeamA,
              onChanged: (value) => setState(() => _selectedTeamA = value),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<Team>(
              decoration: const InputDecoration(labelText: 'Equipo B'),
              items: _teams
                  .map((team) => DropdownMenuItem(
                        value: team,
                        child: Text(team.name),
                      ))
                  .toList(),
              value: _selectedTeamB,
              onChanged: (value) => setState(() => _selectedTeamB = value),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _simulate,
              child: const Text('Simular Partido'),
            ),
            const SizedBox(height: 30),
            Text(
              _resultMessage,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
