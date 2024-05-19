import 'package:doctor/Screens/image_clip_view.dart';
import 'package:doctor/main.dart';
import 'package:doctor/services/services.dart';
// import 'package:doctor/widgets/auth_dialogs.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  @override
  void initState() {
    Services.doctorProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Services.doctor;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 28),
              decoration: const BoxDecoration(
                color: darkColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          ImageViewerClip(
                              urlImage: user.image, height: 48, width: 48),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning!",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade100,
                                ),
                              ),
                              Text(
                                user.name == ""
                                    ? "Hey There..."
                                    : user.name.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey.shade100,
                                  letterSpacing: .4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Switch(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green.shade400,
                          inactiveTrackColor: Colors.white,
                          value: user.availability,
                          onChanged: (newValue) {
                            setState(() {
                              user.availability = newValue;
                            });
                            Services.updateStatus(user.availability);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Good Morning!",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              user.name == ""
                                  ? "Hey There..."
                                  : user.name.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ImageViewerClip(
                            urlImage: user.image,
                            height: 55,
                            width: 55,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  if (user.city == "" ||
                      user.address == "" ||
                      user.phone == "" ||
                      user.bio == "")
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 12),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red.withOpacity(.3),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.black87,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Please update your profile e.g city, \naddress, phone no and bio etc for better\npatient experience",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
