import 'package:doctor/widgets/navbar.dart';
import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
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
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.only(left: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: darkColor),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: darkColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.video_call,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
