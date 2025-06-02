import '../db/database.dart';
import '../models/coach_model.dart';

class CoachController {
  // Insertar entrenador
  static Future<int> insertCoach(Coach coach) async {
    final db = await DBHelper.database;
    return await db.insert('coaches', coach.toMap());
  }

  // Obtener entrenador de un equipo
  static Future<Coach?> getCoachByTeam(int teamId) async {
    final db = await DBHelper.database;
    final result = await db.query('coaches', where: 'team_id = ?', whereArgs: [teamId]);
    if (result.isNotEmpty) {
      return Coach.fromMap(result.first);
    }
    return null;
  }
}
