// lib/modules/home/calendarioio_binding.dart

import 'package:get/get.dart';
import 'info_casal_controller.dart';

class InfoCasalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfoCasalController>(() => InfoCasalController());
  }
}
