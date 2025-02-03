
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../data/models/Conquistas.dart';
import '../../routes/app_routes.dart';
import '../../widget/CustomPinGrid.dart';
import '../../widget/CustomSlider.dart';

class ConquistasPage extends StatefulWidget {
  const ConquistasPage({Key? key}) : super(key: key);

  @override
  _ConquistasPageState createState() => _ConquistasPageState();
}

class _ConquistasPageState extends State<ConquistasPage> {

  bool isGridMode = false;

  final List<Conquistas> conquistas = [
    Conquistas(titulo: "Acampar", descricao: "Meta para voar", ativo: false, imagem: "Acampar"),
    Conquistas(titulo: "AsaDelta", descricao: "Meta para saltar", ativo: true, imagem: "AsaDelta"),
    Conquistas(titulo: "Balao", descricao: "Meta para saltar", ativo: false, imagem: "Balao"),
    Conquistas(titulo: "Braunas", descricao: "Meta para voar", ativo: false, imagem: "Braunas"),
    Conquistas(titulo: "Caiaque", descricao: "Meta para saltar", ativo: true, imagem: "Caiaque"),
    Conquistas(titulo: "CampCross", descricao: "Meta para saltar", ativo: false, imagem: "CampCross"),
    Conquistas(titulo: "Contorno", descricao: "Meta para voar", ativo: false, imagem: "Contorno"),
    Conquistas(titulo: "Escalada", descricao: "Meta para saltar", ativo: true, imagem: "Escalada"),
    Conquistas(titulo: "Estadio", descricao: "Meta para saltar", ativo: false, imagem: "Estadio"),
    Conquistas(titulo: "Mergulho", descricao: "Meta para voar", ativo: false, imagem: "Mergulho"),
    Conquistas(titulo: "Noivado", descricao: "Meta para saltar", ativo: true, imagem: "Noivado"),
    Conquistas(titulo: "NossaCasa", descricao: "Meta para saltar", ativo: false, imagem: "NossaCasa"),
    Conquistas(titulo: "Pampulha", descricao: "Meta para voar", ativo: false, imagem: "Pampulha"),
    Conquistas(titulo: "Paraquedas", descricao: "Meta para saltar", ativo: true, imagem: "Paraquedas"),
    Conquistas(titulo: "Pendulo", descricao: "Meta para saltar", ativo: false, imagem: "Pendulo"),
    Conquistas(titulo: "Rapel", descricao: "Meta para voar", ativo: false, imagem: "Rapel"),
    Conquistas(titulo: "TrailRun", descricao: "Meta para saltar", ativo: true, imagem: "TrailRun"),
    Conquistas(titulo: "Triatlo", descricao: "Meta para saltar", ativo: false, imagem: "Triatlo"),
    Conquistas(titulo: "Utv", descricao: "Meta para saltar", ativo: true, imagem: "Utv"),
    Conquistas(titulo: "Viajar Moto", descricao: "Meta para saltar", ativo: false, imagem: "ViajarMoto"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conquistas"),
        actions: [
          IconButton(
            icon: Icon(isGridMode ? Icons.slideshow : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridMode = !isGridMode;
              });
            },
            tooltip: isGridMode ? "Modo Slider" : "Modo Grade",
          ),
        ],
      ),
      body: isGridMode ? buildGridView() : buildSliderView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_CONQUISTA);
        },
        child: const Icon(Icons.add),
        tooltip: "Adicionar Novo Pin",
      ),
    );
  }

  Widget buildSliderView() {
    return PageView.builder(
      itemCount: conquistas.length,
      itemBuilder: (context, index) {
        final conquista = conquistas[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConquistasCard(
            titulo: conquista.titulo,
            imagePath: conquista.imagem!,
            ativo: conquista.ativo,
            onTap: () {
              Get.toNamed(Routes.DETALHE_CONQUISTA, arguments: conquista);
            },
          ),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: conquistas.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemBuilder: (context, index) {
        final conquista = conquistas[index];
        return CustomPinGrid(
          titulo: conquista.titulo,
          imagePath: conquista.imagem!,
          ativo: conquista.ativo,
          onTap: () {
            Get.toNamed(Routes.DETALHE_CONQUISTA, arguments: conquista);
          },
        );
      },
    );
  }
}
