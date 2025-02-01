import 'package:get/get.dart';

import '../../services/rest_service.dart';
import '../../utils/dialog_utils.dart';

class MapaController extends GetxController {

  var counter = 0.obs;

  @override
  Future<void> onInit() async {
    DialogUtils.showLoadingDialog("Carregando Fotos");
    super.onInit();
  }

  void increment() {
    counter.value++;
  }

}