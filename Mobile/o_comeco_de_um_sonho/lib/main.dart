import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/data/models/Conquistas.dart';
import 'package:o_comeco_de_um_sonho/routes/app_pages.dart';
import 'package:o_comeco_de_um_sonho/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'data/dao/conquistas_dao.dart';
import 'helper/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool introducaoCompleted = prefs.getBool('introducaoCompleted') ?? false;

  await initDatabase();
  copiarAssetsParaDiretorioLocal();

  runApp(MyApp(introducaoCompleted: introducaoCompleted));
}

Future<void> initDatabase() async {
  final dbHelper = DatabaseHelper.instance;
  await dbHelper.database;

  await insertDados();
}

class MyApp extends StatelessWidget {
  final bool introducaoCompleted;

  MyApp({required this.introducaoCompleted});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      locale: const Locale('pt', 'BR'),
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal,
        ).copyWith(
          surface: Colors.white,
          background: Colors.white,
        ),
      ),
      initialRoute: introducaoCompleted ? Routes.HOME : Routes.HOME,
      getPages: AppPages.routes,

    );
  }
}


Future<void> insertDados() async {
  await insertConquistas();
}


Future<void> insertConquistas() async {
  final count = await ConquistasDao.instance.queryRowCount();
  if (count == 0) {

    final List<Conquistas> conquistasIniciais = [];

    conquistasIniciais.add(Conquistas(titulo: "Acampar", descricao: "Meta para voar", ativo: false, imagem: "Acampar"));
    conquistasIniciais.add(Conquistas(titulo: "AsaDelta", descricao: "Meta para saltar", ativo: true, imagem: "AsaDelta"));
    conquistasIniciais.add(Conquistas(titulo: "Balao", descricao: "Meta para saltar", ativo: false, imagem: "Balao"));
    conquistasIniciais.add(Conquistas(titulo: "Braunas", descricao: "Meta para voar", ativo: false, imagem: "Braunas"));
    conquistasIniciais.add(Conquistas(titulo: "Caiaque", descricao: "Meta para saltar", ativo: true, imagem: "Caiaque"));
    conquistasIniciais.add(Conquistas(titulo: "CampCross", descricao: "Meta para saltar", ativo: false, imagem: "CampCross"));
    conquistasIniciais.add(Conquistas(titulo: "Contorno", descricao: "Meta para voar", ativo: false, imagem: "Contorno"));
    conquistasIniciais.add(Conquistas(titulo: "Escalada", descricao: "Meta para saltar", ativo: true, imagem: "Escalada"));
    conquistasIniciais.add(Conquistas(titulo: "Estadio", descricao: "Meta para saltar", ativo: false, imagem: "Estadio"));
    conquistasIniciais.add(Conquistas(titulo: "Mergulho", descricao: "Meta para voar", ativo: false, imagem: "Mergulho"));
    conquistasIniciais.add(Conquistas(titulo: "Noivado", descricao: "Meta para saltar", ativo: true, imagem: "Noivado"));
    conquistasIniciais.add(Conquistas(titulo: "NossaCasa", descricao: "Meta para saltar", ativo: false, imagem: "NossaCasa"));
    conquistasIniciais.add(Conquistas(titulo: "Pampulha", descricao: "Meta para voar", ativo: false, imagem: "Pampulha"));
    conquistasIniciais.add(Conquistas(titulo: "Paraquedas", descricao: "Meta para saltar", ativo: true, imagem: "Paraquedas"));
    conquistasIniciais.add(Conquistas(titulo: "Pendulo", descricao: "Meta para saltar", ativo: false, imagem: "Pendulo"));
    conquistasIniciais.add(Conquistas(titulo: "Rapel", descricao: "Meta para voar", ativo: false, imagem: "Rapel"));
    conquistasIniciais.add(Conquistas(titulo: "TrailRun", descricao: "Meta para saltar", ativo: true, imagem: "TrailRun"));
    conquistasIniciais.add(Conquistas(titulo: "Triatlo", descricao: "Meta para saltar", ativo: false, imagem: "Triatlo"));
    conquistasIniciais.add(Conquistas(titulo: "Utv", descricao: "Meta para saltar", ativo: true, imagem: "Utv"));
    conquistasIniciais.add(Conquistas(titulo: "Viajar Moto", descricao: "Meta para saltar", ativo: false, imagem: "ViajarMoto"));


    await ConquistasDao.instance.insertList(conquistasIniciais);
    print("Dados iniciais de conquistas inseridos.");
  } else {
    print("A tabela de conquistas já possui $count registros.");
  }
}


Future<void> copiarAssetsParaDiretorioLocal() async {
  final Directory diretorioApp = await getApplicationDocumentsDirectory();
  final String caminhoPastaLocal = '${diretorioApp.path}/Pin';
  final Directory pastaLocal = Directory(caminhoPastaLocal);

  if (!await pastaLocal.exists()) {
    await pastaLocal.create(recursive: true);
  }

  final String manifestContent = await rootBundle.loadString('AssetManifest.json');
  final Map<String, dynamic> manifestMap = json.decode(manifestContent);

  final List<String> caminhosAssets = manifestMap.keys
      .where((String key) => key.startsWith('assets/Pin/'))
      .toList();

  for (String caminhoAsset in caminhosAssets) {
    final String nomeArquivo = caminhoAsset.split('/').last;

    final ByteData bytes = await rootBundle.load(caminhoAsset);
    final List<int> listaBytes = bytes.buffer.asUint8List();

    final File arquivoLocal = File('$caminhoPastaLocal/$nomeArquivo');
    await arquivoLocal.writeAsBytes(listaBytes, flush: true);
  }
}