// lib/modules/home/mapa_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Você pode incluir widgets que resumam os módulos:
  // - Última lembrança
  // - Conquistas recentes
  // - Próximo evento do calendário
  // - Dica ou contador do casal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView(
        children: [
          // Exemplo de card com resumo de lembranças:
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Última Lembrança"),
            subtitle: const Text("Encontro de 15/08/2023"),
            onTap: () => Get.toNamed(Routes.MEMORIAS),
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text("Conquistas"),
            onTap: () => Get.toNamed(Routes.CONQUISTAS),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text("Destinos"),
            onTap: () => Get.toNamed(Routes.DESTINOS),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text("Calendário do Casal"),
            onTap: () => Get.toNamed(Routes.CALENDARIO),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Informações do Casal"),
            onTap: () => Get.toNamed(Routes.INFO_CASAL),
          ),
        ],
      ),
    );
  }
}
