// import 'package:final_project/uifp/view/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nq_app/home.dart';
// import 'package:nq_app/account_screen.dart';
import 'package:nq_app/src/features/authentication/screens/login/login_screen.dart';

import '../../../../constants/colors.dart';
// import 'package:nq_app/login.dart';
// import 'imageupload.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool passwordVisibility = false;
  bool passwordConfirmVisibility = false;

  bool passwordConfirmed() {
    if (_passwordController.text == _confirmPasswordController) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
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
                Icon(Icons.person, size: 100, color: duPrimaryColor),
                // App Name
                Text(
                  "DU APP",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 42,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Create a new account",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 50,
                ),
                // Email text field
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: duPrimaryColor),
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
                  height: 10,
                ),

                // Password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: !passwordVisibility,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: duPrimaryColor),
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

                // COnfirmation password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: !passwordConfirmVisibility,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: duPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: () => setState(
                          () => passwordConfirmVisibility =
                              !passwordConfirmVisibility,
                        ),
                        child: Icon(
                          passwordConfirmVisibility
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

                // Login button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: GestureDetector(
                    onTap: () async {
                      await registeruser();
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: duPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),

                // Already have an account?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () async {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Login();
                        }));
                      },
                      child: Text(
                        'Log in',
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

  registeruser() async {
    try {
      if (_emailController.text.isEmpty) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Enter correct email"),
              );
            });
      } else if (_passwordController.text.length < 6) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Password length should be minimum 6"),
              );
            });
      } else if (!passwordConfirmed()) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Password is not same!"),
              );
            });
      } else {
        final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        final currentUser = FirebaseAuth.instance.currentUser;
        assert(user.user!.uid == currentUser!.uid);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) {
          return const Home();
        }), (route) => false);
      }
      // ignore: empty_catches
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Password is weak"),
              );
            });
      } else {
        if (e.code == "email-already-in-use") {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  title: Text("Email already in use"),
                );
              });
        } else {
          return showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(e.code.toString()),
                );
              });
        }
      }
    }
  }
}
