import 'package:doctor/Screens/Verify.dart';
import 'package:doctor/Screens/home.dart';
import 'package:doctor/Screens/login.dart';
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

const Color myColor = Color(0xFF72DDE8);
const Color myColor1 = Color(0xFF1D5761);

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
        useMaterial3: true,
      ),
      routes: {
        loginroute: (context) => const Login(),
        homeroute: (context) => const Home(),
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
            return const Home();
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
