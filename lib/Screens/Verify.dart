import 'package:doctor/Screens/diaolog.dart';
import 'package:doctor/Screens/login.dart';
import 'package:doctor/Screens/signup.dart';
import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Column(
              children: [
                const MainTop(),
                const Logo(),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: myColor1)),
                    width: MediaQuery.of(context).size.width - 80,
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "We have sent you a verification at your given email address. Please go to your email and verify your email.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: btn(title: "Verify", action: () async{
                    final user = FirebaseAuth.instance.currentUser;

                    try { await user!.sendEmailVerification().then((value) => (){
                      Dialogs().errorDialog(context, "Process", "We have sent you a verification email.", (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Login()));});
                       
                    });
                      
                    } catch (e) { 
                      print(e);
                      Dialogs().errorDialog(context, "Error", "Something Went Wrong", (){Navigator.of(context).pop;});
                      
                    }



                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                  })
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
