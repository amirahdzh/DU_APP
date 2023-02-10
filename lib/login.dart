// import 'package:final_project/screen/contact.dart';
// import 'package:final_project/uifp/view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nq_app/account_screen.dart';
import 'package:nq_app/home.dart';
import 'package:nq_app/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:final_project/screen/Imageupload.dart';
import 'package:nq_app/register.dart';

// import 'CarouselScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool passwordVisibility = false;
  bool passworderror = false;
  bool emailerror = false;
  String passworderrortext = "";
  String emailerrortext = "";
  bool phonekeyboardvisible = false;
  bool isshowprogressindicator = false;

  late SharedPreferences prefs;

  checklogin() async {
    var userlogin = prefs.getBool("isuserlogin") ?? false;

    if (userlogin) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      }), (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
      checklogin();
    });

    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          // minimum: EdgeInsets.only(left: 10, right: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "NQ APP",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 42,
                      color: Color(0xff07a759)),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xFF656464),
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: emailcontroller,
                            obscureText: false,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(top: 18),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                color: Color(0xFF848383),
                                fontWeight: FontWeight.w300,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              prefixIcon: Icon(Icons.mail),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              color: Color(0xFF848383),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      if (emailerror)
                        Text(
                          emailerrortext,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xFF656464),
                            width: 0.5,
                          ),
                        ),
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 18),
                            hintText: 'Password',
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              size: 26,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: const Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (passworderror)
                        Text(
                          passworderrortext,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30, top: 15),
                      child: Text("Reset password"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Material(
                    child: GestureDetector(
                      onTap: () async {
                        login();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff07a759),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        alignment: const AlignmentDirectional(
                            -0.050000000000000044, 0),
                        child: const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: Text(
                            'Log In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Material(
                    child: GestureDetector(
                      onTap: () async {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xff07a759),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        alignment: const AlignmentDirectional(
                            -0.050000000000000044, 0),
                        child: const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                          child: Text(
                            'Log In as guest',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Material(
                    child: GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Signup();
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: const AlignmentDirectional(
                            -0.050000000000000044, 0),
                        child: const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                            child: Text(
                              'Dont have an account?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                              // decoration: BoxDecoration(color: Colors.blue),
                              child: Image.network(
                                  'http://pngimg.com/uploads/google/google_PNG19635.png',
                                  fit: BoxFit.cover)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() async {
    if (emailcontroller.text.isEmpty) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("Enter correct email"),
            );
          });
    } else if (passwordcontroller.text.length < 6) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              title: Text("Password length should be minimum 6"),
            );
          });
    } else {
      try {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailcontroller.text, password: passwordcontroller.text);
        // ignore: unnecessary_null_comparison
        if (user.user!.uid != null) {
          prefs.setBool("isuserlogin", true);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) {
            return const Home();
          }), (route) => false);
        } else {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("Something went wrong"),
                );
              });
        }
      } on FirebaseAuthException catch (e) {
        print(e);
        if (e.code == 'user-not-found') {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("User not registered"),
                );
              });
        } else {
          if (e.code == 'wrong-password') {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    title: Text("Wrong Password"),
                  );
                });
          } else {
            return showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(e.code),
                  );
                });
          }
        }
      }
    }
  }
}
