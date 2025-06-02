import 'package:app_futbol/screens/team/team_detail_screen.dart';
import 'package:app_futbol/screens/team/team_options_screen.dart';
import 'package:flutter/material.dart';

// Importa tus pantallas aquí
import '../screens/home_page_screen.dart';
import '../screens/team/team_list_screen.dart';
import '../screens/team/create_team_screen.dart';
import '../screens/player/player_list_screen.dart';
import '../screens/player/create_player_screen.dart';
import '../screens/coach/create_coach_screen.dart';
import '../screens/match/match_simulation_screen.dart';
import '../screens/ranking/ranking_screen.dart';

class AppRoutes {
  // Nombres de rutas
  static const String home = '/';
  static const String teamList = '/teams';
  static const String addTeam = '/teams/add';
  static const String teamOptions = '/team/options';
  static const String teamDetails = '/team/details';
  static const String playerList = '/players';
  static const String addPlayer = '/players/add';
  static const String addCoach = '/coach/add';
  static const String simulateMatch = '/match/simulate';
  static const String ranking = '/ranking';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case teamList:
        return MaterialPageRoute(builder: (_) => const TeamListScreen());

      case addTeam:
        return MaterialPageRoute(builder: (_) => const AddTeamScreen());

      case teamOptions:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => TeamOptionsScreen(
                teamId: args['teamId'],
                teamName: args['teamName'],
              ),
        );

      case playerList:
        final int teamId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => PlayerListScreen(teamId: teamId),
        );
      case teamDetails:
        final int teamId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => TeamDetailScreen(teamId: teamId),
        );

      case addPlayer:
        final int teamId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => AddPlayerScreen(teamId: teamId),
        );

      case addCoach:
        final int teamId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => AddCoachScreen(teamId: teamId),
        );

      case simulateMatch:
        return MaterialPageRoute(builder: (_) => const SimulateMatchScreen());

      case ranking:
        return MaterialPageRoute(builder: (_) => const RankingScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('Ruta no encontrada: ${settings.name}'),
                ),
              ),
        );
    }
  }
}


