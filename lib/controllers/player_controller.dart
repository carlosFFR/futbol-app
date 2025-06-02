import '../db/database.dart';
import '../models/player_model.dart';

class PlayerController {
  // Insertar jugador
  static Future<int> insertPlayer(Player player) async {
    final db = await DBHelper.database;
    return await db.insert('players', player.toMap());
  }

  // Obtener jugadores de un equipo
  static Future<List<Player>> getPlayersByTeam(int teamId) async {
    final db = await DBHelper.database;
    final result = await db.query('players', where: 'team_id = ?', whereArgs: [teamId]);
    return result.map((e) => Player.fromMap(e)).toList();
  }

  // Buscar jugadores por posición
  static Future<List<Player>> getPlayersByPosition(String position) async {
    final db = await DBHelper.database;
    final result = await db.query('players', where: 'position = ?', whereArgs: [position]);
    return result.map((e) => Player.fromMap(e)).toList();
  }
}
