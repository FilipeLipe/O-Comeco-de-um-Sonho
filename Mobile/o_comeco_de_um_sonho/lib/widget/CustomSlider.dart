import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:o_comeco_de_um_sonho/data/models/Conquistas.dart';
import 'package:o_comeco_de_um_sonho/widget/CustomTitle.dart';

class ConquistasCard extends StatelessWidget {
  final Conquistas conquista;
  final VoidCallback? onTap;

  const ConquistasCard({
    Key? key,
    required this.conquista,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagemPath = conquista.ativo ? conquista.imagemColorido! : conquista.imagemPretoeBranco!;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 230, bottom: 10, left: 10, right: 10),
            padding: const EdgeInsets.only(top: 60, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: conquista.ativo ? Colors.black.withOpacity(0.9) : Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: conquista.ativo ? Colors.teal : Colors.transparent,
                width: 6,
              ),
            ),
            child: Center(
              child: CustomTitle(
                text: conquista.titulo,
                height: 1,
                size: 60,
                color: conquista.ativo ? Colors.teal : Colors.grey,
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