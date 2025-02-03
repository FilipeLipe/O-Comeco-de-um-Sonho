import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../data/models/Destinos.dart';

class DestinosPage extends StatefulWidget {
  const DestinosPage({Key? key}) : super(key: key);

  @override
  _DestinosPageState createState() => _DestinosPageState();
}

class _DestinosPageState extends State<DestinosPage> {
  List<Destinos> destinos = [
    Destinos(nome: "Paris", descricao: "Cidade luz", latitude: 48.8566, longitude: 2.3522, imagePath: "assets/images/paris.png", visitado: true),
  ];

  final List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    for (var destination in destinos) {

      markers.add(Marker(
        width: 40,
        height: 40,
        point: LatLng(destination.latitude, destination.longitude),
        builder: (ctx) => const Icon(
          Icons.location_on,
          color: Colors.red,
          size: 40,
        ),
      ));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Destinos Turísticos")),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(48.8566, 2.3522),
                zoom: 2.0,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              },
            child: const Text("Adicionar Destino Visitado"),
          ),
        ],
      ),
    );
  }
}
