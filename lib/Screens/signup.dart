// ignore_for_file: prefer_const_constructors

import 'package:doctor/Screens/Verify.dart';
import 'package:doctor/Screens/validation.dart';
import 'package:doctor/Screens/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _keystate = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  // void initState() {
  //   emailcontroller;
  //   namecontroller;
  //   passwordcontroller;
  //   confirmpassword;
  //   super.initState();
  // }
   @override
  void dispose() {
    emailcontroller.dispose();
    namecontroller.dispose();
    passwordcontroller.dispose();
    confirmpassword.dispose();
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
              Form(
                key: _keystate,
                child: Column(
                  children: [
                    Container(
                      
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                            BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(1, 1)
                            )
                          ]
                      ),
                      child: TextFormField(
                        
                                // onSaved: (value) =>
                                //     Services.me.name = value ?? "",
                                // validator: (val) => val != null && val.isNotEmpty
                                //     ? null
                                //     : "Required Field",
                               
                                decoration: InputDecoration(
                                  
                                  label: const Text(
                                    'Name',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Enter name",
                                  prefixIconColor: Colors.blue,
                                
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30)
                                      ,
                                      borderSide: BorderSide(color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      borderSide: BorderSide(color: Colors.blue)),
                                  contentPadding: EdgeInsets.only(
                                    top: 6,
                                    bottom: 6,
                                    left: 10,
                                  ),
                                ),
                              ),
                    ),
                //     Container(
                // decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.all(const Radius.circular(30)),
                //           boxShadow: const [
                //             BoxShadow(
                // color: Colors.grey,
                // blurRadius: 4,
                // offset: Offset(1, 1)
                //             )
                //           ]
                //         ),
                //         height: MediaQuery.of(context).size.height * 0.065,
                //         width: MediaQuery.of(context).size.width - 60,
                // child:
                // TextFormField(

                //             onSaved: (newValue) {
                              
                //             },
                //             controller: namecontroller,
                //             obscureText:false,
                //             decoration: InputDecoration(
                             
                //              prefixIcon: Icon(Icons.person, color: Colors.grey,),
                //              hintText: "Enter Your Name",
                //              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                //              hintStyle: const TextStyle(color: Colors.grey),
                //              border: InputBorder.none
                             
                //             ),
                //             validator: (value) {
                //               if (value == null || value == "" ) {
                //                 return "Required";

                                
                //               }
                //               else if(ValidationHub.isValidFullName(value)) {
                //                 return null;

                //               }
                //               else {
                //                 return "Only Alphabet Allowed";
                //               }
                              
                //             },
                //           ),
                //             //  TextContainer(
                //             //   controller:  namecontroller,
                
                //             //   Icons: Icons.verified_user, 
                //             //   Search: "Name",
                //             //   isobscure: false)
                // ),
                            const SizedBox(
                height: 20,),
                             Container(
                decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(const Radius.circular(30)),
                          boxShadow: const [
                            BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(1, 1)
                            )
                          ]
                        ),
                        
                height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width - 60,
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
                             Container(
                decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(const Radius.circular(30)),
                          boxShadow: const [
                            BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(1, 1)
                            )
                          ]
                        ),
                        
                height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width - 60,
                child: TextFormField(
                            
                            controller: passwordcontroller,
                            obscureText: true,
                            
                            decoration: InputDecoration(
                
                             
                             prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                             hintText: "Enter Password",
                             hintStyle: const TextStyle(color: Colors.grey),
                             border: InputBorder.none
                             
                            ),
                          ),
                            ),
                             SizedBox(
                height: 20,
                
                
                
                            ),
                             Container(
                decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(const Radius.circular(30)),
                          boxShadow: const [
                            BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(1, 1)
                            )
                          ]
                        ),
                        
                height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width - 60,
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
                  
                  
                  if (_keystate.currentState != null && _keystate.currentState!.validate())  {
                    _keystate.currentState!.save();
                  }
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
                  ],
                ),
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