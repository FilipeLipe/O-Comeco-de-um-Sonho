import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:io' show Platform;
import '../../routes/app_routes.dart';

class IntroducaoController extends GetxController {


  static final loc.Location _locationService = loc.Location();

  var permissaoLocalizacaoConcedida = false.obs;
  var termsAccepted = false.obs;

  @override
  void onInit() {
    super.onInit();
    verificaPermissoes();
  }

  Future<void> verificaPermissoes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    permissaoLocalizacaoConcedida.value = prefs.getBool('permissaoLocalizacaoConcedida') ?? false;
    termsAccepted.value = prefs.getBool('termsAccepted') ?? false;
  }

  Future<void> requestPermissions() async {

    if (Platform.isIOS) {

      permissaoLocalizacaoConcedida.value = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('permissaoLocalizacaoConcedida', true);



    }else if (Platform.isAndroid) {
      await requestLocationPermission();
    }


  }

  Future<void> requestLocationPermission() async {
    PermissionStatus status = await Permission.location.request();

    PermissionStatus status2 = await Permission.location.status;
    print('Permissão do location: $status2');

    if (status.isGranted) {
      permissaoLocalizacaoConcedida.value = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('permissaoLocalizacaoConcedida', true);
    } else if (status.isPermanentlyDenied) {
      print('LOCATION TA DANDO ERRO');
      openAppSettings();
    }
  }

  Future<void> completeOnboarding(BuildContext context) async {
    if (!permissaoLocalizacaoConcedida.value) {
      if (Platform.isIOS) {
        requestPermissions();
      }else{
        await requestPermissions();
      }
    }

    if (permissaoLocalizacaoConcedida.value) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('introducaoCompleted', true);
      Get.offAllNamed(Routes.HOME);
    }
  }
}
