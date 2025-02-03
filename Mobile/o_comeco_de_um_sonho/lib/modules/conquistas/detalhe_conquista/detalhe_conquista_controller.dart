import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../data/models/Conquistas.dart';

class DetalheConquistaController extends GetxController {

  Rxn<Conquistas> conquista = Rxn<Conquistas>();

  var conquistaTitle = ''.obs;
  var conquistaImagePath = ''.obs;
  var conquistaDescricao = ''.obs;

  var dataConquista = Rxn<DateTime>();

  var isAtivo = false.obs;

  var imagens = <String>[].obs;

  var experienciaDela = ''.obs;
  var experienciaDele = ''.obs;

  final ImagePicker _picker = ImagePicker();


  @override
  void onInit() {
    super.onInit();

    conquista.value = Get.arguments ?? null;
    loadConquistaDetalhes(conquista.value!);
  }

  void loadConquistaDetalhes(Conquistas conquista) {
    conquistaTitle.value = conquista.titulo;
    conquistaImagePath.value = "assets/Pin/"+ (conquista.ativo ? conquista.imagem! : conquista.imagem! + "-pretoebranco") +".png";
    conquistaDescricao.value = conquista.descricao;
    dataConquista.value = conquista.dataConquista;
    isAtivo.value = conquista.ativo;
    imagens.value = [];
    experienciaDela.value = "";
    experienciaDele.value = "";
  }

  Future<void> pickImagem() async {
    final XFile? imagem = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (imagem != null) {
      imagens.add(imagem.path);
      salvarimagens();
    }
  }

  void salvarimagens() {
    print('Salvando imagens da aventura: $imagens');
  }

  void activatePin() {
    if (dataConquista.value != null) {
      isAtivo.value = true;
      print('Conquista ativada em ${dataConquista.value}');
    } else {
      Get.snackbar("Atenção", "Selecione a data do evento antes de ativar.");
    }
  }

  void updateConquistas({String? her, String? him}) {
    if (her != null) experienciaDela.value = her;
    if (him != null) experienciaDele.value = him;
    print('Experiência dela: ${experienciaDela.value}, dele: ${experienciaDele.value}');
  }
}
