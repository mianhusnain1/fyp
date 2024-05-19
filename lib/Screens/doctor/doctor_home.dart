import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/Screens/doctor/doctor_drawer.dart';
import 'package:doctor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:doctor/widgets/auth_dialogs.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

final user = FirebaseAuth.instance.currentUser;
FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<String> getUser() async {
  try {
    final snapshot = await firestore.collection("doctor").doc(user!.uid).get();

    final name = snapshot.data()?["name"];
    return name;
  } catch (e) {
    print(e);
    return e.toString();
  }
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: darkColor,
        title: const Text("Doctor Home"),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 25,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              FutureBuilder<String>(
                future: getUser(), // Calls getUser() asynchronously
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      "Hi, ${snapshot.data!.toUpperCase()}",
                      style: const TextStyle(
                        fontSize: 25,
                        color: darkColor,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  // Handle error case
                  return const Text(
                    "Hi, Guest",
                    style: TextStyle(
                      fontSize: 25,
                      color: darkColor,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
