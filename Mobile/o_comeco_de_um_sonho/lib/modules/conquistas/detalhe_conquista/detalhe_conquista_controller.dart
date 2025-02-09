import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_comeco_de_um_sonho/modules/conquistas/conquistas_controller.dart';

import '../../../data/dao/conquistas_dao.dart';
import '../../../data/dao/fotos_dao.dart';
import '../../../data/models/Conquistas.dart';
import '../../../data/models/Foto.dart';
import '../../../utils/foto_utils.dart';

class DetalheConquistaController extends GetxController {

  Rxn<Conquistas> conquista = Rxn<Conquistas>();

  var conquistaTitle = ''.obs;
  var conquistaImagePath = ''.obs;
  var conquistaImagePretoeBrancoPath = ''.obs;
  var conquistaDescricao = ''.obs;

  var dataConquista = Rxn<DateTime>();

  var isAtivo = false.obs;

  var imagens = <Foto>[].obs;

  var experienciaDela = ''.obs;
  var experienciaDele = ''.obs;

  final ImagePicker _picker = ImagePicker();


  @override
  void onInit() {
    super.onInit();
    conquista.value = Get.arguments;
    loadConquistaDetalhes(conquista.value!);
  }

  Future<void> loadConquistaDetalhes(Conquistas conquista) async {
    conquistaTitle.value = conquista.titulo;
    conquistaImagePath.value = "assets/Pin/"+ conquista.imagem! +".png";
    conquistaImagePretoeBrancoPath.value = "assets/Pin/"+ conquista.imagem! + "-pretoebranco" +".png";
    conquistaDescricao.value = conquista.descricao;
    dataConquista.value = conquista.dataConquista;
    isAtivo.value = conquista.ativo;
    imagens.value = (await FotoUtils.carregarFotosConquista(conquista.id!))!;
    experienciaDela.value = "";
    experienciaDele.value = "";
  }

  Future<void> pickImagem() async {
    final XFile? imagem = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (imagem != null) {
      await FotoUtils.selecionarESalvarImagem(imagemSelecionada: imagem, idConquista: conquista.value?.id);
      imagens.value = (await FotoUtils.carregarFotosConquista(conquista.value!.id!))!;
    }
  }

  Future<void> deletarImagem(int index) async {
    final foto = imagens.removeAt(index);
    if (foto.id != null) {
      await FotosDao.instance.delete(foto.id!);
    }
  }


  Future<bool> ativarPin() async {
    if (dataConquista.value != null) {

      conquista.value!.dataConquista = dataConquista.value;
      isAtivo.value = true;
      conquista.value!.ativo = isAtivo.value;

      print('Conquista ativada em ${dataConquista.value}');
      ConquistasDao.instance.update(conquista.value!);
      Get.find<ConquistasController>().loadConquistas();
      return true;
    } else {
      Get.snackbar("Atenção", "Selecione a data do evento antes de ativar.");
      return false;
    }
  }

  void updateConquistas({String? her, String? him}) {
    if (her != null) experienciaDela.value = her;
    if (him != null) experienciaDele.value = him;
    print('Experiência dela: ${experienciaDela.value}, dele: ${experienciaDele.value}');
  }
}
