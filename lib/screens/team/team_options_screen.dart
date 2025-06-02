import 'package:app_futbol/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class TeamOptionsScreen extends StatelessWidget {
  final int teamId;
  final String teamName;

  const TeamOptionsScreen({
    super.key,
    required this.teamId,
    required this.teamName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones - $teamName'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildOptionButton(
              context,
              icon: Icons.group,
              label: 'Ver Jugadores',
              route: AppRoutes.playerList,
            ),
            const SizedBox(height: 16),
            _buildOptionButton(
              context,
              icon: Icons.person_add_alt,
              label: 'Asignar Jugador',
              route: AppRoutes.addPlayer,
            ),
            const SizedBox(height: 16),
            _buildOptionButton(
              context,
              icon: Icons.sports,
              label: 'Asignar Entrenador',
              route: AppRoutes.addCoach,
            ),
            const SizedBox(height: 16),
            _buildOptionButton(
              context,
              icon: Icons.list_alt,
              label: 'Ver Equipo Completo',
              route: AppRoutes.teamDetails,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String route,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route, arguments: teamId);
      },
      style: AppTheme.elevatedButtonStyle,
      child: Row(
        children: [
          Icon(icon, size: 24,color:AppTheme.white),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
