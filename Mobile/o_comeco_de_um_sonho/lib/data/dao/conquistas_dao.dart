import 'package:sqflite/sqflite.dart';
import '../../helper/database_helper.dart';
import '../models/conquistas.dart';

class ConquistasDao {
  static final table = 'tb_conquistas';
  static final columnId = 'id';

  ConquistasDao._privateConstructor();
  static final ConquistasDao instance = ConquistasDao._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    final dbHelper = DatabaseHelper.instance;
    _database = await dbHelper.database;
    return _database;
  }

  Future<int?> insertOrUpdate(Conquistas conquista) async {
    try {
      if (conquista.id == null) {
        return await insert(conquista);
      }
      var existing = await findById(conquista.id!);
      if (existing == null) {
        return await insert(conquista);
      } else {
        return await update(conquista);
      }
    } catch (ex) {
      print("Erro em insertOrUpdate: $ex");
      return null;
    }
  }

  Future<int?> insert(Conquistas conquista) async {
    Database? db = await instance.database;
    return await db?.insert(table, conquista.toMap());
  }

  Future<void> insertList(List<Conquistas> conquistas) async {
    Database? db = await instance.database;
    Batch batch = db!.batch();
    for (var conquista in conquistas) {
      batch.insert(table, conquista.toMap());
    }
    await batch.commit(noResult: true);
  }

  Future<List<Conquistas>?> queryAllRows() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      orderBy: "titulo ASC",
    );
    return result?.map((row) => Conquistas.fromMap(row)).toList();
  }

  Future<Conquistas?> findById(int id) async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return (result != null && result.isNotEmpty) ? Conquistas.fromMap(result.first) : null;
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(result!);
  }

  Future<int?> update(Conquistas conquista) async {
    Database? db = await instance.database;
    return await db?.update(
      table,
      conquista.toMap(),
      where: '$columnId = ?',
      whereArgs: [conquista.id],
    );
  }

  Future<int?> delete(int id) async {
    Database? db = await instance.database;
    return await db?.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int?> deleteAll() async {
    Database? db = await instance.database;
    return await db?.delete(table);
  }
}
