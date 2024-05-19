import 'package:doctor/main.dart';
import 'package:doctor/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void showMassage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // static Future<void> showAlertDialog(
  //     BuildContext context, String title, String msg) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text(title),
  //       content: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  //             child: Text(
  //               msg,
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //           CircularProgressIndicator(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Future<void> errorDialog(
      BuildContext context, String title, String massage, VoidCallback btn1) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(
            title,
            style: const TextStyle(color: darkColor),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  massage,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: btn1,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(darkColor),
                    ),
                    child: const Text("Close",
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Got It",
                        style: TextStyle(color: darkColor, fontSize: 14)),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Future<void> logOutDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('LogOut'),
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 25, bottom: 12, right: 20),
            child: Text(
              "Are you sure You want to LogOut",
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
                    child: const Text('Cencel'),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut().then(
                          (value) => Navigator.of(context)
                              .pushNamedAndRemoveUntil(
                                  loginroute, (route) => false),
                        );
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> proccessDialog(
    BuildContext context,
    String massage,
  ) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Proccess image'),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              bottom: 12,
            ),
            child: Text(
              massage,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('English'),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Urdu'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Save image'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
