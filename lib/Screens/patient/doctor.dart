import 'package:flutter/material.dart';

class NearbyDoctors extends StatelessWidget {
  const NearbyDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyDoctors.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(nearbyDoctors[index].profile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. ${nearbyDoctors[index].name}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text("General practitioner"),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow[700],
                        size: 18,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 4, right: 6),
                        child: Text(
                          "4.0",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text("195 Reviews")
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DoctorModel {
  final String name;
  final String position;
  final int averageReview;
  final int totalReviews;
  final String profile;
  DoctorModel({
    required this.name,
    required this.position,
    required this.averageReview,
    required this.totalReviews,
    required this.profile,
  });
}

final List<DoctorModel> nearbyDoctors = [
  DoctorModel(
    name: "Luke Holland",
    position: "General Practitioner",
    averageReview: 0,
    totalReviews: 0,
    profile: "assets/imgs/doctor_1.jpg",
  ),
  DoctorModel(
    name: "Sophie Harmon",
    position: "General Practitioner",
    averageReview: 0,
    totalReviews: 0,
    profile: "assets/imgs/doctor_2.jpg",
  ),
  DoctorModel(
    name: "Louise Reid",
    position: "General Practitioner",
    averageReview: 2,
    totalReviews: 0,
    profile: "assets/imgs/doctor_3.jpg",
  ),
];
