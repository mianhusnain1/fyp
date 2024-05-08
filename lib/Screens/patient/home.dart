// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/Screens/patient/profile/profile.dart';
import 'package:doctor/Screens/patient/all_catagory.dart';
import 'package:doctor/Screens/patient/chat_screen.dart';
import 'package:doctor/ai%20assistance/screens/ai_chat_screen.dart';
import 'package:doctor/widgets/catagory_result.dart';
import 'package:doctor/widgets/catagory_widget.dart';
import 'package:doctor/widgets/diaolog.dart';
import 'package:doctor/widgets/health_needs.dart';
import 'package:doctor/widgets/navbar.dart';
import 'package:doctor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Specialization {
  final String name;
  final String image;

  Specialization({required this.name, required this.image});
}

class PatientHome extends StatefulWidget {
  const PatientHome({super.key});

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
// Step 2: Create a list of specializations with name and image
  final List<Specialization> specializations = [
    Specialization(name: "Cardiologist", image: "assets/imgs/heart.png"),
    Specialization(name: "Orthopedic", image: "assets/imgs/bones.png"),
    Specialization(name: "Neurosurgeon", image: "assets/imgs/brainstorm.png"),
    Specialization(name: "Urologist", image: "assets/imgs/skin.png"),
    Specialization(name: "Dentist", image: "assets/imgs/tooth-medicine.png"),
    Specialization(name: "Pathology", image: "assets/imgs/kidney.png"),
  ];

  bool _isSearching = false;
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<String> getUser() async {
    try {
      final snapshot = await firestore.collection("users").doc(user!.uid).get();
      final name = snapshot.data()?["name"];
      return name;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text("Medical App"),
        backgroundColor: darkColor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: MediaQuery.of(context).size.width - 25,
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 10),
            FutureBuilder<String>(
              future: getUser(), // Calls getUser() asynchronously
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Hi, ${snapshot.data!.toUpperCase()}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: darkColor,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                // Handle error case
                return const Text(
                  "Hi, Guest",
                  style: TextStyle(
                    fontSize: 20,
                    color: darkColor,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _isSearching
                      ? const Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search by catagory...",
                                contentPadding: EdgeInsets.only(top: -12)),
                          ),
                        )
                      : const Text(
                          "How are you feeling?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: darkColor),
                          textAlign: TextAlign.start,
                        ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearching = !_isSearching;
                      });
                    },
                    icon: _isSearching
                        ? const Icon(CupertinoIcons.clear_circled_solid)
                        : const Icon(Icons.search),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
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
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 14),
                decoration: BoxDecoration(
                  color: lightColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 4,
                      offset: const Offset(1, 1),
                    )
                  ],
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
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Browse by catagory",
                  style: TextStyle(
                    color: darkColor,
                    letterSpacing: .5,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllCatagoryScreen(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.orangeAccent.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: specializations.length,
                itemBuilder: (context, index) {
                  final catagory = specializations[index];
                  return CatagoryWidget(
                    name: catagory.name,
                    image: catagory.image,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CatagoryResult(catagory: catagory.name),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const SizedBox(
              child: Text("Health Needs",
                  style: TextStyle(
                      color: darkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(child: HealthNeeds()),
            const SizedBox(
              height: 10,
            ),
            const Text("Nearby Doctors",
                style: TextStyle(
                    color: darkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {},
              child: Container(
                height: 100,
                // width: double
                //     .infinity, // Ensure the container fills the available width
                decoration: BoxDecoration(
                  color: darkColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: darkColor),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 4, offset: Offset(1, 1))
                  ],
                  image: const DecorationImage(
                    image: AssetImage("assets/imgs/google-maps.webp"),
                    fit: BoxFit
                        .cover, // Ensure the image covers the entire container
                    alignment: Alignment
                        .center, // Center the image within the container
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          activeIcon: Icon(Icons.person),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          activeIcon: Icon(Icons.chat_bubble),
          label: "Inbox",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.call_end_outlined,
          ),
          activeIcon: Icon(Icons.call_end),
          label: "Helpline",
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PatientHome()),
            );
            break;
        }
        switch (index) {
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Appointment()));
            break;
        }
        switch (index) {
          case 2:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const PatientChatScreen())));
            break;
        }
        switch (index) {
          case 3:
            Dialogs().errorDialog(context, "Call Us",
                "          +92 316 1404158\n We are available 9am to 7pm.", () {
              Navigator.of(context).pop();
            });
        }
      },
    );
  }
}
