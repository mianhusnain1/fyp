// ignore_for_file: prefer_const_constructors

import 'package:doctor/Screens/Verify.dart';
import 'package:doctor/Screens/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();

  @override
  void initState() {
    emailcontroller;
    namecontroller;
    passwordcontroller;
    super.initState();
  }
   @override
  void dispose() {
     emailcontroller;
    namecontroller;
    passwordcontroller;
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
     body: SizedBox(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children:  [ Column(
          children: [
            const MainTop(),
            const Logo(),
            const SizedBox(),
            const SizedBox(
              child: Text(
                    "SIGN UP",
                    style: 
                    TextStyle(
                      fontSize: 35, 
                      fontWeight: FontWeight.bold),
                  ),
                
            ),
            const SizedBox(
              height: 20,),
             SizedBox(
              child:
             TextContainer(
              controller:  namecontroller,

              Icons: Icons.verified_user, 
              Search: "Name",
              isobscure: false)),
            const SizedBox(
              height: 20,),
             SizedBox(
              child: 
              TextContainer(
                controller:  emailcontroller,
                Icons: Icons.email, 
                Search: "Email", 
                isobscure: false),),
            const SizedBox(
              height: 20,),
             SizedBox(
              child: TextContainer(
                controller:  passwordcontroller,
                Icons: Icons.lock, 
                Search: "Password", 
                isobscure: true),
            ),
            const SizedBox(
              height: 20,
            ),
             SizedBox(
              child: TextContainer(
                controller: passwordcontroller,
                Icons: Icons.lock, 
                Search: "Confirm Password", 
                isobscure: true),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: btn(title: "SIGN UP", action: () async{
                print("email = ${emailcontroller.text}");
                            print("FDOne");
                try { 
                  final auth = FirebaseAuth.instance;
               await   auth 
                .createUserWithEmailAndPassword(
                  email: emailcontroller.text,   //here 
                  password: passwordcontroller.toString(),
                   ) .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Verify()));
                   });
                  

                  
                } catch (e) {
                  print("Error is : $e");
                }
              }),
            )
            // SizedBox(
            //   child: btn(title: "SIGN UP", action: (){}),
            // )

          ],
        )],
      ),
     ),
    ); }
}