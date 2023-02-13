import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nq_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:nq_app/src/constants/colors.dart';
import 'package:nq_app/src/constants/image_strings.dart';
import 'package:nq_app/src/constants/sizes.dart';
import 'package:nq_app/src/constants/text_strings.dart';
import 'package:nq_app/src/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  top: splashController.animate.value ? 20 : -10,
                  left: splashController.animate.value ? duDefaultSize : 0,
                  child: Image(image: AssetImage(duIcon), width: 110)),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration: const Duration(milliseconds: 1600),
                  top: 150,
                  left: splashController.animate.value ? duDefaultSize : -80,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1600),
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          duName,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          duSloganName,
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration: Duration(milliseconds: 2000),
                  bottom: splashController.animate.value ? 230 : 0,
                  // left: duDefaultSize,
                  child: Image(
                    image: AssetImage(splashPic),
                    width: 400,
                  )),
            ),
            Obx(
              () => AnimatedPositioned(
                  duration: Duration(milliseconds: 2400),
                  bottom: 40,
                  right: duDefaultSize,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 2000),
                    opacity: splashController.animate.value ? 1 : 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: duPrimaryColor),
                    ),
                  )),
            ),
          ],
        ),
      ),
      // body: SizedBox(
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image(
      //         image: AssetImage(duIcon),
      //         width: 150,
      //       ),
      //       Text(
      //         duSloganName,
      //         textAlign: TextAlign.center,
      //         style: Theme.of(context).textTheme.titleSmall,
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       SpinKitRing(
      //         lineWidth: 3,
      //         color: Color(0xff07a759),
      //         size: 25.0,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}