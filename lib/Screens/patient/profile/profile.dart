import 'package:doctor/Screens/patient/home.dart';
import 'package:doctor/main.dart';
import 'package:doctor/widgets/dialogs.dart';
import 'package:flutter/material.dart';

class Appointment extends StatelessWidget {
  const Appointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: darkColor,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Dialogss().logOutDialog(context);
        },
        label: const Row(
          children: [
            Icon(
              Icons.logout,
            ),
            SizedBox(
              width: 6,
            ),
            Text("Logout")
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
