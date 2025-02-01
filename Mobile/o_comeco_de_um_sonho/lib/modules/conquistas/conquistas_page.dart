// lib/modules/conquistas/conquistas_page.dart
import 'package:flutter/material.dart';
import '../../data/models/Conquistas.dart';
import '../../widget/customSlider.dart';

class ConquistasPage extends StatelessWidget {
  ConquistasPage({Key? key}) : super(key: key);

  // Lista simulada; substitua com dados reais do DB
  final List<Conquistas> conquistas = [
    Conquistas(title: "Voar de Asa Delta", description: "Meta para voar", achieved: false, imagePath: "assets/images/asa_delta_bw.png"),
    Conquistas(title: "Voo de balão", description: "Meta para saltar", achieved: true, imagePath: "assets/Pin/Balao.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conquistas")),
      body: Center(
        child: PageView.builder(
          itemCount: conquistas.length,
          itemBuilder: (context, index) {
            final achievement = conquistas[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConquistasCard(
                title: achievement.title,
                imagePath: achievement.imagePath ?? "",
                achieved: achievement.achieved,
                onTap: () {
                  // Navegar para detalhes ou edição da conquista
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
