import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nq_app/home_screen.dart';
import 'package:nq_app/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/img/logoNQ.png"),
              width: 250,
            ),
            Text(
              "MENGAHAFAL AL-QURAN\nSEMUDAH TERSENYUM",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff07a759),
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitRing(
              color: Color(0xff07a759),
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
