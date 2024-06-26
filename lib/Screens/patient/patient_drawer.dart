import 'package:doctor/Screens/patient/all_catagory.dart';
import 'package:doctor/Screens/patient/home.dart';
import 'package:doctor/ai%20assistance/screens/ai_chat_screen.dart';
import 'package:doctor/main.dart';
import 'package:doctor/widgets/auth_dialogs.dart';
import 'package:flutter/material.dart';

class PatientDrawer extends StatelessWidget {
  const PatientDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: darkColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 8),
          child: ListView(
            children: [
              const SizedBox(
                height: 18,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "HealthCare",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black45,
                indent: 6,
                endIndent: 20,
              ),
              TileWidget(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: "Home",
                ontap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: ((context) => const PatientHome())));
                },
              ),
              TileWidget(
                icon: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: "About Us",
                ontap: () {
                  Navigator.of(context).pop();
                },
              ),
              const Divider(
                color: Colors.black45,
                indent: 6,
                endIndent: 20,
              ),
              TileWidget(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: "Find Doctor",
                ontap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const AllCatagoryScreen())));
                },
              ),
              TileWidget(
                icon: const Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                title: "Ai ChatBot",
                ontap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const AiChatScreen())));
                },
              ),
              TileWidget(
                icon: const Icon(
                  Icons.local_hospital,
                  color: Colors.white,
                ),
                title: "Hospitals",
                ontap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => const AiChatScreen())));
                },
              ),
              const Divider(
                color: Colors.black,
                indent: 6,
                endIndent: 20,
              ),
              TileWidget(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: "LogOut",
                ontap: () {
                  AuthDialogs().logOutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  const TileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
  });
  final String title;
  final Icon icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
