import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widget/CustomText.dart';
import '../../widget/CustomTitle.dart';
import 'introducao_controller.dart';
import '../../routes/app_routes.dart';

class IntroducaoPage extends StatefulWidget {
  @override
  _IntroducaoState createState() => _IntroducaoState();
}

class _IntroducaoState extends State<IntroducaoPage> {

  final IntroducaoController controller = Get.put(IntroducaoController());

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Concluir',
        finishButtonStyle: FinishButtonStyle(
          splashColor: Colors.teal.shade200,
          elevation: 2,
          highlightElevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          backgroundColor: Colors.teal ,
        ),
        onFinish: () async {
          controller.completeOnboarding(context);
        },
        background: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Image.asset('assets/Fotos/1.jpeg', height: 600,opacity: AlwaysStoppedAnimation(0.05)),
          ),
          Image.asset('assets/Fotos/3.jpeg'),
        ],
        totalPage: 2,
        speed: 1.8,
        pageBodies: [
          _buildBemVindoPage(),
          _buildPermissionsPage()
        ],
      ),
    );
  }

  Widget _buildBemVindoPage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Transform.translate(
            offset: Offset(20, 20),
            child: CustomText(
              text: 'Olá',
            ),
          ),
          CustomTitle(
            text: 'Raissa'
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CustomText(
              text: "Esse aplicativo é uma dedicação a você, a muito tempo viemos tendo varias aventuras"
            ),
          ),

          Transform.translate(
              offset: Offset(10, 0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                    width: 60,
                    height: 60,
                    opacity: AlwaysStoppedAnimation(0.5)
                  ),
                  SizedBox(width: 20,),
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                    width: 80,
                    height: 80,
                    opacity: AlwaysStoppedAnimation(0.7)
                  ),
                ],
          )),
          SizedBox(height: 35),
        ],
      ),
    );
  }

  Widget _buildPermissionsPage() {
    return Obx((){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              'Permissões',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.teal, height: 1),
            ),
            SizedBox(height: 30),

            Row(
              children: <Widget>[
                Icon(MdiIcons.mapMarker, size: 30, color: Colors.teal),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top 1',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Texto',
                        style: TextStyle(fontSize: 16, height: 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            Row(
              children: <Widget>[
                Icon(MdiIcons.microphone, size: 30, color: Colors.teal),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Top 2',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Texto',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              'Titulo',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.teal, height: 1),
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Icon(MdiIcons.alert, size: 30, color: Colors.teal),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Texto"
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
