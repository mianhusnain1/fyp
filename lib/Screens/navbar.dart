import 'package:flutter/material.dart';
class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
        UserAccountsDrawerHeader(
          accountName: Text(""), 
          accountEmail: Text(""),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset("images/Profile.jpg",
              height: 90,
              width: 80,),
              
            ) ,
          ),
        
          )
        ],
        
      ),
    );
  }
}