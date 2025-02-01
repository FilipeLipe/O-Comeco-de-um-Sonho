// lib/modules/destinos/destinos_controller.dart
import 'package:get/get.dart';
import '../../data/models/Destinos.dart';

class DestinosController extends GetxController {
  var destinos = <Destinos>[].obs;

  void loadDestinoss() {
    destinos.value = [
      Destinos(name: "Paris", description: "Cidade luz", latitude: 48.8566, longitude: 2.3522, imagePath: "assets/images/paris.png", visited: true),
      // Outros destinos podem ser adicionados
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadDestinoss();
  }
}
