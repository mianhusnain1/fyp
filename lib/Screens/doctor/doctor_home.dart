import 'package:doctor/main.dart';
import 'package:doctor/widgets/auth_dialogs.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        title: const Text("Doctor Home"),
        actions: [
          IconButton(
              onPressed: () {
                AuthDialogs().logOutDialog(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
