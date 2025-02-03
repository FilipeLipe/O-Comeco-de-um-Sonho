import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/ConquistaFlipWidget.dart';
import 'detalhe_conquista_controller.dart';

class DetalheConquistaPage extends StatelessWidget {
  const DetalheConquistaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetalheConquistaController controller = Get.find<DetalheConquistaController>();
    final GlobalKey<ConquistaFlipWidgetState> flipKey = GlobalKey<ConquistaFlipWidgetState>();

    return Scaffold(
      appBar: AppBar(title: const Text("Detalhe da Conquista")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ConquistaFlipWidget(
                  key: flipKey,
                  imagemPretoeBrancoPath: "assets/Pin/Acampar-pretoebranco.png",
                  imagemColoridaPath: "assets/Pin/Acampar.png",
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    Text(
                      controller.conquistaTitle.value,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      controller.dataConquista.value != null
                          ? "Data do Evento: ${controller.dataConquista.value!.toLocal().toString().split(' ')[0]}"
                          : "Selecione a data do evento",
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (!controller.isAtivo.value)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        );
                        if (picked != null) {
                          controller.dataConquista.value = picked;
                        }
                      },
                      child: const Text("Selecionar Data do Evento"),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        flipKey.currentState?.startFlip();
                        controller.activatePin;
                      },
                      child: const Text("Ativar Conquista"),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Fotos da Aventura:",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.imagens.length + 1,
                        itemBuilder: (context, index) {
                          if (index < controller.imagens.length) {
                            String imgPath = controller.imagens[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: imgPath.startsWith("assets/")
                                        ? AssetImage(imgPath)
                                        : FileImage(File(imgPath)) as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: GestureDetector(
                                onTap: controller.pickImagem,
                                child: Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(Icons.add, size: 40, color: Colors.black),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Experiência dela:",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: "Digite a experiência dela"),
                      onChanged: (value) {
                        controller.experienciaDela.value = value;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Experiência dele:",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: "Digite a experiência dele"),
                      onChanged: (value) {
                        controller.experienciaDele.value = value;
                      },
                    ),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
