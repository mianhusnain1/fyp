// ignore_for_file: avoid_print
import 'package:doctor/Screens/doctor/doctor_details.dart';
import 'package:doctor/main.dart';
import 'package:doctor/models/doctor_model.dart';
import 'package:doctor/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchedCatagory extends StatefulWidget {
  const SearchedCatagory({
    super.key,
    required this.catagory,
  });
  final String catagory;

  @override
  State<SearchedCatagory> createState() => _SearchedCatagoryState();
}

class _SearchedCatagoryState extends State<SearchedCatagory> {
  List<DoctorModel> list = [];
  List<DoctorModel> newList = [];
  @override
  Widget build(BuildContext context) {
    final catagory = widget.catagory;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        title: Text(catagory),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  'Showing Result For "$catagory"',
                  style: const TextStyle(
                    color: darkColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: StreamBuilder(
                stream: Services.getDoctorIds(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ));
                    case ConnectionState.none:
                      return const Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ));
                    case ConnectionState.active:
                    case ConnectionState.done:
                      return StreamBuilder(
                        stream: Services.getDoctors(
                          snapshot.data?.docs.map((e) => e.id).toList() ?? [],
                        ),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              );
                            case ConnectionState.none:
                              return const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              );
                            case ConnectionState.active:
                            case ConnectionState.done:
                              final data = snapshot.data?.docs;
                              list = data
                                      ?.map(
                                          (e) => DoctorModel.fromJson(e.data()))
                                      .toList() ??
                                  [];
                              newList.clear();
                              for (var i in list) {
                                if (i.catagory == widget.catagory) {
                                  newList.add(i);
                                }
                              }
                              if (newList.isNotEmpty) {
                                print(newList.length);
                                return ListView.builder(
                                  itemCount: newList.length,
                                  itemBuilder: (context, index) {
                                    final data = newList[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DoctorDetails(
                                                        doctor: data)),
                                          );
                                        },
                                        child: Card(
                                          color: Colors.grey.shade200,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                18,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 6),
                                              child: ListTile(
                                                // leading: ImageViewerClip(
                                                //   urlImage: data.image,
                                                //   height: 55,
                                                //   width: 55,
                                                // ),
                                                title: Text(
                                                  data.name.toUpperCase(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                subtitle: Text(data.catagory),
                                                trailing: Container(
                                                  height: 38,
                                                  width: 90,
                                                  decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: const Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          CupertinoIcons
                                                              .chat_bubble_2,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(
                                                          width: 6,
                                                        ),
                                                        Text(
                                                          "Ask",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const Center(
                                  child: Text(
                                    'There is no Doctor availabe yet  😢',
                                    style: TextStyle(
                                      fontSize: 16,
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
