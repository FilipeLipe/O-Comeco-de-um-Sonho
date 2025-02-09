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

  Future<int?> insert(Foto foto) async {
    Database? db = await instance.database;
    return await db?.insert(table, foto.toJson());
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
    return await db?.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<List<Foto>?> queryAll() async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(table);
    return result?.map((row) => Foto.fromJson(row)).toList();
  }

  Future<List<Foto>?> buscarFotosPorConquista(int idConquista) async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      where: 'idConquista = ?',
      whereArgs: [idConquista],
    );
    return result?.map((row) => Foto.fromJson(row)).toList();
  }

  Future<List<Foto>?> buscarFotosPorMemorias(int idMemorias) async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      where: 'idMemorias = ?',
      whereArgs: [idMemorias],
    );
    return result?.map((row) => Foto.fromJson(row)).toList();
  }

  Future<List<Foto>?> buscarFotosPorDestinos(int idDestinos) async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      where: 'idDestinos = ?',
      whereArgs: [idDestinos],
    );
    return result?.map((row) => Foto.fromJson(row)).toList();
  }

  Future<List<Foto>?> buscarFotosPorInfoCasal(int idInfoCasal) async {
    Database? db = await instance.database;
    final List<Map<String, dynamic>>? result = await db?.query(
      table,
      where: 'idInfoCasal = ?',
      whereArgs: [idInfoCasal],
    );
    return result?.map((row) => Foto.fromJson(row)).toList();
  }

  Future<int?> deleteAll() async {
    Database? db = await instance.database;
    return await db?.delete(table);
  }
}
