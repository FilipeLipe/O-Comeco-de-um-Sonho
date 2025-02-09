import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_comeco_de_um_sonho/utils/foto_utils.dart';
import '../../../widget/ConquistaFlipWidget.dart';
import '../../../widget/FotoItemWidget.dart';
import 'detalhe_conquista_controller.dart';

class DetalheConquistaPage extends StatelessWidget {
  const DetalheConquistaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetalheConquistaController controller = Get.find<DetalheConquistaController>();
    final GlobalKey<ConquistaFlipWidgetState> flipKey = GlobalKey<ConquistaFlipWidgetState>();

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
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),
                Center(
                  child: ConquistaFlipWidget(
                    key: flipKey,
                    isAtivo: !controller.isAtivo.value,
                    frontImagePath: controller.conquistaImagePretoeBrancoPath.value,
                    backImagePath: controller.conquistaImagePath.value,
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
                      Text(
                        controller.dataConquista.value != null
                            ? "${formatarData(controller.dataConquista.value!)}"
                            : "Selecione a data do evento",
                        style: const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    child: Column(
                      children: [
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
                                onPressed: () async {
                                  if(await controller.ativarPin()){
                                    flipKey.currentState?.startFlip();
                                  };
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  foregroundColor: Colors.white,
                                  elevation: 5,
                                  shadowColor: Colors.black54,

                                ),
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
                                child: Obx(
                                      () => ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.imagens.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index < controller.imagens.length) {
                                        final foto = controller.imagens[index];
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4),
                                          child: FotoItemWidget(
                                            foto: foto,
                                            index: index,
                                            onExpand: () {
                                              FotoUtils.mostrarGaleriaPopUp(context, controller.imagens, index);
                                            },
                                            onDelete: () {
                                              controller.deletarImagem(index);
                                            },
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
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

String formatarData(DateTime data) {
  String formattedDate = DateFormat("d 'de' MMMM 'de' y", 'pt_BR').format(data);

  return formattedDate.replaceFirst(
      formattedDate[formattedDate.indexOf('de') + 3],
      formattedDate[formattedDate.indexOf('de') + 3].toUpperCase()
  );
}
