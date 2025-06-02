import 'package:flutter/material.dart';
import '../models/player_model.dart';
import '../theme/app_theme.dart'; // Asegúrate de tener este archivo con tus colores personalizados

class PlayerCard extends StatelessWidget {
  final Player player;

  const PlayerCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: AppTheme.green,
              child: Text(
                player.name.isNotEmpty ? player.name[0].toUpperCase() : '?',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.white,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              player.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              player.position,
              style: TextStyle(color: Colors.grey[700]),
              maxLines: 1,
            ),
            Text(
              'Camiseta: ${player.shirtNumber}',
              style: TextStyle(color: Colors.grey[700]),
              maxLines: 1,
            ),
            Text(
              'Edad: ${player.age}',
              style: TextStyle(color: Colors.grey[700]),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
