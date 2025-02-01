// lib/modules/home/calendarioio_binding.dart

import 'package:get/get.dart';
import 'mapa_controller.dart';

class MapaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapaController>(() => MapaController());
  }
}
