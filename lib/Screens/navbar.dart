import 'package:doctor/main.dart';
import 'package:flutter/material.dart';
class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
        UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Colors.white
        ),
          accountName: const Text(""), 
          accountEmail: const Text(""),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.asset(
                "images/Profile.jpg",
                fit: BoxFit.cover,
              ),
              
              
            ) ,
            radius: 20,
          ),
        
          ),
          
        ListTile(
          onTap: () {},
          shape: Border(
          
          ),
          focusColor: myColor1,
          tileColor: Colors.white,
            leading: const Icon(Icons.person, ),
            iconColor: myColor1,
            title: const Text("Find a Doctor", 
            style: TextStyle(
              color: myColor1,
              fontWeight: FontWeight.bold
            ), ),
            trailing: const Icon(Icons.arrow_forward),
          ),
           ListTile(
          onTap: () {},
          shape: Border(
          
          ),
          focusColor: myColor1,
          tileColor: Colors.white,
            leading: const Icon(Icons.home, ),
            iconColor: myColor1,
            title: const Text("Home", 
            style: TextStyle(
              color: myColor1,
              fontWeight: FontWeight.bold
            ), ),
            trailing: const Icon(Icons.arrow_forward),
          )
        ],
        
      ),
    );
  }
}