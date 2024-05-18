// ignore_for_file: use_build_context_synchronously, avoid_print, non_constant_identifier_names

import 'package:doctor/auth/Verify.dart';
import 'package:doctor/models/client_model.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/widgets/dialogs.dart';
import 'package:doctor/auth/login.dart';
import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';
import 'package:doctor/models/user_model.dart';
import 'package:doctor/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

late Size mq;

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String userType = "";
  String? _selectedSpecialization;
  final List<String> _specializations = [
    'Cardiologist',
    'Orthopedic',
    'Neurosurgeon',
    'Urologist',
    'Dentist',
    'Pathology',
  ];
  bool isLoading = false;
  Future<void> patientSignUp() async {
    try {
      final newUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.toString(),
        password: passwordcontroller.text.toString(),
      );
      final pUser = UserModel(
        name: namecontroller.text.toString(),
        id: newUser.user!.uid,
        email: emailcontroller.text.toString(),
        role: userType,
      );
      await Services.firestore.collection("users").doc(newUser.user!.uid).set(
            pUser.toJson(),
          );
      final tUser = ClientModel(
        name: namecontroller.text.toString(),
        id: newUser.user!.uid,
        email: emailcontroller.text.toString(),
        image: newUser.user!.photoURL ?? "",
        phone: '',
        address: '',
        city: '',
      );
      await Services.firestore
          .collection("patient")
          .doc(newUser.user!.uid)
          .set(
            tUser.toJson(),
          )
          .then(
            (value) => {
              setState(() {
                isLoading = false;
              }),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Verify(),
                ),
              ),
            },
          );
    } on FirebaseAuthException catch (e) {
      print("Error is $e.code}");
      if (e.code == 'email-already-in-use') {
        setState(() {
          isLoading = false;
        });
        Dialogss()
            .errorDialog(context, 'Error Occured', "Email Already in use");
      } else if (e.code == 'weak-password') {
        setState(() {
          isLoading = false;
        });
        Dialogss().errorDialog(
            context, 'Error Occured', "Password must contained 6 letters");
      } else if (e.code == 'network-request-failed') {
        setState(() {
          isLoading = false;
        });
        Dialogss().errorDialog(context, 'Error Occured',
            "Bad Connection. Please check your internet");
      } else {
        setState(() {
          isLoading = false;
        });
        Dialogss()
            .errorDialog(context, 'Error Occured', "Something wents wrong");
      }
    }
  }

  Future<void> doctoreSignUp() async {
    try {
      final newUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.toString(),
        password: passwordcontroller.text.toString(),
      );
      final pUser = UserModel(
        name: namecontroller.text.toString(),
        id: newUser.user!.uid,
        email: emailcontroller.text.toString(),
        role: userType,
      );
      await Services.firestore.collection("users").doc(newUser.user!.uid).set(
            pUser.toJson(),
          );
      final time = DateTime.now().toString();
      final tUser = DoctorModel(
        name: namecontroller.text.toString(),
        id: newUser.user!.uid,
        email: emailcontroller.text.toString(),
        image: newUser.user!.photoURL ?? "",
        address: '',
        bio: '',
        phone: '',
        licence: '',
        city: '',
        schedule: '',
        availability: false,
        catagory: _selectedSpecialization!,
        created_at: time,
        wrong_id_card: false,
        wrong_licence: false,
      );
      await Services.firestore
          .collection("doctor")
          .doc(newUser.user!.uid)
          .set(
            tUser.toJson(),
          )
          .then(
            (value) => {
              setState(() {
                isLoading = false;
              }),
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Verify(),
                ),
              ),
            },
          );
    } on FirebaseAuthException catch (e) {
      print("Error is $e.code}");
      if (e.code == 'email-already-in-use') {
        setState(() {
          isLoading = false;
        });
        Dialogss()
            .errorDialog(context, 'Error Occured', "Email Already in use");
      } else if (e.code == 'weak-password') {
        setState(() {
          isLoading = false;
        });
        Dialogss().errorDialog(
            context, 'Error Occured', "Password must contained 6 letters");
      } else if (e.code == 'network-request-failed') {
        setState(() {
          isLoading = false;
        });
        Dialogss().errorDialog(context, 'Error Occured',
            "Bad Connection. Please check your internet");
      } else {
        setState(() {
          isLoading = false;
        });
        Dialogss()
            .errorDialog(context, 'Error Occured', "Something wents wrong");
      }
    }
  }

  bool confirmpass = true;
  void selectUserType(String user) {
    setState(() {
      userType = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          Column(
            children: [
              const MainTop(),
              const Logo(),
              const SizedBox(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      fontSize: 35,
                      color: darkColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                child: _Bottom(),
              )
            ],
          ),
        ]),
      ),
    );
  }

  Widget _Bottom() {
    return SizedBox(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: userType == 'patient' ? _patient() : _doctor(),
      ),
    );
  }

  Widget _doctor() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  selectUserType('patient');
                  print(userType);
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: userType == 'patient' ? lightColor : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: darkColor)),
                  child: Center(
                    child: Text(
                      "Patient",
                      style: TextStyle(
                          color: userType == 'patient'
                              ? Colors.black
                              : Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  selectUserType('doctor');
                  print(userType);
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: userType == 'doctor' ? lightColor : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: darkColor)),
                  child: Center(
                      child: Text(
                    "Doctor",
                    style: TextStyle(
                        color:
                            userType == 'doctor' ? Colors.black : Colors.black,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: mq.height * .06,
          width: mq.width - 40,
          child: _inputField(namecontroller, isName: true),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 40,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.black87)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(30),
              hint: const Text('Select a specialization'),
              value: _selectedSpecialization,
              onChanged: (String? value) {
                setState(() {
                  _selectedSpecialization = value!;
                });
              },
              items: _specializations.map((String specialization) {
                return DropdownMenuItem<String>(
                  value: specialization,
                  child: Text(specialization),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: mq.height * .06,
          width: mq.width - 40,
          child: _inputField(emailcontroller, isName: false),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: mq.height * 0.06,
          width: mq.width - 40,
          child: _inputField(passwordcontroller, isPassword: true),
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          child: btn(
              title: "SIGN UP",
              action: () async {
                print(_selectedSpecialization);
                if (userType != "") {
                  if (_selectedSpecialization != null) {
                    doctoreSignUp();
                  } else {
                    Dialogss().errorDialog(context, "Error Occured",
                        "Please select your specialization catagory first");
                  }
                } else {
                  Dialogss().errorDialog(
                      context, "Error Occured", "Please user catagory first");
                }
              }),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?",
              style: TextStyle(fontSize: 15),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => const Login())));
              },
              child: const Text(
                " Login",
                style: TextStyle(
                    color: darkColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ))
      ],
    );
  }

  Widget _patient() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  selectUserType('doctor');
                  print(userType);
                },
                child: Container(
                  height: 40,
                  width: 100,
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: Text(
                      "Patient",
                      style: TextStyle(
                          color: userType == 'patient'
                              ? Colors.black
                              : Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: userType == 'patient' ? lightColor : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: darkColor)),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  selectUserType('doctor');
                  print(userType);
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: userType == 'doctor' ? lightColor : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: darkColor)),
                  child: Center(
                      child: Text(
                    "Doctor",
                    style: TextStyle(
                        color:
                            userType == 'doctor' ? Colors.black : Colors.black,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: mq.height * .06,
          width: mq.width - 40,
          child: _inputField(namecontroller, isName: true),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: mq.height * .06,
          width: mq.width - 40,
          child: _inputField(emailcontroller, isName: false),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: mq.height * 0.06,
          width: mq.width - 40,
          child: _inputField(passwordcontroller, isPassword: true),
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          child: btn(
              title: "SIGN UP",
              action: () async {
                patientSignUp();
              }),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have an account?",
              style: TextStyle(fontSize: 15),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: ((context) => const Login())));
              },
              child: const Text(
                " Login",
                style: TextStyle(
                    color: darkColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ))
      ],
    );
  }

  Widget _inputField(TextEditingController controller,
      {isPassword = false, isName = false}) {
    //(isPassword and isName) they are optional parameters should are in curley brakets it means they are optional
    return TextFormField(
        controller: controller,
        obscureText: isPassword ? confirmpass : false,
        decoration: InputDecoration(
            label: Text(
              isPassword
                  ? "Password"
                  : isName
                      ? "Name"
                      : "Email",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            prefixIcon: isPassword
                ? const Icon(Icons.lock)
                : isName
                    ? const Icon(Icons.person)
                    : const Icon(Icons.email),
            hintText: isPassword
                ? "Enter Password"
                : isName
                    ? "Enter Name"
                    : "Enter Email",
            hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
            prefixIconColor: darkColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              borderSide: BorderSide(color: Colors.blue),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        confirmpass = !confirmpass;
                      });
                    },
                    icon: (confirmpass
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)))
                : null));
  }
}
