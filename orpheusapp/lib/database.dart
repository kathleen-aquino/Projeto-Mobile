import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;

class DatabaseHelper {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), "orpheus.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("""
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT
          );
        """);
      },
    );
  }

  static Future<int> registerUser(String username, String password) async {
    final db = await database;

    return await db.insert(
      "users",
      {
        "username": username,
        "password": password,
      },
    );
  }

  static Future<Map<String, dynamic>?> loginUser(
      String username, String password) async {
    final db = await database;

    final result = await db.query(
      "users",
      where: "username = ? AND password = ?",
      whereArgs: [username, password],
    );

    return result.isNotEmpty ? result.first : null;
  }

  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;
    return await db.query("users");
  }
}
