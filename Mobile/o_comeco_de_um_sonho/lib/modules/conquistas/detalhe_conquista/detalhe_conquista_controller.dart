import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_comeco_de_um_sonho/data/models/ContentGemini.dart';
import 'package:o_comeco_de_um_sonho/modules/conquistas/conquistas_controller.dart';

import '../../../data/dao/conquistas_dao.dart';
import '../../../data/dao/fotos_dao.dart';
import '../../../data/models/Conquistas.dart';
import '../../../data/models/Foto.dart';
import '../../../services/rest_service.dart';
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

  final ImagePicker _picker = ImagePicker();


  @override
  Future<void> onInit() async {
    super.onInit();
    conquista.value = Get.arguments;
    await loadConquistaDetalhes(conquista.value!);
  }

  Future<void> loadConquistaDetalhes(Conquistas conquista) async {
    conquistaTitle.value = conquista.titulo;
    conquistaImagePath.value = conquista.imagemColorido!;
    conquistaImagePretoeBrancoPath.value =  conquista.imagemPretoeBranco!;
    conquistaDescricao.value = conquista.descricao;
    dataConquista.value = conquista.dataConquista;
    isAtivo.value = conquista.ativo;
    imagens.value = (await FotoUtils.carregarFotosConquista(conquista.id!))!;
  }

  Future<void> pickImagem() async {
    final XFile? imagem = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
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
    ContentGemini? batata = await RestService.perguntarGemini("Me de um texto de um horoscopo para um casal do signo de peixes e sagitário, quero o de cada um separado");
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

  void updateConquista(Conquistas conquista) {
    ConquistasDao.instance.update(conquista);
    Get.find<ConquistasController>().loadConquistas();
  }
}
