import 'package:doctor/Screens/doctor/chat/doctor_caht_user_card.dart';
import 'package:doctor/models/patient_model.dart';
import 'package:doctor/services/services.dart';
import 'package:doctor/widgets/service_main_header.dart';
import 'package:flutter/material.dart';

class DoctorInbox extends StatefulWidget {
  const DoctorInbox({super.key});

  @override
  State<DoctorInbox> createState() => _DoctorInboxState();
}

class _DoctorInboxState extends State<DoctorInbox> {
  List<PatientModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DoctorCustomAppBar(
            btn: false,
          ),
          Expanded(
            child: StreamBuilder(
                stream: Services.getServiceMyUsers(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(child: CircularProgressIndicator());
                    case ConnectionState.active:
                    case ConnectionState.done:
                      return StreamBuilder(
                        stream: Services.getServiceAllUsers(
                          snapshot.data?.docs.map((e) => e.id).toList() ?? [],
                        ),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                            case ConnectionState.none:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.active:
                            case ConnectionState.done:
                              final data = snapshot.data?.docs;
                              list = data
                                      ?.map((e) =>
                                          PatientModel.fromJson(e.data()))
                                      .toList() ??
                                  [];
                              if (list.isNotEmpty) {
                                return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.only(top: 6),
                                  itemCount: list.length,
                                  itemBuilder: (context, index) {
                                    return DoctorChatUSerCard(
                                      user: list[index],
                                    );
                                  },
                                );
                              } else if (list.isEmpty) {
                                return const Center(
                                  child: Text(
                                    'Start a new Chat 🙂',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    'Start a new Chat 🙂',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }
                          }
                        },
                      );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
