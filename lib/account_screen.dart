import 'package:flutter/material.dart';
import 'package:nq_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:nq_app/src/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = FirebaseAuth.instance.currentUser!;

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
        elevation: 0.0,
        title: Text(
          " Your Account",
          style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: duPrimaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(Icons.qr_code, color: duAccentColor,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  color: duPrimaryColor,
                ),
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Daarul Ummahaat",
                                style: TextStyle(
                                    color: duPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Text(
                            "0809 01 022287 53 7",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 30),
                          )
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(20, 13, 20, 13),
                      margin: EdgeInsets.all(20),
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        // image: DecorationImage(
                        //   image: AssetImage("assets/img/profile-pic.png"),
                        // ),
                      ),
                    ),
                    Text(
                      user.email!,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                              child: Container(
                                child: Text(
                                  "My Contact",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/img/logoLinkedin.png",
                                    width: 80,
                                  ),
                                  Image.asset(
                                    "assets/img/logoGmail.png",
                                    width: 80,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffe5e5e5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                              child: Container(
                                child: Text(
                                  "Visit My Website Portfolio",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Container(
                                child: Icon(
                                  Icons.file_copy,
                                  size: 60,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Color(0xffEC3137),
                        child: IconButton(
                          icon: Icon(
                            Icons.logout,
                            size: 50,
                            color: Colors.white,
                          ),
                          onPressed: () => logout(),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
