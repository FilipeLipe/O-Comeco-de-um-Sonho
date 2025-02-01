import 'package:get/get.dart';
import '../../data/models/Memorias.dart';

class MemoriasController extends GetxController {
  var memories = <Memorias>[].obs;

  void loadMemories() {
    // Aqui, você deverá carregar os dados do banco.
    memories.value = [
      Memorias(date: DateTime.now(), description: "Encontro especial", imagePath: "assets/images/meeting.png"),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadMemories();
  }
}
