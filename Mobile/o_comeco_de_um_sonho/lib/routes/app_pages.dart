// lib/routes/app_pages.dart

import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/modules/calendario/calendario_binding.dart';
import 'package:o_comeco_de_um_sonho/modules/conquistas/add_conquista/add_conquista_binding.dart';
import 'package:o_comeco_de_um_sonho/modules/conquistas/add_conquista/add_conquista_page.dart';
import 'package:o_comeco_de_um_sonho/modules/conquistas/detalhe_conquista/detalhe_conquista_binding.dart';
import 'package:o_comeco_de_um_sonho/modules/conquistas/detalhe_conquista/detalhe_conquista_page.dart';
import 'package:o_comeco_de_um_sonho/modules/destinos/destinos_binding.dart';
import 'package:o_comeco_de_um_sonho/modules/info_casal/info_casal_binding.dart';
import 'package:o_comeco_de_um_sonho/modules/mapa/mapa_binding.dart';
import 'package:o_comeco_de_um_sonho/modules/mapa/mapa_page.dart';
import 'package:o_comeco_de_um_sonho/modules/memorias/memorias_binding.dart';

import '../modules/calendario/calendario_page.dart';
import '../modules/conquistas/conquistas_binding.dart';
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
    GetPage(name: Routes.INTRODUCAO, page: () => IntroducaoPage(), binding: IntroducaoBinding()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.MEMORIAS, page: () => MemoriasPage(), binding: MemoriasBinding()),
    GetPage(name: Routes.CONQUISTAS, page: () => ConquistasPage(), binding: ConquistasBinding()),
    GetPage(name: Routes.DESTINOS, page: () => DestinosPage(), binding: DestinosBinding()),
    GetPage(name: Routes.CALENDARIO, page: () => CalendarioPage(), binding: CalendarioioBinding()),
    GetPage(name: Routes.INFO_CASAL, page: () => InfoCasalPage(), binding: InfoCasalBinding()),
    GetPage(name: Routes.MAPA, page: () => MapaPage(), binding: MapaBinding()),
    GetPage(name: Routes.ADD_CONQUISTA, page: () => AddConquistaPage(), binding: AddConquistaBinding()),
    GetPage(name: Routes.DETALHE_CONQUISTA, page: () => DetalheConquistaPage(), binding: DetalheConquistaBinding()),
  ];
}
