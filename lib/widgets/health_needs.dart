// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(name: "Appointment", icon: 'assets/imgs/appointment.png'),
      CustomIcon(name: "Hospital", icon: 'assets/imgs/hospital.png'),
      CustomIcon(name: "Covid-19", icon: 'assets/imgs/virus.png'),
      CustomIcon(name: "More", icon: 'assets/imgs/more.png'),
    ];
    List<CustomIcon> healthNeeds = [
      CustomIcon(name: "Appointment", icon: 'assets/imgs/appointment.png'),
      CustomIcon(name: "Hospital", icon: 'assets/imgs/hospital.png'),
      CustomIcon(name: "Covid-19", icon: 'assets/imgs/virus.png'),
      CustomIcon(name: "Pharmacy", icon: 'assets/imgs/drug.png'),
    ];
    List<CustomIcon> specialisedCared = [
      CustomIcon(name: "Diabetes", icon: 'assets/imgs/blood.png'),
      CustomIcon(name: "Health Care", icon: 'assets/imgs/health_care.png'),
      CustomIcon(name: "Dental", icon: 'assets/imgs/tooth.png'),
      CustomIcon(name: "Insured", icon: 'assets/imgs/insurance.png'),
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
                                          onTap: () {},
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
                                          onTap: () {},
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
