import 'package:get/get.dart';
import 'add_conquista_controller.dart';

class AddConquistaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddConquistaController>(() => AddConquistaController());
  }
}
