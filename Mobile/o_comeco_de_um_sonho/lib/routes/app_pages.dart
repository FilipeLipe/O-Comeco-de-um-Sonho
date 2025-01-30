// lib/routes/app_pages.dart

import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/introducao/introducao_binding.dart';
import '../modules/introducao/introducao_page.dart';
import 'app_routes.dart';
class AppPages {
  static final routes = [

    GetPage(
      name: Routes.INTRODUCAO,
      page: () => IntroducaoPage(),
      binding: IntroducaoBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
