import 'package:flutter/material.dart';
import 'package:nq_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  logout() async {
    await FirebaseAuth.instance.signOut();
    // prefs.setBool("isuserlogin", false);
    prefs.remove("isuserlogin");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) {
      return const Login();
    }), (route) => false);
  }

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff07a759),
        title: Text(
          "NQ APP",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold), //Color(0xff07a759)
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                logout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Feature(
                          iconName: Icons.app_registration,
                          title: "Registration"),
                      Feature(iconName: Icons.attach_money, title: "Donate"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 20, 20, 10),
                    child: Text(
                      "Program",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Program(
                    imagePath: "assets/img/program-1.jpeg",
                    nameProgram: "Asrama Tahfizh",
                    participantProgram: "Yatim, Dhuafa",
                  ),
                  Program(
                    imagePath: "assets/img/program-2.jpg",
                    nameProgram: "Tahfizh-Tahsin PP",
                    participantProgram: "Umum",
                  ),
                ], // attach_money_outlined , app_registration
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class Program extends StatelessWidget {
  final String imagePath;
  final String nameProgram;
  final String participantProgram;
  const Program({
    Key? key,
    required this.imagePath,
    required this.nameProgram,
    required this.participantProgram,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 250,
        child: Stack(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 10,
                child: SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nameProgram,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              participantProgram,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class Feature extends StatelessWidget {
  final IconData iconName;
  final String title;

  const Feature({Key? key, required this.iconName, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 80,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconName,
                size: 40,
                color: Color(0xff07a759),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
