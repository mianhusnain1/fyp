// ignore_for_file: use_build_context_synchronously

import 'package:doctor/Screens/Verify.dart';
import 'package:doctor/Screens/diaolog.dart';
import 'package:doctor/Screens/login.dart';
import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';
import 'package:doctor/models/user_model.dart';
import 'package:doctor/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  
  
  
   const Signup({super.key });
  
  @override
  State<Signup> createState() => _SignupState();
}
late Size mq;
class _SignupState extends State<Signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String userType = "";
   String? _selectedSpecialization;
  List<String> _specializations = [
    'Cardiologist',
    'Orthopedic',
    'Neurosurgeon',
    'General Physician',
    // Add more specializations here if needed
  ];
 
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
                        color: myColor1,
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
   
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
         topRight: Radius.circular(20)
        ),
        
      ),
      
      child: userType == 'patient' ? _patient() : _doctor(),
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
    // SizedBox(
    //       height: MediaQuery.of(context).size.height * .01,
    //     ),
    //     const Text(
    //       "Welcome",
    //       style: TextStyle(
    //           fontSize: 26,
    //           fontWeight: FontWeight.w600,
    //           color: myColor1,
    //           letterSpacing: .4),
    //     ),
    SizedBox(height: 10,),
        SizedBox(
          height:  mq.height * .06,
           width: mq.width - 40,
          child: _inputField( namecontroller, isName:  true),
        ),
        const SizedBox(height: 15,),
        Container(
          height: 52,
          width: MediaQuery.of(context).size.width-40,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black87)
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(30),
              
              hint: Text('Select a specialization'),
              value: _selectedSpecialization,
              onChanged: (String? value) {
                setState(() {
                  _selectedSpecialization = value;
                });
              },
              items: _specializations.map((String specialization) {
                return DropdownMenuItem<String>(
                  value: specialization,
                  child: Text(specialization),
                );
              }).toList(),),
          ),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          height:  mq.height * .06,
          width: mq.width - 40,
          child: _inputField(emailcontroller, isName: false),

        ),
        const SizedBox(height: 15,),
        SizedBox(
          height: mq.height *0.06,
           width: mq.width - 40,
            child: _inputField(passwordcontroller,
        isPassword:  true),),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: mq.height *0.06,
          width:  mq.width - 40,
          child: _inputField(confirmpassword, isPassword:  true),
        ),
         const SizedBox(height: 15,),
        SizedBox(
          child: btn(title: "SIGN UP", action: () async{
            try {
              final auth = FirebaseAuth.instance;
              await auth 
              .createUserWithEmailAndPassword(
                email: emailcontroller.text.toString(), 
                password: passwordcontroller.text.toString()).then((value) => 
                Navigator.pushReplacement(context, MaterialPageRoute
                (builder: (context)=> const Verify())));

              
            } on FirebaseAuthException catch (e) {
              if (e.code == "email-already-in-use") {
                Dialogs().errorDialog(context, "Error", "Email Already in Use", () { Navigator.of(context).pop(); });
                
              } 
              else  if (e.code == "weak-password"){
                      Dialogs().errorDialog(context, "Error", "Weak Password", () { Navigator.of(context).pop();});
                      // Dialogs().errorDialog(context, "Error", "Weak Password");


                      
                    }
                    else if (
                      e.code == "network-request-failed"
                    ) {
                      Dialogs().errorDialog(context, "Error", "Network Issue", (){ Navigator.of(context).pop();});

                    }
                    else {
                      Dialogs().errorDialog(context, "Error", "Something Wents Wrong", (){Navigator.of(context).pop();}, );
                    }
            
              print("Error is $e");
              
            }
          }),
        ),
        const SizedBox(height: 15,),
             SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Already have an account?",
                style: TextStyle( fontSize: 15),), InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: ((context) => Login())));
                  },
                  child: Text(" Login", 
                  style:  TextStyle(
                    color: myColor1,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),),
                )],
              )
            )
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
    SizedBox(height: 10,),
    // SizedBox(
    //       height: MediaQuery.of(context).size.height * .01,
    //     ),
    //     const Text(
    //       "Welcome",
    //       style: TextStyle(
    //           fontSize: 26,
    //           fontWeight: FontWeight.w600,
    //           color: myColor1,
    //           letterSpacing: .4),
    //     ),
        SizedBox(
          height:  mq.height * .06,
          width: mq.width - 40,
          
          child: _inputField( namecontroller, isName:  true),
        ),
        const SizedBox(height: 15,),
        SizedBox(
          height:  mq.height * .06,
          width: mq.width - 40,
          child: _inputField(emailcontroller, isName: false),

        ),
        const SizedBox(height: 15,),
        SizedBox(
          height: mq.height *0.06,
          width: mq.width - 40,
           child: _inputField(passwordcontroller,
        isPassword:  true),),
       
       const SizedBox(height: 15,),

        SizedBox(

           height: mq.height *0.06,
           width: mq.width - 40,
          child: _inputField(confirmpassword, isPassword:  true)
        ),
        const SizedBox(height: 15,),
        SizedBox(child: btn(title: "SIGN UP", action: ()
        async{
            try {
              final auth = FirebaseAuth.instance;
              await auth 
              .createUserWithEmailAndPassword(
                email: emailcontroller.text.toString(), 
                password: passwordcontroller.text.toString()).then((value) => ()async{
                  final user = auth.currentUser;
                  final finaluser = UserModel(
                   name: namecontroller.text.toString(),
                   email: emailcontroller.text.toString(),
                   role: userType,);
                   await Services.firestore.collection("users").doc(user!.uid).set(finaluser.toJson());
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const Verify()),);
                });

              
            } on FirebaseAuthException catch (e) {
              if (e.code == "email-already-in-use") {
                Dialogs().errorDialog(context, "Error", "Email Already in Use", () { Navigator.of(context).pop(); });
                
              } 
              else  if (e.code == "weak-password"){
                      Dialogs().errorDialog(context, "Error", "Weak Password", () { Navigator.of(context).pop();});
                      // Dialogs().errorDialog(context, "Error", "Weak Password");


                      
                    }
                    else if (
                      e.code == "network-request-failed"
                    ) {
                      Dialogs().errorDialog(context, "Error", "Network Issue", (){ Navigator.of(context).pop();});

                    }
                    else {
                      Dialogs().errorDialog(context, "Error", "Something Wents Wrong", (){Navigator.of(context).pop();}, );
                    }
            
              print("Error is $e");
              
            }}),),
            const SizedBox(height: 15,),
             SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Already have an account?",
                style: TextStyle( fontSize: 15),), InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: ((context) => Login())));
                  },
                  child: Text(" Login", 
                  style:  TextStyle(
                    color: myColor1,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),),
                )],
              )
            )
        ],
    
  );
 }

Widget _inputField ( TextEditingController controller, 
{isPassword = false, isName = false } ){ //(isPassword and isName) they are optional parameters should are in curley brakets it means they are optional 
  return TextFormField(
    
    
    controller: controller,
    obscureText: isPassword 
    ? confirmpass
    : false,
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
        prefixIconColor: myColor1,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
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
         ? const Icon(Icons.visibility)
         : const Icon(Icons.visibility_off)))
    :null
    
  )
  );
 }
 }