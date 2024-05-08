import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

class CatagoryWidget extends StatelessWidget {
  const CatagoryWidget({
    super.key,
    required this.name,
    required this.image,
    required this.ontap,
  });
  final String name;
  final String image;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 14),
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: darkColor),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(image),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              name,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
