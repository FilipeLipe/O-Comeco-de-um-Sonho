// lib/modules/info_casal/info_casal_page.dart
import 'package:flutter/material.dart';
import '../../data/models/infoCasal.dart';

class InfoCasalPage extends StatelessWidget {
  InfoCasalPage({Key? key}) : super(key: key);

  // Simulação; carregue os dados do DB
  final InfoCasal coupleInfo = InfoCasal(startDate: DateTime(2020, 1, 1), additionalInfo: "Casal feliz!");

  @override
  Widget build(BuildContext context) {
    // Calcular a duração juntos
    final duration = DateTime.now().difference(coupleInfo.startDate);
    final daysTogether = duration.inDays;

    return Scaffold(
      appBar: AppBar(title: const Text("Informações do Casal")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Estamos juntos há",
            ),
            Text(
              "$daysTogether dias",
            ),
            const SizedBox(height: 20),
            Text(coupleInfo.additionalInfo ?? ""),
          ],
        ),
      ),
    );
  }
}
