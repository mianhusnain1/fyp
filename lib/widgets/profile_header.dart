// ignore_for_file: must_be_immutable
import 'package:doctor/Screens/image_clip_view.dart';
import 'package:doctor/services/services.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({
    required this.isButton,
    super.key,
  });
  bool isButton = false;
  @override
  Widget build(BuildContext context) {
    final image = Services.patient.image;
    final name = Services.patient.name;
    return Row(
      children: [
        isButton
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
        Row(
          children: [
            SizedBox(
              width: isButton ? 8 : 20,
            ),
            ImageViewerClip(urlImage: image, height: 48, width: 48),
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
                  name == "" ? "Hey There..." : name.toUpperCase(),
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
      ],
    );
  }
}
