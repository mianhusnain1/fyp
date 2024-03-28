// ignore_for_file: sized_box_for_whitespace

import 'package:doctor/Screens/widgets.dart';
import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
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
                    const MainTop(),
                    const SizedBox(
                      child: Text(
                        "Video Consultation",
                        style: TextStyle(
                            color: myColor1,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        width: mq.width - 40,
                        height: mq.height * 0.045,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: myColor1),
                            borderRadius: BorderRadius.circular(20)),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              hintText: "Search any Doctor"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: mq.height,
                      width: mq.width - 40,
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemCount: 20,
                          itemBuilder: (
                            BuildContext context,
                            int index,
                          ) {
                            return Card(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: myColor1,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    child: const Logo(),
                                  )),
                            );
                          }),
                    )
                  ],
                )
              ],
            )

            //   child: ListView(
            //     children: [
            //       const MainTop(),
            //       const SizedBox(
            //         child: Text(
            //           "Video Consultation",
            //           style: TextStyle(
            //             color: myColor1,
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       SizedBox(
            //         width: mq.width - 40,
            //         height: mq.height * 0.05,
            //         child: Center(
            //           child: TextField(
            //             decoration: InputDecoration(
            //               prefixIcon: const Icon(
            //                 Icons.search,
            //                 color: Colors.grey,
            //               ),
            //               hintText: "Search any Doctor",
            //               border: InputBorder.none,
            //               focusedBorder: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(20),
            //                 borderSide: const BorderSide(color: myColor1),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       SizedBox(
            //         height: mq.height,
            //         child: GridView.builder(
            //             shrinkWrap: true,
            //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisCount: 2,
            //                 crossAxisSpacing: 10,
            //                 mainAxisSpacing: 10),
            //             itemCount: 20,
            //             itemBuilder: (BuildContext context, int index) {
            //               return Card(
            //                 child: Center(
            //                     child: Container(
            //                   decoration: const BoxDecoration(
            //                     color: myColor1,
            //                   ),
            //                 )),
            //               );
            //             }),
            //       ),
            //     ],
            //   ),
            // ),
            ));
  }
}

// class BottomDecoration extends StatelessWidget {
//   final double height;
//   const BottomDecoration({
//     super.key,
//     required this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       SizedBox(
//         width: double.infinity,
//         child: Stack(
//           children: [
//             Positioned(
//               bottom: -50,
//               child: Transform.rotate(
//                 angle: 0.5,
//                 child: Container(
//                   height: height,
//                   width: mq.width * 0.4,
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20)),
//                       color: Color.fromARGB(255, 82, 188, 86)),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: -50,
//               right: 0,
//               child: Transform.rotate(
//                 angle: -0.5,
//                 child: Container(
//                   height: height,
//                   width: mq.width * 0.4,
//                   decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20)),
//                       color: Color.fromARGB(255, 82, 188, 86)),
//                 ),
//               ),
//             ),
//             Positioned(
//                 bottom: 0,
//                 left: mq.width * 0.25,
//                 child: Container(
//                   height: height * 0.545,
//                   width: mq.width * 0.5,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                           color: const Color.fromARGB(255, 28, 98, 30)
//                               .withOpacity(0.5),
//                           blurRadius: 5,
//                           spreadRadius: 7,
//                           offset: const Offset(0, 3))
//                     ],
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20)),
//                     gradient: const LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Color.fromARGB(255, 68, 192, 90),
//                         Color.fromARGB(255, 6, 48, 14)
//                       ],
//                     ),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     ]);
//   }
// }