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
    Specialization(name: "Cardiologist", image: "assets/imgs/heart.png"),
    Specialization(name: "Orthopedic", image: "assets/imgs/bones.png"),
    Specialization(name: "Neurosurgeon", image: "assets/imgs/brainstorm.png"),
    Specialization(name: "Urologist", image: "assets/imgs/skin.png"),
    Specialization(name: "Dentist", image: "assets/imgs/tooth-medicine.png"),
    Specialization(name: "Pathology", image: "assets/imgs/kidney.png"),
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
                      specialization.image,
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
