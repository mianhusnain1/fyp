import 'package:doctor/Screens/doctor/doctor_bottom_navigation.dart';
import 'package:doctor/main.dart';
import 'package:doctor/widgets/auth_dialogs.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: darkColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 8),
          child: ListView(
            children: [
              const SizedBox(
                height: 18,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "HealthCare",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black45,
                indent: 6,
                endIndent: 20,
              ),
              TileWidget(
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: "Home",
                ontap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: ((context) => DoctorBottomBar(
                            myCurrentindex: 0,
                          ))));
                },
              ),
              TileWidget(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: "Profile",
                ontap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const DoctorBottomBar()));
                  // Navigator.of(context).pop();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (_) => Services.me.role == "serviceProvider"
                  //         ? ServiceProfileScreen(
                  //             user: Services.serviceProvider,
                  //           )
                  //         : ClientProfileScreen(
                  //             user: Services.client,
                  //           ),
                  //   ),
                  // );
                },
              ),
              TileWidget(
                icon: const Icon(
                  Icons.info,
                  color: Colors.white,
                ),
                title: "About Us",
                ontap: () {
                  Navigator.of(context).pop();
                },
              ),
              const Divider(
                color: Colors.black45,
                indent: 6,
                endIndent: 20,
              ),
              TileWidget(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: "LogOut",
                ontap: () {
                  AuthDialogs().logOutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileWidget extends StatelessWidget {
  const TileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
  });
  final String title;
  final Icon icon;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
