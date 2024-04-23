import 'package:doctor/main.dart';
import 'package:doctor/widgets/auth_dialogs.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            accountName: const Text(""),
            accountEmail: const Text(""),
            currentAccountPicture: CircleAvatar(
              radius: 20,
              child: ClipOval(
                child: Image.asset(
                  "images/Profile.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            shape: const Border(),
            focusColor: darkColor,
            tileColor: Colors.white,
            leading: const Icon(
              Icons.person,
            ),
            iconColor: darkColor,
            title: const Text(
              "Find a Doctor",
              style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            onTap: () {},
            shape: const Border(),
            focusColor: darkColor,
            tileColor: Colors.white,
            leading: const Icon(
              Icons.home,
            ),
            iconColor: darkColor,
            title: const Text(
              "Home",
              style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            onTap: () {},
            shape: const Border(),
            focusColor: darkColor,
            tileColor: Colors.white,
            leading: const Icon(
              Icons.person,
            ),
            iconColor: darkColor,
            title: const Text(
              "Instant Doctor",
              style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            onTap: () {},
            shape: const Border(),
            focusColor: darkColor,
            tileColor: Colors.white,
            leading: const Icon(
              Icons.checklist_outlined,
            ),
            iconColor: darkColor,
            title: const Text(
              "Terms & Conditions",
              style: TextStyle(color: darkColor, fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.arrow_forward),
          ),
          ListTile(
            tileColor: Colors.white,
            onTap: () async {
              Navigator.of(context).pop();
              AuthDialogs().logOutDialog(context);
            },
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            trailing: const Icon(Icons.arrow_forward),
          )
        ],
      ),
    );
  }
}
