
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../data/models/Conquistas.dart';
import '../../routes/app_routes.dart';
import '../../widget/CustomPinGrid.dart';
import '../../widget/CustomSlider.dart';
import 'conquistas_controller.dart';

class ConquistasPage extends StatefulWidget {
  const ConquistasPage({Key? key}) : super(key: key);

  @override
  _ConquistasPageState createState() => _ConquistasPageState();
}

class _ConquistasPageState extends State<ConquistasPage> {

  @override
  Widget build(BuildContext context) {

    final ConquistasController controller = Get.find<ConquistasController>();
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text("Conquistas"),
        actions: [
          IconButton(
            icon: Icon(controller.isGridMode.value ? Icons.slideshow : Icons.grid_view),
            onPressed: () {
              setState(() {
                controller.isGridMode.value = !controller.isGridMode.value;
              });
            },
            tooltip: controller.isGridMode.value ? "Modo Slider" : "Modo Grade",
          ),
        ],
      ),
      body: controller.isGridMode.value ? buildGridView(controller) : buildSliderView(controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_CONQUISTA);
        },
        child: const Icon(Icons.add),
        tooltip: "Adicionar Novo Pin",
      ),
    ));
  }

  Widget buildSliderView(ConquistasController controller) {
    return Obx(() => PageView.builder(
      itemCount: controller.conquistas.value.length,
      itemBuilder: (context, index) {
        final conquista = controller.conquistas.value[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConquistasCard(
            conquista: conquista,
            onTap: () {
              Get.toNamed(Routes.DETALHE_CONQUISTA, arguments: conquista);
            },
          ),
        );
      },
    ));
  }

  Widget buildGridView(ConquistasController controller) {
    return Obx(() => GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: controller.conquistas.value.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        final conquista = controller.conquistas.value[index];
        return CustomPinGrid(
          conquista: conquista,
          onTap: () {
            Get.toNamed(Routes.DETALHE_CONQUISTA, arguments: conquista);
          },
        );
      },
    ));
  }
}
