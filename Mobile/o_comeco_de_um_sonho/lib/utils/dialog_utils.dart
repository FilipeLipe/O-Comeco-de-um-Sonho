import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DialogUtils {

  DialogUtils(){

  }

  static Future<void> showAlert(String message, String informacoes) async {
    Future.delayed(Duration(milliseconds: 100), ()
    {
      Get.dialog(
          AlertDialog(
              contentPadding: EdgeInsets.all(30),
              content: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: -10 * (3.141592653589793238 / 180),
                    child: Icon(
                      MdiIcons.exclamationThick,
                      size: 48,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          message,
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          informacoes,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              )
          )
      );
    });
  }

  static Future<void> showLoadingDialog(String message) async {
    Future.delayed(Duration(milliseconds: 10), () {
      Get.dialog(
        WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            contentPadding: EdgeInsets.all(30),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: -10 * (3.141592653589793238 / 180),
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        barrierDismissible: false,
      );

      Future.delayed(Duration(seconds: 10), () {
        if (Get.isDialogOpen == true) {
          Get.back(); 
          print('O processo demorou mais que 10 segundos.');
          showAlert("Erro GPS", "Não Conseguimos pegar sua posição via GPS, favor digitar manualmente");
        }
      });
    });
  }
}