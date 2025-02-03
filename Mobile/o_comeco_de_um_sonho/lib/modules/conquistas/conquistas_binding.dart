import 'package:get/get.dart';
import 'conquistas_controller.dart';

class ConquistasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConquistasController>(() => ConquistasController());
  }
}
