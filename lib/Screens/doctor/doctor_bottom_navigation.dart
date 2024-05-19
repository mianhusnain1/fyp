import 'package:doctor/Screens/doctor/Profile/doctor_profile.dart';
import 'package:doctor/Screens/doctor/chat/doctor_inbox.dart';
import 'package:doctor/Screens/doctor/doctor_home.dart';
import 'package:doctor/main.dart';
import 'package:doctor/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorBottomBar extends StatefulWidget {
  const DoctorBottomBar({super.key, this.myCurrentindex});
  final myCurrentindex;
  @override
  State<DoctorBottomBar> createState() => _DoctorBottomBarState();
}

class _DoctorBottomBarState extends State<DoctorBottomBar> {
  int myCurrentindex = 0;
  List pages = [
    const DoctorHomeScreen(),
    const DoctorInbox(),
    ServiceProfileScreen(
      user: Services.doctor,
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 8),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 25, color: Colors.grey.withOpacity(0.5))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: darkColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            currentIndex: myCurrentindex,
            selectedIconTheme: const IconThemeData(
              color: Colors.orange,
              size: 26,
            ),
            onTap: (value) {
              setState(() {
                myCurrentindex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble), label: "Inbox"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ),
      ),
      body: pages[myCurrentindex],
    );
  }
}
