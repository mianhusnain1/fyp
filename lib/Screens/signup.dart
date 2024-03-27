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
  TextEditingController confirmpassword = TextEditingController();

  @override
  void initState() {
    emailcontroller;
    namecontroller;
    passwordcontroller;
    confirmpassword;
    super.initState();
  }
   @override
  void dispose() {
     emailcontroller;
    namecontroller;
    passwordcontroller;
    confirmpassword;
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
              TextFormField(
            
            controller: namecontroller,
            obscureText:false,
            
            decoration: InputDecoration(
              
             
             prefixIcon: Icon(Icons.person, color: Colors.grey,),
             hintText: "Enter Your Name",
             hintStyle: const TextStyle(color: Colors.grey),
             border: InputBorder.none
             
            ),
          ),
            //  TextContainer(
            //   controller:  namecontroller,

            //   Icons: Icons.verified_user, 
            //   Search: "Name",
            //   isobscure: false)
              ),
            const SizedBox(
              height: 20,),
             SizedBox(
              child: 
              TextFormField(
            
            controller: emailcontroller,
            obscureText:false,
            
            decoration: InputDecoration(
              
             
             prefixIcon: Icon(Icons.email, color: Colors.grey,),
             hintText: "Enter Your Email",
             hintStyle: const TextStyle(color: Colors.grey),
             border: InputBorder.none
             
            ),
          ),),
            const SizedBox(
              height: 20,),
             SizedBox(
              child: TextFormField(
            
            controller: namecontroller,
            obscureText: true,
            
            decoration: InputDecoration(
              
             
             prefixIcon: Icon(Icons.lock, color: Colors.grey,),
             hintText: "Enter Password",
             hintStyle: const TextStyle(color: Colors.grey),
             border: InputBorder.none
             
            ),
          ),
            ),
            const SizedBox(
              height: 20,
            ),
             SizedBox(
              child: TextFormField(
            
            controller: confirmpassword,
            obscureText: true,
            
            decoration: InputDecoration(
              
             
             prefixIcon: Icon(Icons.lock, color: Colors.grey,),
             hintText: "Confirm Password",
             hintStyle: const TextStyle(color: Colors.grey),
             border: InputBorder.none
             
            ),
          ),
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
                  password: confirmpassword.toString(),
                  
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