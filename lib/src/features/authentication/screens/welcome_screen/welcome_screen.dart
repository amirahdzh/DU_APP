import 'package:flutter/material.dart';
import 'package:nq_app/src/constants/colors.dart';
import 'package:nq_app/src/constants/sizes.dart';

import '../../../../constants/image_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(duDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(splashPic), height: height * 0.6,),
            Column(
              children: [
                Text("Selamat Datang", style: Theme.of(context).textTheme.headlineMedium,),
                Text("Silahkan Pilih", style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: (){}, style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  foregroundColor: duSecondaryColor,
                  side: BorderSide(color: duSecondaryColor),
                  padding: EdgeInsets.symmetric(vertical: 10)
                ),child: Text("login"))),
                const SizedBox(width: 8,),
                Expanded(child: ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  foregroundColor: Colors.white,
                  backgroundColor: duSecondaryColor,
                  side: BorderSide(color: duSecondaryColor),
                  padding: EdgeInsets.symmetric(vertical: 10)
                ), child: Text("login"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}