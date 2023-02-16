import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nq_app/src/constants/colors.dart';
import 'package:nq_app/src/constants/sizes.dart';
import 'package:nq_app/src/constants/text_strings.dart';
import 'package:nq_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:nq_app/src/features/authentication/screens/register/register.dart';

import '../../../../constants/image_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: duAccentColor,
      body: Container(
        padding: EdgeInsets.all(duPaddingSize),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  duNameTwoRow.toUpperCase(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: duSecondaryColor),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: duPrimaryColor,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.15,
            ),
            Image(
              image: AssetImage(splashPic),
              width: 420,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text("Selamat Datang".toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: duSecondaryColor)),
                SizedBox(
                  height: 10,
                ),
                Text(duWelcomeHadith,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () => Get.to(() => const Login()),
                        
                        child: Text(duLogin.toUpperCase()))),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => Signup()),
                        
                        child: Text(duSignup.toUpperCase()))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
