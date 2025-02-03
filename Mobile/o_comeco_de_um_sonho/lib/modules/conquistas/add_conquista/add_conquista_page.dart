import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_conquista_controller.dart';

class AddConquistaPage extends StatelessWidget {
  const AddConquistaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddConquistaController controller = Get.find<AddConquistaController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Conquista"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() {
              return GestureDetector(
                onTap: () async {
                  await controller.pickImage();
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  backgroundImage: controller.imagemSelecionadaPath.value.isNotEmpty
                      ? FileImage(File(controller.imagemSelecionadaPath.value))
                      : null,
                  child: controller.imagemSelecionadaPath.value.isEmpty
                      ? const Icon(Icons.add, size: 40, color: Colors.white)
                      : null,
                ),
              );
            }),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: "Título",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                controller.tituloText.value = value;
                controller.saveAchievement();
              },
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: "Descrição",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              onChanged: (value) {
                controller.descricaoText.value = value;
                controller.saveAchievement();
              },
            ),
          ],
        ),
      ),
    );
  }
}
