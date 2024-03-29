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

  static Future<void> showAlertDialog(
      BuildContext context, String title, String msg) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 20,
                bottom: 12,
              ),
              child: Text(
                msg,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Future<void> errorDialog(BuildContext context, String title, String massage, VoidCallback btn1) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(title),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 20,
              bottom: 12,
              
            ),
            child: Text(
              massage,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          TextButton(
            onPressed: btn1,
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }
}


class Fucntion {

} //must capital letter
