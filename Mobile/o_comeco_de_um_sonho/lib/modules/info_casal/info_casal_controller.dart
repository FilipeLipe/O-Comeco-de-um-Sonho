import 'dart:async';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_comeco_de_um_sonho/services/rest_service.dart';

import '../../data/models/InfoCasal.dart';

class InfoCasalController extends GetxController {
  // Objeto de informações do casal
  Rxn<InfoCasal> infoCasal = Rxn<InfoCasal>(InfoCasal());

  // Índice do passo atual no Stepper
  RxInt currentStep = 0.obs;

  // Cronômetro de tempo juntos (calculado a partir da data de início do namoro)
  RxString tempoJuntos = "".obs;
  Timer? _timer;

  var imagemSelecionadaPath = ''.obs;
  final ImagePicker _picker = ImagePicker();
  XFile? imagem = null;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (infoCasal.value?.dataInicioNamoro != null) {
        final duration = DateTime.now().difference(infoCasal.value!.dataInicioNamoro!);
        tempoJuntos.value = _formatDuration(duration);
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  String _formatDuration(Duration duration) {
    int dias = duration.inDays;
    int horas = duration.inHours % 24;
    int minutos = duration.inMinutes % 60;
    int segundos = duration.inSeconds % 60;
    return "$dias dias ${horas.toString().padLeft(2, '0')}:${minutos.toString().padLeft(2, '0')}:${segundos.toString().padLeft(2, '0')}";
  }

  void proximoPasso() {
    if (currentStep.value < 5) {
      currentStep.value++;
    }
  }

  void passoAnterior() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  Future<void> pickImage() async {
    imagem = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (imagem != null) {
      imagemSelecionadaPath.value = imagem!.path;
    }
  }

  Future<void> salvarInfoCasal() async {
    // Salva no banco, por exemplo:
    // await InfoCasalDao.instance.insertOrUpdate(infoCasal.value!);
  }
}
