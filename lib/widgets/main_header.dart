// ignore_for_file: must_be_immutable

import 'package:doctor/auth/signup.dart';
import 'package:doctor/main.dart';
import 'package:doctor/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class PatientCustomAppBar extends StatelessWidget {
  PatientCustomAppBar({required this.btn, required this.isSearch, super.key});
  bool btn;
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 18),
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
            height: mq.height * .03,
          ),
          ProfileHeader(
            isButton: btn,
          ),
          isSearch
              ? const SizedBox(
                  height: 12,
                )
              : const SizedBox(
                  height: 6,
                ),
        ],
      ),
    );
  }
}
