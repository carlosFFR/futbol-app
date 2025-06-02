import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    // Aquí chequeamos e insertamos datos si es necesario:
    await _insertPlayersIfNeeded(_db!);
    return _db!;
  }

  static Future<Database> initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'football_manager.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE teams (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          image_path TEXT,
          wins INTEGER DEFAULT 0
        )
      ''');

      await db.execute('''
        CREATE TABLE coaches (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          age INTEGER,
          strategy TEXT,
          team_id INTEGER NOT NULL,
          FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE
        )
      ''');

      await db.execute('''
        CREATE TABLE players (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          position TEXT NOT NULL,
          shirt_number INTEGER,
          age INTEGER,
          team_id INTEGER NOT NULL,
          FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE CASCADE
        )
      ''');

      await db.execute('''
        CREATE TABLE matches (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          team_a_id INTEGER NOT NULL,
          team_b_id INTEGER NOT NULL,
          winner_id INTEGER NOT NULL,
          match_date TEXT DEFAULT CURRENT_TIMESTAMP,
          FOREIGN KEY (team_a_id) REFERENCES teams(id),
          FOREIGN KEY (team_b_id) REFERENCES teams(id),
          FOREIGN KEY (winner_id) REFERENCES teams(id)
        )
      ''');
    });
  }

  // Función para insertar datos iniciales solo si no existen
  static Future<void> _insertPlayersIfNeeded(Database db) async {
  final countPlayers = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM players')) ?? 0;

    // Si no hay equipos, insertamos equipos y jugadores iniciales
    if (countPlayers == 0) {
    // Insertar jugadores para el equipo con id = 1 (Barcelona)
    await db.insert('players', {'name': 'Marc-André ter Stegen', 'position': 'Portero', 'shirt_number': 1, 'age': 32, 'team_id': 1});
    await db.insert('players', {'name': 'Ronald Araújo', 'position': 'Defensa', 'shirt_number': 4, 'age': 25, 'team_id': 1});
    await db.insert('players', {'name': 'Jules Koundé', 'position': 'Defensa', 'shirt_number': 23, 'age': 25, 'team_id': 1});
    await db.insert('players', {'name': 'João Cancelo', 'position': 'Defensa', 'shirt_number': 2, 'age': 30, 'team_id': 1});
    await db.insert('players', {'name': 'Frenkie de Jong', 'position': 'Centrocampista', 'shirt_number': 21, 'age': 27, 'team_id': 1});
    await db.insert('players', {'name': 'Gavi', 'position': 'Centrocampista', 'shirt_number': 6, 'age': 20, 'team_id': 1});
    await db.insert('players', {'name': 'Pedri', 'position': 'Centrocampista', 'shirt_number': 8, 'age': 22, 'team_id': 1});
    await db.insert('players', {'name': 'Robert Lewandowski', 'position': 'Delantero', 'shirt_number': 9, 'age': 35, 'team_id': 1});
    await db.insert('players', {'name': 'Raphinha', 'position': 'Delantero', 'shirt_number': 11, 'age': 28, 'team_id': 1});
    await db.insert('players', {'name': 'João Félix', 'position': 'Delantero', 'shirt_number': 14, 'age': 25, 'team_id': 1});
    await db.insert('players', {'name': 'Ilkay Gündogan', 'position': 'Centrocampista', 'shirt_number': 22, 'age': 33, 'team_id': 1});

    // Insertar jugadores para el equipo con id = 2 (Real Madrid)
    await db.insert('players', {'name': 'Thibaut Courtois', 'position': 'Portero', 'shirt_number': 1, 'age': 33, 'team_id': 2});
    await db.insert('players', {'name': 'Éder Militão', 'position': 'Defensa', 'shirt_number': 3, 'age': 26, 'team_id': 2});
    await db.insert('players', {'name': 'David Alaba', 'position': 'Defensa', 'shirt_number': 4, 'age': 31, 'team_id': 2});
    await db.insert('players', {'name': 'Antonio Rüdiger', 'position': 'Defensa', 'shirt_number': 22, 'age': 31, 'team_id': 2});
    await db.insert('players', {'name': 'Aurélien Tchouaméni', 'position': 'Centrocampista', 'shirt_number': 18, 'age': 25, 'team_id': 2});
    await db.insert('players', {'name': 'Federico Valverde', 'position': 'Centrocampista', 'shirt_number': 15, 'age': 26, 'team_id': 2});
    await db.insert('players', {'name': 'Toni Kroos', 'position': 'Centrocampista', 'shirt_number': 8, 'age': 34, 'team_id': 2});
    await db.insert('players', {'name': 'Luka Modrić', 'position': 'Centrocampista', 'shirt_number': 10, 'age': 39, 'team_id': 2});
    await db.insert('players', {'name': 'Jude Bellingham', 'position': 'Centrocampista', 'shirt_number': 5, 'age': 21, 'team_id': 2});
    await db.insert('players', {'name': 'Vinícius Júnior', 'position': 'Delantero', 'shirt_number': 7, 'age': 24, 'team_id': 2});
    await db.insert('players', {'name': 'Rodrygo', 'position': 'Delantero', 'shirt_number': 11, 'age': 24, 'team_id': 2});
  }
  }
}
