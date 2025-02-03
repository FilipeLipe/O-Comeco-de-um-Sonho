import 'package:get/get.dart';
import '../../data/models/Memorias.dart';

class MemoriasController extends GetxController {
  var memories = <Memorias>[].obs;

  void loadMemories() {
    memories.value = [
      Memorias(data: DateTime.now(), descricao: "Encontro especial", imagePath: "assets/images/meeting.png"),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadMemories();
  }
}
