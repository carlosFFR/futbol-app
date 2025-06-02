import 'package:app_futbol/widgets/card_players.dart';
import 'package:flutter/material.dart';
import '../../controllers/player_controller.dart';
import '../../models/player_model.dart';

class PlayerListScreen extends StatefulWidget {
  final int teamId;

  const PlayerListScreen({super.key, required this.teamId});

  @override
  State<PlayerListScreen> createState() => _PlayerListScreenState();
}

class _PlayerListScreenState extends State<PlayerListScreen> {
  late List<Player> players;
  late List<Player> filteredPlayers;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    players = [];
    filteredPlayers = [];
    _loadPlayers();
    _searchController.addListener(_filterPlayers);
  }

  Future<void> _loadPlayers() async {
    final result = await PlayerController.getPlayersByTeam(widget.teamId);
    setState(() {
      players = result;
      filteredPlayers = result;
    });
  }

  void _filterPlayers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredPlayers =
          players.where((p) {
            return p.position.toLowerCase().contains(query);
          }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jugadores del equipo')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar por posición',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          Expanded(
            child:
                filteredPlayers.isEmpty
                    ? const Center(child: Text('No se encontraron jugadores'))
                    : GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 7,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 3 / 4,
                          ),
                      itemCount: filteredPlayers.length,
                      itemBuilder:
                          (context, index) =>
                              PlayerCard(player: filteredPlayers[index]),
                    ),
          ),
        ],
      ),
    );
  }
}
