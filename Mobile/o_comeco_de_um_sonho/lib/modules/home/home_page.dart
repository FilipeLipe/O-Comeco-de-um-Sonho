import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../../routes/app_routes.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        leadingWidth: 350,
        leading: ListTile(
          leading: Icon(MdiIcons.menu, size: 40, color: Colors.teal,),
          title: Text(
            'O Começo de um Sonho',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          onTap: () {
            final _state = _sideMenuKey.currentState;
            if (_state?.isOpened ?? false) {
              _state?.closeSideMenu();
            } else {
              _state?.openSideMenu();
            }
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Fotos/4.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight + 30),
            Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Text("BATATA")
                  ],
                ),
              ),
            ),
            Spacer(),
            Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                width: 50,
                height: 50,
                opacity: AlwaysStoppedAnimation(0.6)
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
