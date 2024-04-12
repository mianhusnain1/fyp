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
import 'package:doctor/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signup extends StatefulWidget {
  
  
  
   Signup({super.key });
  
  @override
  State<Signup> createState() => _SignupState();
}
late Size mq;
class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String userType = "";
 
  // bool obscure = true;
  bool confirmpass = true;
  void selectUserType ( String user){
    setState(() {
      userType = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children:  [  
            Column(
            children: [ 
            const MainTop(),
            const Logo(),
            const SizedBox(child: Text("SIGN UP", style: 
                      TextStyle(
                        fontSize: 35, 
                        fontWeight: FontWeight.bold),),),
            SizedBox(
              child: _Bottom(),
              
            )
            ],
                        
            
          ), ]
        ),

      ),
    );
  }


Widget _Bottom(){
  
  return  SizedBox(
   
    child: Card(
      color: Colors.white,
      
      
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
         topRight: Radius.circular(20)
        ),
        
      ),
      child: userType == 'patient' ? _doctor() : _patient(),
    ),
  );
}

Widget _doctor(){
  return Column(
    children: [Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: InkWell(
            onTap: ()=> selectUserType('patient'),
            child: Container(
              height: 40,
              width: 100,
              // ignore: sort_child_properties_last
              child:  Center(
                child: Text("Patient",
                style: TextStyle(
                  color: userType == 'patient' ? Colors.black : Colors.black,
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              decoration: BoxDecoration(
                color: userType == 'patient' ? myColor : Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: myColor1
                )
                
              ),
              
            ),
          ),
          
        ),
        const SizedBox(width: 20,),
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: InkWell(
            onTap: ()=> selectUserType('doctor'),
            child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: userType == 'doctor' ? myColor :Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: myColor1
                )
                
              ),
            child:  Center(child: Text("Doctor",
            style: TextStyle(
              color: userType == 'doctor' ? Colors.black : Colors.black,
              fontWeight: FontWeight.w600
            ),)),
            ),
          ),
        ),
        
      ],
    ),
    SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        const Text(
          "Welcome, Sign Up",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
              letterSpacing: .4),
        ),
        SizedBox(
          height:  mq.height * .06,
          
          child: _inputField( namecontroller, isName:  true),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          height:  mq.height * .06,
          child: _inputField(emailcontroller, isName: false),

        ),
        const SizedBox(height: 15,),
        SizedBox(
          height: mq.height *0.06, child: _inputField(passwordcontroller,
        isPassword:  true),)
        ],
    
  );
}
 Widget _patient(){
  return Column(
    children: [Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: InkWell(
            onTap: ()=> selectUserType('patient'),
            child: Container(
              height: 40,
              width: 100,
              // ignore: sort_child_properties_last
              child:  Center(
                child: Text("Patient",
                style: TextStyle(
                  color: userType == 'patient' ? Colors.black : Colors.black,
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              decoration: BoxDecoration(
                color: userType == 'patient' ? myColor : Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: myColor1
                )
                
              ),
              
            ),
          ),
          
        ),
        const SizedBox(width: 20,),
        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: InkWell(
            onTap: ()=> selectUserType('doctor'),
            child: Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                color: userType == 'doctor' ? myColor :Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: myColor1
                )
                
              ),
            child:  Center(child: Text("Doctor",
            style: TextStyle(
              color: userType == 'doctor' ? Colors.black : Colors.black,
              fontWeight: FontWeight.w600
            ),)),
            ),
          ),
        ),
        
      ],
    ),
    SizedBox(
          height: MediaQuery.of(context).size.height * .01,
        ),
        const Text(
          "Welcome, Sign Up",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
              letterSpacing: .4),
        ),
        SizedBox(
          height:  mq.height * .06,
          
          child: _inputField( namecontroller, isName:  true),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          height:  mq.height * .06,
          child: _inputField(emailcontroller, isName: false),

        ),
        const SizedBox(height: 15,),
        SizedBox(
          height: mq.height *0.06, child: _inputField(passwordcontroller,
        isPassword:  true),),
        SizedBox(
          child: Text("data"),
        )
        ],
    
  );
 }

Widget _inputField ( TextEditingController controller, 
{isPassword = false, isName = false } ){ //(isPassword and isName) they are optional parameters should are in curley brakets it means they are optional 
  return TextFormField(
    
    controller: controller,
    obscureText: confirmpass,
    decoration: InputDecoration(
      label: Text(isPassword 
      ? "Password"
      : isName 
        ?"Name" 
        :"Email",
        style: const TextStyle(
          color:
         Colors.grey, 
         fontSize:  12),  ),
         prefixIcon: isPassword 
         ? const Icon(Icons.lock)
         : isName 
           ? const Icon(Icons.person)
           : const Icon(Icons.email),
           hintText: isPassword
          ? "Enter Password"
          : isName 
            ? "Enter Name"
            : "Enter Email",
        hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
        prefixIconColor: myColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          borderSide: BorderSide(color: Colors.blue),
    ),
    suffixIcon: isPassword 
    ? IconButton(onPressed: (){
      setState(() {
        confirmpass = !confirmpass;
      });
    }, icon: (
      confirmpass 
         ? Icon(Icons.visibility)
         : Icon(Icons.visibility_off)))
    :null
    
  )
  );
 }
 }