import 'package:get/get.dart';

import '../../services/rest_service.dart';
import '../../utils/dialog_utils.dart';

class HomeController extends GetxController {

  @override
  Future<void> onInit() async {
    DialogUtils.showLoadingDialog("Carregando Fotos");
    super.onInit();
  }


}
