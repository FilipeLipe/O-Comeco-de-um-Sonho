import 'dart:io';
import 'package:flutter/material.dart';
import 'package:o_comeco_de_um_sonho/utils/foto_utils.dart';

class CustomPinGrid extends StatefulWidget {
  final String titulo;
  final String imagePath;
  final bool ativo;
  final VoidCallback onTap;

  const CustomPinGrid({
    Key? key,
    required this.titulo,
    required this.imagePath,
    required this.ativo,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomPinGridState createState() => _CustomPinGridState();
}

class _CustomPinGridState extends State<CustomPinGrid> {
  late Future<String> _futureImagem;

  @override
  void initState() {
    super.initState();
    _futureImagem = _obterCaminhoImagem();
  }

  Future<String> _obterCaminhoImagem() async {
    return FotoUtils.getLocalImagePath(widget.ativo
        ? widget.imagePath
        : widget.imagePath + "-pretoebranco");
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _futureImagem,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            width: 100,
            height: 120,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final String caminhoImagem = snapshot.hasData ? snapshot.data! : "assets/Pin/${widget.ativo ? widget.imagePath : widget.imagePath + "-pretoebranco"}.png";

        final ImageProvider imageProvider = caminhoImagem.startsWith("assets/")
            ? AssetImage(caminhoImagem)
            : FileImage(File(caminhoImagem));

        return GestureDetector(
          onTap: widget.onTap,
          child: SizedBox(
            width: 100,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: imageProvider,
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.9),
                      border: Border.all(
                        color: widget.ativo ? Colors.teal : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        widget.titulo,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
