// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/Screens/appointment.dart';
import 'package:doctor/Screens/done.dart';
import 'package:doctor/Screens/patient/doctor.dart';
import 'package:doctor/ai%20assistance/screens/chat_screen.dart';
import 'package:doctor/widgets/health_needs.dart';
import 'package:doctor/widgets/navbar.dart';
import 'package:doctor/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({super.key});

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  User? _user;
  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = currentUser;
    });
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
          width: MediaQuery.of(context).size.width - 35,
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Text(
                _user != null ? "Hi, ${_user!.email}" : "Hi, Name",
                style: const TextStyle(
                    fontSize: 20,
                    color: darkColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              child: Text(
                "How are you feeling?",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: darkColor),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: darkColor)),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: darkColor,
                  hintText: "Search any thing",
                  hintStyle: TextStyle(color: darkColor),
                  border: InputBorder.none,
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
                        builder: (context) => const Form(child: Text("data"))));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width - 40,
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
              height: 10,
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
          icon: Icon(Icons.calendar_month),
          activeIcon: Icon(Icons.calendar_month),
          label: "Appointments",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          activeIcon: Icon(Icons.chat_bubble),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.call_end_outlined),
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
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Appointment())));
            break;
        }
      },
    );
  }
}
