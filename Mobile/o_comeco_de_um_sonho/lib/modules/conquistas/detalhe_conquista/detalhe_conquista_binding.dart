import 'package:get/get.dart';

import 'detalhe_conquista_controller.dart';

class DetalheConquistaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetalheConquistaController>(() => DetalheConquistaController());
  }
}
