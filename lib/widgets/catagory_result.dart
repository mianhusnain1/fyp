import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

class CatagoryResult extends StatefulWidget {
  const CatagoryResult({super.key, required this.catagory});
  final String catagory;

  @override
  State<CatagoryResult> createState() => _CatagoryResultState();
}

class _CatagoryResultState extends State<CatagoryResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medical App"),
        centerTitle: true,
        backgroundColor: darkColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              'Searching result for "${widget.catagory}"...',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: darkColor,
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
