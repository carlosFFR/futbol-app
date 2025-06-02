import 'dart:math';
import '../db/database.dart';
import '../models/match_model.dart';
import './team_controller.dart';

class MatchController {
  // Simular partido entre dos equipos
  static Future<int?> simulateMatch(int teamAId, int teamBId) async {
  final db = await DBHelper.database;

  // Random para elegir ganador o empate
  final rand = Random();
  final outcome = rand.nextInt(3); // 0 = teamA gana, 1 = teamB gana, 2 = empate

  int? winnerId;
  if (outcome == 0) {
    winnerId = teamAId;
    await TeamController.increaseWins(teamAId);
  } else if (outcome == 1) {
    winnerId = teamBId;
    await TeamController.increaseWins(teamBId);
  } else {
    winnerId = null; // empate, no se aumenta victoria
  }

  await db.insert('matches', {
    'team_a_id': teamAId,
    'team_b_id': teamBId,
    'winner_id': winnerId,
    'match_date': DateTime.now().toIso8601String(),
  });

  return winnerId;
}

  // Obtener historial de partidos
  static Future<List<Match>> getAllMatches() async {
    final db = await DBHelper.database;
    final result = await db.query('matches', orderBy: 'match_date DESC');
    return result.map((e) => Match.fromMap(e)).toList();
  }
}
