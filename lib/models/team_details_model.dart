import '../models/team_model.dart';
import '../models/coach_model.dart';
import '../models/player_model.dart';

class TeamDetails {
  final Team team;
  final Coach coach;
  final List<Player> players;

  TeamDetails({
    required this.team,
    required this.coach,
    required this.players,
  });
}
