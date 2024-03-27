import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';


import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  late Size mq;
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: mq.width,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: const MainTop(),
                ),
                const Text(
                  "Select Speciality",
                  style: TextStyle(
                      color: myColor1,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: mq.height * 0.045,
                  width: mq.width - 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 4,
                            spreadRadius: .1,
                            offset: const Offset(0, 1))
                      ]),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefix: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: "Search any Speciality",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: mq.width - 40,
                  height: mq.height,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: mq.height * 0.1,
                            width: mq.width - 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: myColor1)),
                          ),
                        );
                      }),
                ),
                SizedBox(),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
