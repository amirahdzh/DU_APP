import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nq_app/src/constants/colors.dart';
import 'package:nq_app/src/constants/image_strings.dart';
import 'package:nq_app/src/constants/sizes.dart';
import 'package:nq_app/src/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      backgroundColor: duPrimaryColor,
      body: Center(
        child: Obx(
          () => AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: splashController.animate.value ? 1 : 0,
              child: Image(image: AssetImage(duIconW), width: duSplashSize)),
        ),
      ),
    );
  }
}