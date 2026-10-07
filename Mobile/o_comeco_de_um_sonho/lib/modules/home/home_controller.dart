import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../services/rest_service.dart';
import '../../utils/dialog_utils.dart';

class HomeController extends GetxController {

  var counter = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getFCMToken();
  }

  void increment() {
    counter.value++;
  }

  void getFCMToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("FCM Token: $token");
  }

}