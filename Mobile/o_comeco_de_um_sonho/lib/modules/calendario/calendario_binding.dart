// lib/modules/home/calendarioio_binding.dart

import 'package:get/get.dart';
import 'calendario_controller.dart';

class CalendarioioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalendarioController>(() => CalendarioController());
  }
}
