// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:doctor/auth/forget.dart';
import 'package:doctor/auth/signup.dart';
import 'package:doctor/widgets/diaolog.dart';
import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';
import 'package:doctor/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _ketstate1 = GlobalKey<FormState>();
  bool _isobscure = true;
  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: mq.width,
        child: ListView(
          children: [
            Form(
              key: _ketstate1,
              child: Stack(children: [
                Column(
                  children: [
                    const MainTop(),
                    const Logo(),
                    const SizedBox(
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: emailcontroller,
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            } else {
                              return "Required";
                            }
                          },
                          decoration: InputDecoration(
                              label: const Text("Email"),
                              prefixIcon: const Icon(Icons.person),
                              prefixIconColor: darkColor,
                              hintText: "Enter Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: darkColor),
                              ),
                              contentPadding:
                                  const EdgeInsets.only(top: 6, left: 12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: passwordcontroller,
                        obscureText: _isobscure,
                        validator: (value) {
                          return value != null && value.isNotEmpty
                              ? null
                              : "Required";
                        },
                        decoration: InputDecoration(
                            label: const Text("Password"),
                            prefixIcon: const Icon(Icons.lock),
                            prefixIconColor: darkColor,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isobscure = !_isobscure;
                                  });
                                },
                                icon: const Icon(Icons.visibility)),
                            hintText: "Enter Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: darkColor),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 6, left: 12)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Forget()));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: btn(
                          title: "LOGIN",
                          action: () async {
                            if (_ketstate1.currentState != null &&
                                _ketstate1.currentState!.validate()) {
                              _ketstate1.currentState!.save();
                              try {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    });

                                final auth = FirebaseAuth.instance;
                                await auth
                                    .signInWithEmailAndPassword(
                                        email: emailcontroller.text,
                                        password: passwordcontroller.text)
                                    .then((value) => Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            userDecider, (route) => false));
                                Navigator.of(context).pop();
                              } on FirebaseAuthException catch (e) {
                                Navigator.of(context).pop();
                                if (e.code == "invalid-credential") {
                                  Dialogs().errorDialog(
                                      context, "Error", "Wrong Credentials",
                                      () {
                                    Navigator.of(context).pop();
                                  });
                                } else if (e.code == "network-request-failed") {
                                  Dialogs().errorDialog(context, "Nework Error",
                                      "Please check your internet connection",
                                      () {
                                    Navigator.of(context).pop();
                                  });
                                } else if (e.code == "unknown") {
                                  Dialogs().errorDialog(context, "Error",
                                      "An internal error has occured", () {
                                    Navigator.of(context).pop();
                                  });
                                }
                                print("Error is $e");
                              }
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an Account?"),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Signup(),
                                    ));
                              },
                              child: const Text(
                                " SIGN UP",
                                style: TextStyle(
                                    color: darkColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ))
                        ],
                      ),
                    ),

                    // const SizedBox(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       LoginButton(
                    //         img: "images/facebook.png",
                    //       ),
                    //       LoginButton(img: "images/Google.png"),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
               const  Positioned(
                    bottom: 20,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Text(
                            "By logging in, it means you are",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                         SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "agree to our ",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Terms and Conditions",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: darkColor,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.img});

  final String img;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: InkWell(
        // onTap: ontap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.086,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            img,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
