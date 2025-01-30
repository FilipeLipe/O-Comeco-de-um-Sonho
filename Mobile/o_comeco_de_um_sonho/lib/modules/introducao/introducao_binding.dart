import 'package:get/get.dart';

import 'introducao_controller.dart';

class IntroducaoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroducaoController>(() => IntroducaoController());
  }
}
