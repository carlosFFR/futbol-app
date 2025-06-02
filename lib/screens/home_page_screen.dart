import 'package:flutter/material.dart';
import '../routes/routes.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);

    _animation = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: _animation.value,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(184, 68, 67, 67),
                  AppTheme.green,
                ],
              ),
            ),
            child: child,
          );
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gestión de Equipos de Fútbol",
                  style: AppTheme.textTitle.copyWith(color: AppTheme.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                _buildCustomButton(
                  icon: Icons.list,
                  label: 'Listar Equipos',
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.teamList),
                ),
                const SizedBox(height: 20),
                _buildCustomButton(
                  icon: Icons.sports_soccer,
                  label: 'Simular Partido',
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.simulateMatch),
                ),
                const SizedBox(height: 20),
                _buildCustomButton(
                  icon: Icons.emoji_events,
                  label: 'Ver Ranking',
                  onPressed: () => Navigator.pushNamed(context, AppRoutes.ranking),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.white.withValues(alpha: 0.5),
        border: Border.all(color: AppTheme.green.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.green.withValues(alpha: 0.3),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white, size: 28),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(label, style: TextStyle(fontSize: 16)),
        ),
        style: AppTheme.elevatedButtonStyle,
        onPressed: onPressed,
      ),
    );
  }
}
