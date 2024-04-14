// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

// import 'dart:html';

// import 'package:doctor_app/main.dart';
// import 'package:doctor_app/screens/booking.dart';
// import 'package:doctor_app/screens/video.dart';
// import 'package:doctor_app/widgets/widgets.dart';
import 'package:doctor/Screens/booking.dart';
import 'package:doctor/Screens/video.dart';
import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: myColor1,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Column(
              children: [
                const MainTop(),
                const SizedBox(),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 14),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          color: myColor1,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text(
                          "Your Wallet",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: MediaQuery.of(context).size.width * .22,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width - 200,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 4,
                                  offset: Offset(1, 3))
                            ]),
                        child: const Center(
                          child: Text(
                            "USE NOW",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height * .05,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 4,
                              offset: const Offset(1, 1))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: myColor1)),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 11.0),
                          child: Icon(
                            Icons.calendar_month,
                            color: myColor1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Your Appointments",
                            style: TextStyle(
                                color: myColor1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .045,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: myColor1)),
                  child: const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: "Search any Doctor",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
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
                          builder: (context) => Booking(),
                        ));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: myColor1)),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 9.0),
                          child: CircleAvatar(
                            backgroundColor: myColor,
                            radius: 30,
                            child: Icon(
                              Icons.calendar_month,
                              size: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Book Appointment",
                            style: TextStyle(
                                color: myColor1,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
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
                          builder: (context) => Video(),
                        ));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: myColor1)),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 9.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: myColor,
                            child: Icon(
                              Icons.video_call,
                              size: 45,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 9.0),
                          child: Text(
                            "Online Video Consultation",
                            style: TextStyle(
                                color: myColor1,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height:  MediaQuery.of(context).size.height * .2, 
                )
                // SizedBox(
                //   height: MediaQuery.of(context).size.height,
                //   width: MediaQuery.of(context).size.width,
                //   child: Row(
                //     children: [
                //       GridView.builder(
                //           shrinkWrap: true,
                //           gridDelegate:
                //               SliverGridDelegateWithFixedCrossAxisCount(
                //                   crossAxisCount: 1),
                //           itemCount: 10,
                //           itemBuilder: (BuildContext context, int index) {
                //             return Card(
                //               child: Container(
                //                 decoration: BoxDecoration(color: myColor1),
                //               ),
                //             );
                //           })
                //     ],
                //   ),
                // )

                ,
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width - 40,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 22.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .42,
                            decoration: BoxDecoration(
                                border: Border.all(color: myColor1),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        );
                      }),
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width - 40,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         height: MediaQuery.of(context).size.height * .2,
                //         width: MediaQuery.of(context).size.width * .42,
                //         decoration: BoxDecoration(
                //             border: Border.all(color: myColor1),
                //             borderRadius: BorderRadius.circular(20)),
                //       ),
                //       Container(
                //         height: MediaQuery.of(context).size.height * .2,
                //         width: MediaQuery.of(context).size.width * .42,
                //         decoration: BoxDecoration(
                //             border: Border.all(color: myColor1),
                //             borderRadius: BorderRadius.circular(20)),
                //       ),
                //     ],
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}
