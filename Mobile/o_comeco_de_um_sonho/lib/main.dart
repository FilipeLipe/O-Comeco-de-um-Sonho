// lib/main.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/routes/app_pages.dart';
import 'package:o_comeco_de_um_sonho/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helper/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool introducaoCompleted = prefs.getBool('introducaoCompleted') ?? false;

  initDatabase();

  runApp(MyApp(introducaoCompleted: introducaoCompleted));
}

Future<void> initDatabase() async {
  final dbHelper = DatabaseHelper.instance;
  await dbHelper.database;
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
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Fundo padrão das telas do aplicativo
        dialogBackgroundColor: Colors.white, // Fundo dos diálogos
        canvasColor: Colors.white, // Fundo de menus e drawers
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal, // Define a cor primária do tema
        ).copyWith(
          surface: Colors.white, // Define fundo de cartões e superfícies
          background: Colors.white, // Fundo geral do aplicativo
        ),
      ),
      initialRoute: introducaoCompleted ? Routes.HOME : Routes.INTRODUCAO,
      getPages: AppPages.routes,
    );
  }
}