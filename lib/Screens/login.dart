import 'package:doctor/Screens/forget.dart';
import 'package:doctor/Screens/home.dart';
import 'package:doctor/Screens/signup.dart';
import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: mq.width,
        child: ListView(
          
          children:  [
            Column(
              children: [
                const MainTop(),
            const Logo(),
            const SizedBox(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 40,),
                SizedBox(child: TextContainer(
                  controller: emailcontroller,
                  Icons: Icons.email, 
                  Search: "Username", 
                  
                  isobscure: false),),
                  const SizedBox(
                    height: 20
                  ),
                 SizedBox(
                    child: TextContainer(
                      controller:  passwordcontroller,
                      Icons: Icons.lock,
                      
                      Search: "Password", 
                      isobscure: true),
                  ),
                  // const SizedBox(height: 5
                  // ,),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const Forget()));
                    },
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const SizedBox(
                        child: Text("Forget Password?", style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    child: btn(title: "LOGIN", action: () async{ 
                      try {
                        final auth = FirebaseAuth.instance;
                        await auth.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),)),);
                      } catch (e) {
                        print("Error is $e");
                        
                      }
                    }),
                  ),
                  const SizedBox(height: 20,),
                  const SizedBox(
                    
                    child: Text("Or Login With", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:15
                    ),),
                  ),
                  const SizedBox(height: 10,),
                  const SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoginButton( img: "images/facebook.png", ),
                        
                        LoginButton(img: "images/Google.png"),
                       
                      ],
                    ),
                  ),
                   SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an Account?"),
                        InkWell(
                          onTap: (){
                           Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Signup(),
                          ));
                          }
                          ,
                          child: const Text(" SIGN UP", style: TextStyle(color: myColor, fontWeight: FontWeight.bold),))
                      ],
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:doctor/Screens/widgets.dart';
// import 'package:doctor/main.dart';
// import 'package:flutter/material.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   late Size mq;
//   @override
//   Widget build(BuildContext context) {
//     mq = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: myColor,
//       // appBar: AppBar(title: Text("Doctor App"), backgroundColor: Colors.amberAccent,),
//       body: Stack(
//         children: [
//           Positioned(top: 80, child : _buildTop()),
//           Positioned(bottom: 0,child: _buildBottom())
//         ],

        
//       ),
//     );
//   }
//   Widget _buildTop(){
//   return const SizedBox(
    
    
//     child: Logo()
//   );
// }
// Widget _buildBottom(){
//   return SizedBox(
//     child: Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30)
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(32.0),
//         child: _buildForm(),
//       ),
//     ),
    
//   );
// }

// Widget _buildForm(){
//   return const Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [Text("Welome", style: TextStyle(
//       color: myColor, fontSize: 32, fontWeight: FontWeight.w500
//     ),),
//     TextContainer(Icons: Icons.email, Search: "Email" , isobscure: false,),
//     SizedBox(height: 10,), // here i called the textcontainer that i created in widget file
//     TextContainer(Icons: Icons.lock, Search: "Password", isobscure: true,),
//     InkWell(
      
//       child: Padding(
//         padding: EdgeInsets.only(top: 5.0),
//         child: SizedBox(
//           child: Text("Forget Password", style: TextStyle(fontWeight: FontWeight.bold)),
//         ),
//       ),

    
    
//     ),

//     SizedBox(
//      height: 10,

//     ),
//     // SizedBox( child: _loginButton(),)
//     SizedBox(
//       child: LoginButton(),
//     )
//     ],
   
//   );
// }
// Widget _loginButton (){
//   return ElevatedButton(onPressed: (){}, 
//  style: ButtonStyle(),
  
  
//   child: Text("LOGIN"));
// }
// Widget _buildOtherlogin(){
//   return Center (child: Column(
//     children: [ const SizedBox( height: 10,),
//     Row(
//       mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
//       children: [
//         Tab(icon: Image.asset("assests/images/facebook.png"),),
//         Tab(icon: Image.asset("assests/images/twitter.png"),),
//         Tab(icon: Image.asset("assests/images/github.png"),)
//       ],
//     )],
//   ),);
// }

// }
class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.img});
// final VoidCallback ontap;
final String img;
  @override
  Widget build(BuildContext context) {
    
    return Semantics(
      button: true,
      child: InkWell(
        // onTap: ontap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.086,
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            
      
          ),
          child: Image.asset(img, fit: BoxFit.contain,),
        ),
      ),
    );
  }
}

