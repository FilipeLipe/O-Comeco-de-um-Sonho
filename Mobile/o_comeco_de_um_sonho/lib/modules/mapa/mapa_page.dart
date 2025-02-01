import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa - OpenStreetMap"),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-23.550520, -46.633308), // Coordenadas de São Paulo, por exemplo
          zoom: 13.0,
        ),
        // layers: [
        //   TileLayerOptions(
        //     urlTemplate:
        //     "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        //     subdomains: const ['a', 'b', 'c'],
        //     userAgentPackageName: 'com.example.seuapp',
        //   ),
        //   // Você pode adicionar outros layers (por exemplo, markers) aqui
        // ],
      ),
    );
  }
}
