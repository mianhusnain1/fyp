import 'package:doctor/Screens/patient/home.dart';
import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Appointments"),
          backgroundColor: darkColor,
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
