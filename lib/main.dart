// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/Screens/doctor/doctor_home.dart';
import 'package:doctor/auth/Verify.dart';
import 'package:doctor/Screens/patient/home.dart';
import 'package:doctor/auth/login.dart';
import 'package:doctor/Screens/splash.dart';
import 'package:doctor/firebase_options.dart';
import 'package:doctor/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

const Color lightColor = Color(0xFF72DDE8);
const Color darkColor = Color(0xFF1D5761);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        loginroute: (context) => const Login(),
        homeroute: (context) => const PatientHome(),
      },
      home: const Splash(),
    );
  }
}

class BuilderScreen extends StatefulWidget {
  const BuilderScreen({super.key});

  @override
  State<BuilderScreen> createState() => _BuilderScreenState();
}

class _BuilderScreenState extends State<BuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          if (user.emailVerified) {
            return const UserDeciderScreen();
          } else {
            return const Verify();
          }
        } else {
          return const Login();
        }
      },
    );
  }
}

class UserDeciderScreen extends StatefulWidget {
  const UserDeciderScreen({super.key});

  @override
  State<UserDeciderScreen> createState() => _UserDeciderScreenState();
}

class _UserDeciderScreenState extends State<UserDeciderScreen> {
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<String> getUser() async {
    try {
      final snapshot = await firestore.collection("users").doc(user!.uid).get();
      final role = snapshot.data()?["role"];
      print("My role is -- $role");
      return role;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          // return const LoadingScreen();
          case ConnectionState.active:
          case ConnectionState.done:
            final role = snapshot.data;
            if (role == "patient" && role != null) {
              return const PatientHome();
            } else if (role == "doctor" && role != null) {
              return const DoctorHomeScreen();
            } else {
              return const Login();
            }
          default:
            return const Login();
        }
      },
    );
  }
}
