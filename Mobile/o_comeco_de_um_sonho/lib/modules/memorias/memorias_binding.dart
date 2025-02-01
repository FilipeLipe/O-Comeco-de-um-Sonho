
import 'package:get/get.dart';
import 'memorias_controller.dart';

class MemoriasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemoriasController>(() => MemoriasController());
  }
}
