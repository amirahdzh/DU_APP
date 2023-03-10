// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nq_app/src/features/authentication/screens/login/login_screen.dart';

import '../screens/welcome_screen/welcome_screen.dart';

class SplashScreenController extends GetxController{
  static SplashScreenController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 2500));
    Get.to(() => WelcomeScreen());
  }
}