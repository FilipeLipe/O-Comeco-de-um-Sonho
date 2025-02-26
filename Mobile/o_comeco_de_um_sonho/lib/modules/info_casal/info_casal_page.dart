import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'info_casal_controller.dart';

class InfoCasalPage extends StatelessWidget {
  const InfoCasalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InfoCasalController controller = Get.find<InfoCasalController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Informações do Casal"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        return Stepper(
          currentStep: controller.currentStep.value,
          onStepContinue: () {
            if (controller.currentStep.value == 5) {
              controller.salvarInfoCasal();
              // Navegue para a página de demonstração se necessário
              // Get.toNamed('/demoInfoCasal');
            } else {
              controller.proximoPasso();
            }
          },
          onStepCancel: () {
            if (controller.currentStep.value > 0) {
              controller.passoAnterior();
            }
          },
          steps: [
            // Passo 0: Nomes
            Step(
              title: const Text("Nomes"),
              content: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Nome Dela",
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
                      controller.infoCasal.update((info) {
                        info?.nomeDela = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.nomeDela),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Nome Dela",
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
                      controller.infoCasal.update((info) {
                        info?.nomeDele = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.nomeDele),
                  ),
                ],
              ),
              isActive: controller.currentStep.value >= 0,
            ),
            // Passo 1: Nascimento e Signo
            Step(
              title: const Text("Nascimento e Signo"),
              content: Column(
                children: [
                  // Aniversário e signo dela
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Aniversário dela (dd/MM/yyyy)",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      try {
                        controller.infoCasal.update((info) {
                          info?.aniversarioDela = DateFormat("dd/MM/yyyy").parse(valor);
                        });
                      } catch (e) {}
                    },
                    controller: TextEditingController(
                        text: controller.infoCasal.value?.aniversarioDela != null
                            ? DateFormat("dd/MM/yyyy").format(controller.infoCasal.value!.aniversarioDela!)
                            : ""),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Signo dela",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      controller.infoCasal.update((info) {
                        info?.signoDela = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.signoDela),
                  ),
                  const SizedBox(height: 16),
                  // Aniversário e signo dele
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Aniversário dele (dd/MM/yyyy)",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      try {
                        controller.infoCasal.update((info) {
                          info?.aniversarioDele = DateFormat("dd/MM/yyyy").parse(valor);
                        });
                      } catch (e) {}
                    },
                    controller: TextEditingController(
                        text: controller.infoCasal.value?.aniversarioDele != null
                            ? DateFormat("dd/MM/yyyy").format(controller.infoCasal.value!.aniversarioDele!)
                            : ""),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Signo dele",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      controller.infoCasal.update((info) {
                        info?.signoDele = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.signoDele),
                  ),
                ],
              ),
              isActive: controller.currentStep.value >= 1,
            ),
            // Passo 2: Início do Namoro e Cronômetro
            Step(
              title: const Text("Início do Namoro"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Data de início do namoro (dd/MM/yyyy)",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      try {
                        controller.infoCasal.update((info) {
                          info?.dataInicioNamoro = DateFormat("dd/MM/yyyy").parse(valor);
                        });
                      } catch (e) {}
                    },
                    controller: TextEditingController(
                        text: controller.infoCasal.value?.dataInicioNamoro != null
                            ? DateFormat("dd/MM/yyyy").format(controller.infoCasal.value!.dataInicioNamoro!)
                            : ""),
                  ),
                  const SizedBox(height: 8),
                  Obx(() {
                    return Text(
                      "Tempo juntos: ${controller.tempoJuntos.value}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    );
                  }),
                ],
              ),
              isActive: controller.currentStep.value >= 2,
            ),
            // Passo 3: Foto do Casal
            Step(
              title: const Text("Foto do Casal"),
              content: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await controller.pickImage();
                    },
                    child: const Text("Escolher foto"),
                  ),
                  const SizedBox(height: 8),
                  Obx(() {
                    return controller.imagemSelecionadaPath.value.isNotEmpty
                        ? Image.file(
                      File(controller.imagemSelecionadaPath.value),
                      height: 150,
                    )
                        : const SizedBox();
                  }),
                ],
              ),
              isActive: controller.currentStep.value >= 3,
            ),
            // Passo 4: Primeira Lembrança
            Step(
              title: const Text("Primeira Lembrança"),
              content: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Primeira lembrança dela",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      controller.infoCasal.update((info) {
                        info?.primeiraLembrancaDela = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.primeiraLembrancaDela),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Primeira lembrança dele",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      controller.infoCasal.update((info) {
                        info?.primeiraLembrancaDele = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.primeiraLembrancaDele),
                  ),
                ],
              ),
              isActive: controller.currentStep.value >= 4,
            ),
            // Passo 5: Outras Informações
            Step(
              title: const Text("Outras Informações"),
              content: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Como se conheceram",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      controller.infoCasal.update((info) {
                        info?.comoSeConheceram = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.comoSeConheceram),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Primeiro beijo",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      controller.infoCasal.update((info) {
                        info?.primeiroBeijo = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.primeiroBeijo),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Como foi o pedido de namoro",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      controller.infoCasal.update((info) {
                        info?.comoFoiPedidodeNamoro = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.comoFoiPedidodeNamoro),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Música do casal",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      controller.infoCasal.update((info) {
                        info?.musicaDoCasal = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.musicaDoCasal),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Restaurante favorito do casal",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (valor) {
                      controller.infoCasal.update((info) {
                        info?.restauranteFavoritoCasal = valor;
                      });
                    },
                    controller: TextEditingController(text: controller.infoCasal.value?.restauranteFavoritoCasal),
                  ),
                ],
              ),
              isActive: controller.currentStep.value >= 5,
            ),
          ],
        );
      }),
    );
  }
}
