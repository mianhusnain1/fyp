import 'package:doctor/main.dart';
import 'package:doctor/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthDialogs {
  Future<void> logOutDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        backgroundColor: Colors.white,
        title: const Text(
          'Logout',
          style: TextStyle(color: myColor1),
        ),
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 12, right: 20),
            child: Text(
              "Are you sure You want to\nLogout ?",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          color: myColor1, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut().then(
                          (value) => Navigator.pushNamedAndRemoveUntil(
                              context, loginroute, (route) => false),
                        );
                  },
                  child: const Text(
                    'Logout',
                    style:
                        TextStyle(color: myColor1, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
