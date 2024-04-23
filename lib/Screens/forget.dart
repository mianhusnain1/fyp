import 'package:doctor/widgets/diaolog.dart';
import 'package:doctor/Screens/done.dart';
import 'package:doctor/Screens/login.dart';
import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:doctor_app/screens/verify.dart';

class Forget extends StatefulWidget {
  const Forget({super.key});

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _emailkey = GlobalKey<FormState>();
  late Size mq;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      // ignore: sized_box_for_whitespace
      body: Container(
        height: double.infinity,
        width: mq.width,
        child: ListView(
          children: [
            Form(
              key: _emailkey,
              child: Column(
                children: [
                  const MainTop(),
                  const Logo(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        return value != null && value.isNotEmpty
                            ? null
                            : "Required";
                      },
                      decoration: InputDecoration(
                          label: const Text("Email"),
                          prefixIcon: const Icon(Icons.lock),
                          prefixIconColor: Colors.blue,
                          hintText: "Enter Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 6, left: 12)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: mq.width - 80,
                    child: InkWell(
                      onTap: () async {
                        if (_emailkey.currentState != null &&
                            _emailkey.currentState!.validate()) {
                          _emailkey.currentState!.save();
                        }

                        try {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              });
                          final auth = FirebaseAuth.instance;
                          await auth
                              .sendPasswordResetEmail(
                                  email: emailController.text)
                              .then((value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Done(
                                      btnmsg: "Back to Login",
                                      ontap1: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login(),
                                            ));
                                      },
                                      msg:
                                          "We have sent you an email. Please update your password and login again.",
                                    ),
                                  )));
                          Navigator.of(context).pop();
                        } on FirebaseAuthException catch (e) {
                          Navigator.of(context).pop();
                          if (e.code == "network-request-failed") {
                            Dialogs().errorDialog(context, "Error",
                                "Please Check your internet connection", () {
                              Navigator.of(context).pop();
                            });
                          } else {}
                        }
                      },
                      child: Container(
                        height: mq.height * 0.065,
                        width: mq.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: myColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 4,
                                  offset: const Offset(1, 1))
                            ]),
                        child: const Center(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            "Back to Login",
                            style: TextStyle(
                                color: myColor1,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
