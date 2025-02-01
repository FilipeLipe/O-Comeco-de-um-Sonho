// lib/modules/info_casal/info_casal_controller.dart
import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/data/models/InfoCasal.dart';

class InfoCasalController extends GetxController {
  var coupleInfo = Rxn<InfoCasal>();

  void loadInfoCasal() {
    // Carregar informações do casal do banco de dados
    coupleInfo.value = InfoCasal(
      startDate: DateTime(2020, 1, 1),
      additionalInfo: "Casal apaixonado!",
    );
  }

  @override
  void onInit() {
    super.onInit();
    loadInfoCasal();
  }
}
