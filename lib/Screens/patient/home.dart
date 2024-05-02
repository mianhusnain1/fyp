import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/ai%20assistance/screens/chat_screen.dart';
import 'package:doctor/widgets/health_needs.dart';
import 'package:doctor/widgets/navbar.dart';
import 'package:doctor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({super.key});

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text("Medical App"),
        backgroundColor: darkColor,
      ),
      backgroundColor: Colors.white,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22
          .0),
          child: const Column(
            // qst Column
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Text(
                  "Hi, Name",
                  style: TextStyle(
                      fontSize: 20,
                      color: darkColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                child: Text(
                  "How are you feeling?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: darkColor),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width - 30,
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search any thing",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 12),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AiChatScreen(),
                    ));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.only(left: 14),
                decoration: BoxDecoration(
                  color: lightColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: darkColor),
                ),
                child: Row(
                  children: [
                    Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          color: darkColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset("assets/imgs/ai.webp"),
                        )),
                    const SizedBox(
                      width: 18,
                    ),
                    const Text(
                      "Online Consultation",
                      style: TextStyle(
                        color: darkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(child: HealthNeeds())
          ],
        )
      ]),
      // bottomNavigationBar:
      //     BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.home_outlined),
      //     activeIcon: Icon(Icons.home),
      //     label: "Home",
      //   )
      // ]),
    );
  }
}
