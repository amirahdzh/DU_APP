import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nq_app/home.dart';
import 'package:nq_app/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nq_app/forgot_password_page.dart';

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

  late SharedPreferences prefs;

  // To check if user already login or not
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(Icons.person, size: 100, color: Colors.green),
                // App Name
                Text(
                  "DU APP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                      color: Colors.black),
                ),
                SizedBox(height: 10,),
                Text("Sign to continue", style: TextStyle(color: Colors.grey),),
                SizedBox(
                  height: 50,
                ),
                // Email text field
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
                  child: TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Email Address',
                      prefixIcon: Icon(Icons.mail),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: passwordcontroller,
                    obscureText: !passwordVisibility,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock),
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
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //forgot password button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ForgotPasswordPage();
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text(
                          "Forgot password",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                // Login button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: GestureDetector(
                    onTap: () async {
                      login();
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),

                // Log in as guest (developed soon)
                /* 
                 THE CODE
                */

                // SizedBox(height: 10,),

                Text(
                  'Or',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),

                SizedBox(
                  height: 20,
                ),

                // Login google
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const AlertDialog(
                                title: Text(
                                  "UNDER DEVELOPMENT",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.red),
                                ),
                              );
                            });
                        ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        width: 280,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                child: Image.network(
                                    'http://pngimg.com/uploads/google/google_PNG19635.png',
                                    fit: BoxFit.cover)),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Sign-in with Google',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                // Not a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Signup();
                        }));
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
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
