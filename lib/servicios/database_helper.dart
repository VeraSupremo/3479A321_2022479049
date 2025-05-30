import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../entidades/actividad.dart'; 

class DatabaseHelper {
static final DatabaseHelper _instance = DatabaseHelper._internal();
static Database? _database;
factory DatabaseHelper() {
  return _instance;
}
DatabaseHelper._internal();
 Future<void> initializeDatabase() async {
 await database;
}
Future<Database> get database async {
 if (_database != null) return _database!;
 _database = await _initDatabase();
 return _database!;
}
Future<Database> _initDatabase() async{ 
 final dbPath = await getDatabasesPath();
 final path = join(dbPath, 'activity_database.db');
 return await openDatabase(
 path,
 version: 1,
 onCreate: _onCreate,
 );
}


//-----------creasion de la tabla de la base de datos-------------
Future<void> _onCreate(Database db, int version) async {
  await db.execute('''
  CREATE TABLE [nombre_tabla] (
  [nombrecolumna] INTEGER PRIMARY KEY,
  [nombrecolumna] TEXT NOT NULL,
  [nombrecolumna] TEXT NOT NULL
  )
  ''');
  }

//-------------------métodos para insertar, actualizar, eliminar y consultar datos-------------------
Future<void> insertActivity(Actividad actividad) async {
 final db = await database;
 await db.insert(
 'activities',
 actividad.toMap(),
 conflictAlgorithm: ConflictAlgorithm.replace,
 );
}


}
