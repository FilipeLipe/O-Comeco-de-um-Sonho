import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'destinos_controller.dart';

class DestinosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DestinosController>(() => DestinosController());
  }
}
