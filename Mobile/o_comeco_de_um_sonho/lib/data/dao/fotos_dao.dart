import 'package:sqflite/sqflite.dart';
import '../../helper/database_helper.dart';
import '../models/Foto.dart';

class FotosDao {
  static final table = 'tb_fotos';
  static final columnId = 'id';

  FotosDao._privateConstructor();
  static final FotosDao instance = FotosDao._privateConstructor();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    final dbHelper = DatabaseHelper.instance;
    _database = await dbHelper.database;
    return _database;
  }

  Future<int?> insertOrUpdate(Foto foto) async {
    try {
      var existing = await findById(foto.id!);
      if (existing == null) {
        return await insert(foto);
      } else {
        return await update(foto);
      }
    } catch (ex) {
      print(ex);
      return null;
    }
  }

  Future<int?> insert(Foto foto) async {
    Database? db = await instance.database;
    return await db?.insert(table, foto.toJson());
  }

  Future<void> insertList(List<Foto> fotos) async {
    Database? db = await instance.database;
    Batch batch = db!.batch();
    for (var foto in fotos) {
      batch.insert(table, foto.toJson());
    }
    await batch.commit(noResult: true);
  }

  Future<List<Foto>?> queryAllRows() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      orderBy: "descricao ASC",
    );
    return result?.map((row) => Foto.fromJson(row)).toList();
  }

  Future<Foto?> findById(int id) async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return result != null && result.isNotEmpty ? Foto.fromJson(result.first) : null;
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(result!);
  }

  Future<int?> update(Foto foto) async {
    Database? db = await instance.database;
    return await db?.update(
      table,
      foto.toJson(),
      where: '$columnId = ?',
      whereArgs: [foto.id],
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
