import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './medicamento.dart';

class MedicamentosDB {
  static final MedicamentosDB instance = MedicamentosDB._init();

  static Database? _database;

  MedicamentosDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('lista_medicamentos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE medicamentos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            descricao TEXT,
            quantidade REAL,
            frequencia INTEGER,
            tempo TEXT,
            data TEXT,
            valueQ TEXT,
            valueF TEXT,
            tipo TEXT)
    ''');
  }

  Future<void> inserirMedicamento(Medicamento medicamento) async {
    final db = await instance.database;
    await db.insert(
      'medicamentos',
      medicamento.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
