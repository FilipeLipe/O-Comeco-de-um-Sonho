import 'package:sqflite/sqflite.dart';
import '../../helper/database_helper.dart';
import '../models/destinos.dart';

class DestinosDao {
  static final table = 'tb_destinos';
  static final columnId = 'id';

  DestinosDao._privateConstructor();
  static final DestinosDao instance = DestinosDao._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    final dbHelper = DatabaseHelper.instance;
    _database = await dbHelper.database;
    return _database;
  }

  Future<int?> insertOrUpdate(Destinos destino) async {
    try {
      if (destino.id == null) {
        return await insert(destino);
      }
      var existe = await findById(destino.id!);
      if (existe == null) {
        return await insert(destino);
      } else {
        return await update(destino);
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<int?> insert(Destinos destino) async {
    Database? db = await instance.database;
    return await db?.insert(table, destino.toMap());
  }

  Future<void> insertList(List<Destinos> destinos) async {
    Database? db = await instance.database;
    Batch batch = db!.batch();
    for (var destino in destinos) {
      batch.insert(table, destino.toMap());
    }
    await batch.commit(noResult: true);
  }

  Future<List<Destinos>?> queryAllRows() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      orderBy: "nome ASC",
    );
    return result?.map((row) => Destinos.fromMap(row)).toList();
  }

  Future<Destinos?> findById(int id) async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return result != null && result.isNotEmpty ? Destinos.fromMap(result.first) : null;
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(result!);
  }

  Future<int?> update(Destinos destino) async {
    Database? db = await instance.database;
    return await db?.update(
      table,
      destino.toMap(),
      where: '$columnId = ?',
      whereArgs: [destino.id],
    );
  }

  Future<int?> delete(int id) async {
    Database? db = await instance.database;
    return await db?.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int?> deleteAll() async {
    Database? db = await instance.database;
    return await db?.delete(table);
  }
}
