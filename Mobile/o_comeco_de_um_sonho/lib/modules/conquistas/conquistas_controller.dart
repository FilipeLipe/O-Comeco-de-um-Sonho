// lib/modules/conquistas/conquistas_controller.dart
import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/data/models/Conquistas.dart';

class ConquistasController extends GetxController {
  var conquistas = <Conquistas>[].obs;

  void loadConquistas() {
    conquistas.value = [
      Conquistas(title: "Voar de Asa Delta", description: "Meta de voar", achieved: false, imagePath: "assets/images/asa_delta_bw.png"),
      Conquistas(title: "Paraquedas", description: "Meta de saltar", achieved: true, imagePath: "assets/images/paraquedas_color.png"),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadConquistas();
  }
}
