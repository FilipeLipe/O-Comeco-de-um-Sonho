import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/data/models/Conquistas.dart';

class ConquistasController extends GetxController {
  var conquistas = <Conquistas>[].obs;

  void loadConquistas() {
    conquistas.value = [
      Conquistas(titulo: "Voar de Asa Delta", descricao: "Meta de voar", ativo: false, imagem: "assets/images/asa_delta_bw.png"),
      Conquistas(titulo: "Paraquedas", descricao: "Meta de saltar", ativo: true, imagem: "assets/images/paraquedas_color.png"),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadConquistas();
  }
}
