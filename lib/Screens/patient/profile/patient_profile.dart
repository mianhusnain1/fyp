import 'package:doctor/main.dart';
import 'package:doctor/widgets/diaolog.dart';
import 'package:flutter/material.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: darkColor,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Dialogs().logOutDialog(context);
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
      // bottomNavigationBar: const BottomNavigation(),
    );
  }
}
