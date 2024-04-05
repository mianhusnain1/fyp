// // ignore_for_file: prefer_const_constructors

// import 'package:doctor/Screens/Verify.dart';
// import 'package:doctor/Screens/diaolog.dart';
// import 'package:doctor/Screens/validation.dart';
// import 'package:doctor/Screens/widgets.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
  
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final GlobalKey<FormState> _keystate = GlobalKey<FormState>();
//   TextEditingController emailcontroller = TextEditingController();
//   TextEditingController passwordcontroller = TextEditingController();
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController confirmpassword = TextEditingController();
//   bool _passicon = false;
//   bool _confirmpass = false;
//   @override

//   void dispose() {
//     emailcontroller.dispose();
//     namecontroller.dispose();
//     passwordcontroller.dispose();
//     confirmpassword.dispose();
//     super.dispose();
//   }
//   Widget build(BuildContext context) {


//     return Scaffold(
//      backgroundColor: Colors.white,
//      body: SizedBox(
//       height: double.infinity,
//       width: MediaQuery.of(context).size.width,
//       child: ListView(
//         children:  [ Column(
//           children: [
//             const MainTop(),
//             const Logo(),
//             const SizedBox(
//               child: Text(
//                     "SIGN UP",
//                     style: 
//                     TextStyle(
//                       fontSize: 35, 
//                       fontWeight: FontWeight.bold),
//                   ),
                
//             ),
//             const SizedBox(
//               height: 20,),
//               Form(
//                 key: _keystate,
//                 child: Column(
//                   children:
//                    [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                       child: TextFormField(
//                         controller: namecontroller,
//                         validator: (value) {
//                                       return value != null && value.isNotEmpty 
//                                       ? null
//                                       : "Required";
//                                     }, 
                      
//                         decoration: InputDecoration(
                          
//                           label: Text("Name"),
//                           prefixIcon: Icon(Icons.person),
//                           prefixIconColor: Colors.blue,
//                           hintText: "Enter Name",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
                          
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide(color: Colors.blue),
                            
//                           ),
//                           contentPadding: EdgeInsets.only(
//                             top: 6,
//                             left: 12
//                           )
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15,),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                       child: TextFormField(
//                         controller: emailcontroller,
//                         validator: (value) {
//                                       return value != null && value.isNotEmpty 
//                                       ? null
//                                       : "Required";
//                                     }, 
                      
//                         decoration: InputDecoration(
//                           label: Text("Email"),
//                           prefixIcon: Icon(Icons.person),
//                           prefixIconColor: Colors.blue,
//                           hintText: "Enter Email",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
                          
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide(color: Colors.blue),
                            
//                           ),
//                           contentPadding: EdgeInsets.only(
//                             top: 6,
//                             left: 12
//                           )
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15,),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                       child: TextFormField(
//                         obscureText: !_passicon,

//                         controller: passwordcontroller,
//                         validator: (value) {
//                                       return value != null && value.isNotEmpty 
//                                       ? null
//                                       : "Required";
//                                     }, 
                      
//                         decoration: InputDecoration(
//                           label: Text("Password"),
//                           prefixIcon: Icon(Icons.person),
//                           prefixIconColor: Colors.blue,
//                           suffixIconColor: Colors.black,
//                           suffixIcon: IconButton(
//                             onPressed: (){
//                               setState(() {
//                                 _passicon = !_passicon;
//                               });
//                             },
//                             icon: _passicon ? Icon(Icons.visibility_off) 
//                             : Icon(Icons.visibility)),
//                           hintText: "Enter Password",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
                          
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide(color: Colors.blue),
                            
//                           ),
//                           contentPadding: EdgeInsets.only(
//                             top: 6,
//                             left: 12
//                           )
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15,),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                       child: TextFormField(
//                         obscureText: !_confirmpass,
//                         controller: confirmpassword,
//                         validator: (value) {
//                                       if (value != null && value.isNotEmpty) {
//                                         if (passwordcontroller.text == confirmpassword.text) {
//                                           return null;

                                          
//                                         }
//                                         else {
//                                           return "Password did'nt matached";
//                                         }
                                    
//                                       } else {
//                                         return "Required";
                                        
//                                       }
//                                     }, 
                      
//                         decoration: InputDecoration(
//                           label: Text("Confirm Password"),
//                           prefixIcon: Icon(Icons.person),
//                           prefixIconColor: Colors.blue,
//                           suffixIcon: IconButton(
//                             onPressed: (){
//                               setState(() {
//                                 _confirmpass = !_confirmpass;
//                               });
//                             },
//                             icon: _confirmpass ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                            
                          
//                           ),
//                           suffixIconColor: Colors.black,
//                           hintText: "Confirm Password",
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
                          
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30),
//                             borderSide: BorderSide(color: Colors.blue),
                            
//                           ),
//                           contentPadding: EdgeInsets.only(
//                             top: 6,
//                             left: 12
//                           )
//                         ),
//                       ),
//                     ),

                
//                             SizedBox(height: 15,),
//                             SizedBox(
//                 child: btn(title: "SIGN UP", action: () async{
                  
                  
//                   if (_keystate.currentState != null && _keystate.currentState!.validate())  {
//                     _keystate.currentState!.save();
//                   }
//                   if (passwordcontroller.text == confirmpassword.text) {
//                     try { 
//                     final auth = FirebaseAuth.instance;
//                  await   auth 
//                   .createUserWithEmailAndPassword(
//                     email: emailcontroller.text,   //here 
//                     password: confirmpassword.toString(),
                    
//                      ) .then((value) {
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> Verify()));
//                      });
                    
                
                    
//                   }on FirebaseAuthException catch (e) {
//                     if ( e.code == "email-already-in-use") { 
//                       Dialogs().errorDialog(context, "Error", "Email Already in Use", () {Navigator.of(context).pop(); });
//                       // Dialogs().errorDialog(context, "Error", "Email Already in Use", button: (){});
                      
//                     } else  if (e.code == "weak-password"){
//                       Dialogs().errorDialog(context, "Error", "Weak Password", () { Navigator.of(context).pop();});
//                       // Dialogs().errorDialog(context, "Error", "Weak Password");


                      
//                     }
//                     else if (
//                       e.code == "network-request-failed"
//                     ) {
//                       Dialogs().errorDialog(context, "Error", "Network Issue", (){ Navigator.of(context).pop();});

//                     }
//                     else {
//                       Dialogs().errorDialog(context, "Error", "Something Wents Wrong", (){Navigator.of(context).pop();}, );
//                     }


//                     print("Error is : $e");
//                   }
                    
//                   }
//                 }),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             SizedBox(height: 10,)
                            
//                   ],
//                 ),
//               )
             
//             // SizedBox(
//             //   child: btn(title: "SIGN UP", action: (){}),
//             // )

//           ],
//         )],
//       ),
//      ),
//     ); }
// }
// Widget _patientSignup(){
//   return Form(
//     child: Text("data"),
//   );
// }
// Widget _doctorsignup(){
//   return Form(child: Text(":"),);
// }
import 'package:doctor/Screens/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Column(
          children: [MainTop(),
          Logo()],
        ),

      ),
    );
  }
}