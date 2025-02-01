// lib/modules/home/calendarioio_binding.dart

import 'package:get/get.dart';
import 'destinos_controller.dart';

class DestinosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DestinosController>(() => DestinosController());
  }
}
