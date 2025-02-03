import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddConquistaController extends GetxController {
  var imagemSelecionadaPath = ''.obs;
  var tituloText = ''.obs;
  var descricaoText = ''.obs;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) {
      imagemSelecionadaPath.value = image.path;
    }
  }

  Future<void> saveAchievement() async {
    print('Salvando conquista: ${tituloText.value}, ${descricaoText.value}, imagem: ${imagemSelecionadaPath.value}');
  }
}
