// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor/Screens/patient/all_catagory.dart';
import 'package:doctor/ai%20assistance/screens/ai_chat_screen.dart';
import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(name: "Appointment", icon: 'assets/imgs/appointment.png'),
      CustomIcon(name: "Hospital", icon: 'assets/imgs/hospital.png'),
      CustomIcon(name: "Chatbot", icon: 'assets/imgs/ai.webp'),
      CustomIcon(name: "More", icon: 'assets/imgs/more.png'),
    ];
    List<CustomIcon> healthNeeds = [
      CustomIcon(name: "Appointment", icon: 'assets/imgs/appointment.png'),
      CustomIcon(name: "Hospital", icon: 'assets/imgs/hospital.png'),
      CustomIcon(name: "Chatbot", icon: 'assets/imgs/ai.webp'),
    ];
    List<CustomIcon> specialisedCared = [
      CustomIcon(name: "Cardiologist", icon: "assets/imgs/heart.png"),
      CustomIcon(name: "Orthopedic", icon: "assets/imgs/bones.png"),
      CustomIcon(name: "Dentist", icon: "assets/imgs/tooth-medicine.png"),
      CustomIcon(name: "Pathology", icon: "assets/imgs/kidney.png"),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(customIcons.length, (index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  if (index == customIcons.length - 1) {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: false,
                      builder: (context) {
                        return Container(
                          color: Colors.white,
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          height: 350,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // HEALTH NEEDS SECTION
                              const Text("Health Needs",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  healthNeeds.length,
                                  (index) {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (index ==
                                                healthNeeds.length - 1) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AiChatScreen()));
                                            } else if (index ==
                                                healthNeeds.length - 2) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AiChatScreen()));
                                            } else if (index ==
                                                healthNeeds.length - 3) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AllCatagoryScreen()));
                                            }
                                          },
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                              color:
                                                  lightColor.withOpacity(0.2),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              healthNeeds[index].icon,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(healthNeeds[index].name)
                                      ],
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              // SPECIALISED CARE SECTION

                              const Text("Specialised Care",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                  specialisedCared.length,
                                  (index) {
                                    return Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (index ==
                                                specialisedCared.length - 1) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AllCatagoryScreen()));
                                            } else if (index ==
                                                specialisedCared.length - 2) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AllCatagoryScreen()));
                                            } else if (index ==
                                                specialisedCared.length - 3) {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AllCatagoryScreen()));
                                            }
                                          },
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            padding: const EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                              color:
                                                  lightColor.withOpacity(0.2),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              specialisedCared[index].icon,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(specialisedCared[index].name)
                                      ],
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else if (index == customIcons.length - 2) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AiChatScreen()));
                  } else if (index == customIcons.length - 3) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllCatagoryScreen()));
                  } else if (index == customIcons.length - 4) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AllCatagoryScreen()));
                  }
                },
                borderRadius: BorderRadius.circular(90),
                child: Container(
                  width: 60,
                  height: 60,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: lightColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    customIcons[index].icon,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(customIcons[index].name)
            ],
          );
        }),
      ),
    );
  }
}

class CustomIcon {
  final String name;
  final String icon;

  CustomIcon({
    required this.name,
    required this.icon,
  });
}
