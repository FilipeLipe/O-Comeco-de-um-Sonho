import 'package:get/get.dart';
import 'package:o_comeco_de_um_sonho/data/models/Conquistas.dart';


import '../../data/dao/conquistas_dao.dart';

class ConquistasController extends GetxController {

  var conquistas = <Conquistas>[].obs;
  RxBool isGridMode = true.obs;

  Future<void> loadConquistas() async {
    conquistas.value = [];
    conquistas.value = (await ConquistasDao.instance.queryAllRows())!;
    conquistas.value.sort((a, b) {
      if (a.ativo == b.ativo) {
        return a.titulo.toLowerCase().compareTo(b.titulo.toLowerCase());
      }
      return a.ativo ? -1 : 1;
    });
  }

  @override
  void onInit() {
    super.onInit();
    loadConquistas();
  }
}