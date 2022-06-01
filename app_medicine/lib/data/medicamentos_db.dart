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

  Future<int> deleteMedicamento(Medicamento medicamento) async {
		var db = await instance.database;
    String nome = medicamento.nome;
    String descricao = medicamento.descricao;
    String tempo = medicamento.tempo;
    String data = medicamento.data;
		int result = await db.rawDelete('DELETE FROM medicamentos WHERE nome = \'$nome\' AND descricao = \'$descricao\' AND tempo = \'$tempo\' AND data = \'$data\'');
		return result;
	}

  Future<int> updateMedicamento(Medicamento novoMedicamento, Medicamento medicamento) async {
		var db = await instance.database;

		int result = await db.rawUpdate('''UPDATE medicamentos
    SET nome = \'${novoMedicamento.nome}\',
    descricao = \'${novoMedicamento.descricao}\',
    quantidade = ${novoMedicamento.quantidade},
    frequencia = ${novoMedicamento.frequencia},
    tempo = \'${novoMedicamento.tempo}\', 
    data = \'${novoMedicamento.data}\',
    valueQ = \'${novoMedicamento.valueQ}\',
    valueF = \'${novoMedicamento.valueF}\',
    tipo = \'${novoMedicamento.tipo}\' 
    WHERE nome = \'${medicamento.nome}\' AND
    descricao = \'${medicamento.descricao}\' AND
    tempo = \'${medicamento. tempo }\' AND
    data = \'${medicamento.data}\' ''');
		return result;
	}

  Future<List<Medicamento>> getMedicamentos() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query('medicamentos');

    return List.generate(maps.length, (i) {
      return Medicamento(
        maps[i]['nome'],
        maps[i]['descricao'],
        maps[i]['quantidade'],
        maps[i]['frequencia'],
        maps[i]['tempo'],
        maps[i]['data'],
        maps[i]['valueQ'],
        maps[i]['valueF'],
        maps[i]['tipo'],
      );
    });
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
