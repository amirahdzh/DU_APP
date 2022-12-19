import 'package:flutter/material.dart';
import 'package:nq_app/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
          "Account",
          style:
              TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color(0xff07a759),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Icon(Icons.search),
        //   )
        // ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 140,
                width: double.infinity,
                color: Color(0xff07a759),
              ),
              Column(
                children: [
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/img/profile-pic.png"),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        RichText(
                          text: TextSpan(
                              text: 'Hello,\n',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w300),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Amirah Dz H',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold))
                              ]),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
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
                                "My Contact",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    fontWeight: FontWeight.w600, fontSize: 20),
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
    );
  }
}
