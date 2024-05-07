import 'package:doctor/Screens/patient/home.dart';
import 'package:doctor/main.dart';
import 'package:doctor/widgets/catagory_result.dart';
import 'package:flutter/material.dart';

class AllCatagoryScreen extends StatefulWidget {
  const AllCatagoryScreen({super.key});

  @override
  State<AllCatagoryScreen> createState() => _AllCatagoryScreenState();
}

class _AllCatagoryScreenState extends State<AllCatagoryScreen> {
  final List<Specialization> specializations = [
    Specialization(name: "Cardiologist", image: "assets/cardiologist.png"),
    Specialization(name: "Orthopedic", image: "assets/orthopedic.png"),
    Specialization(name: "Neurosurgeon", image: "assets/neurosurgeon.png"),
    Specialization(
        name: "General Physician", image: "assets/general_physician.png"),
    Specialization(name: "Dantist", image: "assets/general_physician.png"),
    Specialization(name: "Phrmacy", image: "assets/general_physician.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Catagories"),
        backgroundColor: darkColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: specializations.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final specialization = specializations[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CatagoryResult(catagory: specialization.name),
                    ));
              },
              child: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/imgs/doctor.png",
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 12),
                    Text(specialization.name),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
