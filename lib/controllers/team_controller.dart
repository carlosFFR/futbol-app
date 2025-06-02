import '../db/database.dart';
import '../models/team_model.dart';
import '../models/coach_model.dart';
import '../models/player_model.dart';
import '../models/team_details_model.dart';

class TeamController {
  // Insertar equipo
  static Future<int> insertTeam(Team team) async {
    final db = await DBHelper.database;
    return await db.insert('teams', team.toMap());
  }

  // Obtener todos los equipos
  static Future<List<Team>> getAllTeams() async {
    final db = await DBHelper.database;
    final result = await db.query('teams');
    return result.map((e) => Team.fromMap(e)).toList();
  }

  // Obtener equipo por ID
  static Future<Team?> getTeamById(int id) async {
    final db = await DBHelper.database;
    final result = await db.query('teams', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return Team.fromMap(result.first);
    }
    return null;
  }

  // Aumentar victorias
  static Future<void> increaseWins(int teamId) async {
    final db = await DBHelper.database;
    await db.rawUpdate('UPDATE teams SET wins = wins + 1 WHERE id = ?', [teamId]);
  }

  // Obtener equipos con más victorias (ordenados)
  static Future<List<Team>> getTopWinners() async {
    final db = await DBHelper.database;
    final result = await db.query('teams', orderBy: 'wins DESC');
    return result.map((e) => Team.fromMap(e)).toList();
  }
  static Future<TeamDetails?> getFullTeamDetails(int teamId) async {
    final db = await DBHelper.database;

    // Obtener datos del equipo
    final teamResult = await db.query('teams', where: 'id = ?', whereArgs: [teamId]);
    if (teamResult.isEmpty) return null;
    final team = Team.fromMap(teamResult.first);

    // Obtener el entrenador
    final coachResult = await db.query('coaches', where: 'team_id = ?', whereArgs: [teamId]);
    if (coachResult.isEmpty) return null;
    final coach = Coach.fromMap(coachResult.first);

    // Obtener jugadores
    final playersResult = await db.query('players', where: 'team_id = ?', whereArgs: [teamId]);
    final players = playersResult.map((e) => Player.fromMap(e)).toList();

    return TeamDetails(team: team, coach: coach, players: players);
  }
}
