
import 'package:diacritic/diacritic.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_comeco_de_um_sonho/data/dao/conquistas_dao.dart';


import 'package:o_comeco_de_um_sonho/data/models/Conquistas.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/dialog_utils.dart';
import '../../../utils/foto_utils.dart';
import '../conquistas_controller.dart';

class AddConquistaController extends GetxController {
  var imagemSelecionadaPath = ''.obs;
  var tituloText = ''.obs;
  var descricaoText = ''.obs;

  XFile? imagem = null;

  Rxn<Conquistas> conquista = new Rxn<Conquistas>();

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    conquista.value = Conquistas(
      titulo: "",
      descricao: "",
      ativo: false,
      imagem: "",
    );
  }

  Future<void> pickImage() async {
    imagem = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (imagem != null) {
      imagemSelecionadaPath.value = imagem!.path;
    }
  }

  Future<void> salvarConquista() async {

    if (imagem != null) {
      await DialogUtils.showLoadingDialog("Criando Conquista");
      conquista.value!.imagem = removeDiacritics(conquista.value!.titulo.trim().replaceAll(" ", ""));
      await FotoUtils.salvarImagemNoDiretorioPin(imagem!.path, conquista.value!.imagem!);
      ConquistasDao.instance.insert(conquista.value!);
      Get.find<ConquistasController>().loadConquistas();
      Get.until((route) => route.settings.name == Routes.CONQUISTAS);
    }

  }

  Future<bool> camposPreenchidos() async {
    if (conquista.value?.titulo.trim().isEmpty ?? true) {
      Get.snackbar("Atenção", "Preencha o título");
      return false;
    }

    if (conquista.value?.descricao.trim().isEmpty ?? true) {
      Get.snackbar("Atenção", "Preencha a descrição");
      return false;
    }

    if (imagem == null) {
      Get.snackbar("Atenção", "Escolha uma imagem");
      return false;
    }

    return true;
  }

}
