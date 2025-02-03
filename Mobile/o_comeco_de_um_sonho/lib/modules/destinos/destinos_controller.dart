import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../data/models/Destinos.dart';

class DestinosController extends GetxController {
  var destinos = <Destinos>[].obs;

  void loadDestinoss() {
    destinos.value = [
      Destinos(nome: "Paris", descricao: "Cidade luz", latitude: 48.8566, longitude: 2.3522, imagePath: "assets/images/paris.png", visitado: true)
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadDestinoss();
  }
}
