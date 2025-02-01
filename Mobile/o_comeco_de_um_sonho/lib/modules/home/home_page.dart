import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Cria uma GlobalKey para controlar o estado do SliderDrawer (para abrir/fechar)
  final GlobalKey<SliderDrawerState> _sliderDrawerKey = GlobalKey<SliderDrawerState>();

  // Widget que representa o menu lateral (slider)
  Widget _buildSlider() {
    return Container(
      color: Colors.teal,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.photo, color: Colors.white),
            title: const Text("Última Lembrança", style: TextStyle(color: Colors.white)),
            onTap: () {
              _sliderDrawerKey.currentState?.closeSlider();
              Get.toNamed(Routes.MEMORIAS);
            },
          ),
          ListTile(
            leading: const Icon(Icons.star, color: Colors.white),
            title: const Text("Conquistas", style: TextStyle(color: Colors.white)),
            onTap: () {
              _sliderDrawerKey.currentState?.closeSlider();
              Get.toNamed(Routes.CONQUISTAS);
            },
          ),
          ListTile(
            leading: const Icon(Icons.map, color: Colors.white),
            title: const Text("Destinos", style: TextStyle(color: Colors.white)),
            onTap: () {
              _sliderDrawerKey.currentState?.closeSlider();
              Get.toNamed(Routes.DESTINOS);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.white),
            title: const Text("Calendário do Casal", style: TextStyle(color: Colors.white)),
            onTap: () {
              _sliderDrawerKey.currentState?.closeSlider();
              Get.toNamed(Routes.CALENDARIO);
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.white),
            title: const Text("Informações do Casal", style: TextStyle(color: Colors.white)),
            onTap: () {
              _sliderDrawerKey.currentState?.closeSlider();
              Get.toNamed(Routes.INFO_CASAL);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChild() {
    return Container(
      color: Colors.transparent,
      child: ListView(
        children: [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        key: _sliderDrawerKey,
        appBar: SliderAppBar(
          config: SliderAppBarConfig(
            title: Text(
              "Home",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        sliderOpenSize: 250,
        animationDuration: 20,
        sliderBoxShadow: SliderBoxShadow(
          color: Colors.black26,
          spreadRadius: 20,
          blurRadius: 80
        ),
        slider: _buildSlider(),
        child: _buildChild(),
      ),
    );
  }
}
