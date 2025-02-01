import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/data/models/Calendario.dart';

import '../../data/models/Calendario.dart';
class CalendarioController extends GetxController {
  var events = <Calendario>[].obs;

  void loadEvents() {
    events.value = [
      Calendario(title: "Encontro no cinema", date: DateTime.now(), description: "Filme novo!"),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadEvents();
  }
}
