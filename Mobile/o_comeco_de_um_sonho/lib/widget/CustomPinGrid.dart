import 'dart:io';
import 'package:flutter/material.dart';
import 'package:o_comeco_de_um_sonho/data/models/Conquistas.dart';
import 'package:o_comeco_de_um_sonho/utils/foto_utils.dart';
import 'package:path_provider/path_provider.dart';

class CustomPinGrid extends StatefulWidget {
  final Conquistas conquista;
  final VoidCallback onTap;

  const CustomPinGrid({
    Key? key,
    required this.conquista,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomPinGridState createState() => _CustomPinGridState();
}

class _CustomPinGridState extends State<CustomPinGrid> {
  Directory? diretorio = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String caminhoImagem = widget.conquista.ativo ? widget.conquista.imagemColorido! : widget.conquista.imagemPretoeBranco!;

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
                    color: widget.conquista.ativo ? Colors.teal : Colors.transparent,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    widget.conquista.titulo,
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
  }
}
