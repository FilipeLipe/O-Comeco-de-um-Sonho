import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:o_comeco_de_um_sonho/widget/CustomTitle.dart';

class ConquistasCard extends StatelessWidget {
  final String titulo;
  final String imagePath;
  final bool ativo;
  final VoidCallback? onTap;

  const ConquistasCard({
    Key? key,
    required this.titulo,
    required this.imagePath,
    this.ativo = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagemPath = "assets/Pin/"+ (ativo ? imagePath : imagePath+ "-pretoebranco") + ".png";
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 230, bottom: 10, left: 10, right: 10),
            padding: const EdgeInsets.only(top: 60, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: ativo ? Colors.black.withOpacity(0.9) : Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: ativo ? Colors.teal : Colors.transparent,
                width: 6,
              ),
            ),
            child: Center(
              child: CustomTitle(
                text: titulo,
                height: 1,
                size: 60,
                color: ativo ? Colors.teal : Colors.grey,
                align: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: CircleAvatar(
              radius: 135,
              backgroundImage: AssetImage(imagemPath),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}