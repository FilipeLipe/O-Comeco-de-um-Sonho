
import 'package:image/image.dart' as img;
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../data/dao/fotos_dao.dart';
import '../data/models/Foto.dart';
import 'dart:typed_data';

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


  static Future<Map<String, String>> salvarImagemNoDiretorioPin(String caminhoFoto, String nomeArquivo) async {
    final Directory diretorio = await getApplicationDocumentsDirectory();

    final String novoDiretorioPath = '${diretorio.path}/Pin';
    final Directory novoDiretorio = Directory(novoDiretorioPath);

    if (!await novoDiretorio.exists()) {
      await novoDiretorio.create(recursive: true);
    }

    final String caminhoColorido = '$novoDiretorioPath/$nomeArquivo.png';
    final String caminhoPretoebranco = '$novoDiretorioPath/${nomeArquivo}-pretoebranco.png';

    final File arquivoOriginal = File(caminhoFoto);
    final File arquivoColorido = await arquivoOriginal.copy(caminhoColorido);


    Uint8List bytesImagem = Uint8List.fromList(await arquivoOriginal.readAsBytes());
    final img.Image? imagemOriginal = img.decodeImage(bytesImagem);
    if (imagemOriginal == null) {
      throw Exception("Falha ao decodificar a imagem.");
    }

    final img.Image imagemPB = img.grayscale(imagemOriginal);

    final List<int> bytesPB = img.encodePng(imagemPB);

    final File arquivoPretoebranco = File(caminhoPretoebranco);
    await arquivoPretoebranco.writeAsBytes(bytesPB);

    return {
      "colorido": caminhoColorido,
      "pretoebranco": caminhoPretoebranco,
    };
  }

  static Future<String> getLocalImagePath(String nomeImagem) async {
    final Directory diretorio = await getApplicationDocumentsDirectory();
    return '${diretorio.path}/Pin/$nomeImagem.png';
  }

  static Future<List<Foto>?> carregarFotosConquista(int idConquista) async {
    List<Foto>? fotos = await FotosDao.instance.buscarFotosPorConquista(idConquista);
    if (fotos != null) {
      return fotos;
    }
    return [];
  }

  static void mostrarGaleriaPopUp(BuildContext context, List<Foto> fotos, int indiceInicial) {
    final List<GlobalKey> itemKeys = List.generate(fotos.length, (_) => GlobalKey());

    final ScrollController scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (indiceInicial < itemKeys.length && itemKeys[indiceInicial].currentContext != null) {
        Scrollable.ensureVisible(
          itemKeys[indiceInicial].currentContext!,
          duration: const Duration(milliseconds: 300),
        );
      }
    });

    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: fotos.length,
              itemBuilder: (context, index) {
                final foto = fotos[index];
                return Padding(
                  key: itemKeys[index],
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Hero(
                    tag: 'foto_$index',
                    child: Container(
                      child: foto.foto != null
                          ? Image.memory(
                        Uint8List.fromList(foto.foto!),
                        height: MediaQuery.of(context).size.height * 0.8,
                        fit: BoxFit.contain,
                      )
                          : Image.asset(
                        "assets/images/placeholder.png",
                        height: MediaQuery.of(context).size.height * 0.8,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

}
