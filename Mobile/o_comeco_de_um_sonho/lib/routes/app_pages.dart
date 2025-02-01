// lib/routes/app_pages.dart

import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/modules/mapa/mapa_binding.dart';
import 'package:o_comeco_de_um_sonho/modules/mapa/mapa_page.dart';

import '../modules/calendario/calendario_page.dart';
import '../modules/conquistas/conquistas_page.dart';
import '../modules/destinos/destinos_page.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/info_casal/info_casal_page.dart';
import '../modules/introducao/introducao_binding.dart';
import '../modules/introducao/introducao_page.dart';
import '../modules/memorias/memorias_page.dart';
import 'app_routes.dart';
class AppPages {
  static final routes = [
    GetPage(name: Routes.INTRODUCAO, page: () => IntroducaoPage(), binding: HomeBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.MEMORIAS, page: () => MemoriasPage(), binding: HomeBinding()),
    GetPage(name: Routes.CONQUISTAS, page: () => ConquistasPage(), binding: HomeBinding()),
    GetPage(name: Routes.DESTINOS, page: () => DestinosPage(), binding: HomeBinding()),
    GetPage(name: Routes.CALENDARIO, page: () => CalendarioPage(), binding: HomeBinding()),
    GetPage(name: Routes.INFO_CASAL, page: () => InfoCasalPage(), binding: HomeBinding()),
    GetPage(name: Routes.MAPA, page: () => MapaPage(), binding: MapaBinding()),
  ];
}
