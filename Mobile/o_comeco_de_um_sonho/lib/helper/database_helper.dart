import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "o_comeco_de_um_sonho_sqlite.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database ?_database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  static _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onUpgrade: _onUpgrade,
        onCreate: _onCreate);
  }

  static Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS tb_fotos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        foto BLOB,
        descricao TEXT,
        dataCaptura TEXT,
        idConquista INTEGER,
        idDestino INTEGER,
        idInfoCasal INTEGER,
        idMemoria INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS tb_memorias(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        data TEXT NOT NULL,
        descricao TEXT,
        imagePath TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS tb_conquistas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        descricao TEXT,
        ativo INTEGER NOT NULL,
        imagem TEXT,
        dataConquista TEXT,
        local TEXT,
        experienciaDela TEXT,
        experienciaDele TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS tb_destinos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL,
        descricao TEXT,
        latitude REAL NOT NULL,
        longitude REAL NOT NULL,
        imagePath TEXT,
        visitado INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS tb_calendarioio(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        data TEXT NOT NULL,
        descricao TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS tb_info_casal(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        dataInicio TEXT NOT NULL,
        textoCasal TEXT
      )
    ''');
  }

  static Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    switch (oldVersion) {
      case 1:
        // await db.execute("CREATE TABLE IF NOT EXISTS tb_configuracao_unidade (ID_CONFIGURACAO INTEGER NOT NULL PRIMARY KEY, ID_UNIDADE INTEGER NOT NULL, PES_ID INTEGER NOT NULL, FL_RASTREAMENTO_TABLET TEXT(1) NULL )");
        // continue case7;

    }
  }
}