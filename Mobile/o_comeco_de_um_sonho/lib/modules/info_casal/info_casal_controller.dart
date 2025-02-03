// lib/modules/info_casal/info_casal_controller.dart
import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/data/models/InfoCasal.dart';

class InfoCasalController extends GetxController {
  var coupleInfo = Rxn<InfoCasal>();

  void loadInfoCasal() {
    coupleInfo.value = InfoCasal(
      dataInicio: DateTime(2020, 1, 1),
      textoCasal: "Casal apaixonado!",
    );
  }

  @override
  void onInit() {
    super.onInit();
    loadInfoCasal();
  }
}
