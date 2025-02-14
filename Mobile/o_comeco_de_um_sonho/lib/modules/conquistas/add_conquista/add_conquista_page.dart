import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/ExperienceFieldWidget.dart';
import 'add_conquista_controller.dart';

class AddConquistaPage extends StatelessWidget {
  const AddConquistaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AddConquistaController controller = Get.find<AddConquistaController>();

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(46),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),
              Obx(() {
                return Center(
                  child: GestureDetector(
                    onTap: () async {
                      await controller.pickImage();
                    },
                    child: CircleAvatar(
                      radius: 150,
                      backgroundColor: Colors.grey,
                      backgroundImage: controller.imagemSelecionadaPath.value.isNotEmpty
                          ? FileImage(File(controller.imagemSelecionadaPath.value))
                          : null,
                      child: controller.imagemSelecionadaPath.value.isEmpty
                          ? const Icon(Icons.add, size: 40, color: Colors.white)
                          : null,
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              Text(
                "Título*:",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                onChanged: (valor) {
                  controller.conquista.update((conquista) {
                    if (conquista != null) {
                      conquista.titulo = valor;
                    }
                  });
                },
              ),
              const SizedBox(height: 16),
              Text(
                "Descrição:",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                onChanged: (valor) {
                  controller.conquista.update((conquista) {
                    if (conquista != null) {
                      conquista.descricao = valor;
                    }
                  });
                },
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () async {
                    if (await controller.camposPreenchidos()) {
                      controller.salvarConquista();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: Colors.black54,
                  ),
                  child: const Text("Criar Conquista"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
