import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/data/models/conquistas.dart';


import '../../data/dao/conquistas_dao.dart';

class ConquistasController extends GetxController {
  var conquistas = <Conquistas>[].obs;

  Future<void> loadConquistas() async {
    conquistas.value = (await ConquistasDao.instance.queryAllRows())!;
  }

  @override
  void onInit() {
    super.onInit();
    loadConquistas();
  }
}