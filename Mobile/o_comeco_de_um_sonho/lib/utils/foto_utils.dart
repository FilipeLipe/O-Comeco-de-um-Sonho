import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../data/dao/fotos_dao.dart';
import '../data/models/Foto.dart';

class FotoUtils {
  var imagens = <String>[].obs;
  final ImagePicker _picker = ImagePicker();

  FotoUtils(){

  }

  static Future<void> selecionarESalvarImagem({
    required XFile imagemSelecionada,
    int? idConquista,
    int? idMemorias,
    int? idDestinos,
    int? idInfoCasal,
  }) async {

    List<int> bytesImagem = await File(imagemSelecionada.path).readAsBytes();

    Foto novaFoto = Foto(
      foto: bytesImagem,
      descricao: "Descrição da imagem",
      dataCaptura: DateTime.now().toIso8601String(),
      idConquista: idConquista,
      idMemoria: idMemorias,
      idDestino: idDestinos,
      idInfoCasal: idInfoCasal,
    );

    await FotosDao.instance.insert(novaFoto);

  }

  static Future<List<Foto>?> carregarFotosConquista(int idConquista) async {
    List<Foto>? fotos = await FotosDao.instance.buscarFotosPorConquista(idConquista);
    if (fotos != null) {
      return fotos;
    }
    return [];
  }
}
