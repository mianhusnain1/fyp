import 'package:doctor/main.dart';
import 'package:flutter/material.dart';



class Dialogs {

static void showMessage1 (BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("")));
}

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

  Future<void> errorDialog(BuildContext context, String title, String massage, VoidCallback btn1 ) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(title),
        // backgroundColor: myColor,
        
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: InkWell(
                  hoverColor: Colors.blue,
                  focusColor: Colors.red,
                  onTap: btn1,
                  child: Text("Close")),

              ),
              Container(
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: Text("Got It")),
              )
            ],
          ),
          
          // TextButton(
          //   onPressed: btn1,
          //   child: const Text('Ok'),
          // )
        ],
      ),
    );
  }
}


class Fucntion {

} //must capital letter
