// ignore_for_file: deprecated_member_use, avoid_print
import 'dart:io';
import 'package:doctor/Screens/patient/chat/patient_massage_card.dart';
import 'package:doctor/main.dart';
import 'package:doctor/models/message_model.dart';
import 'package:doctor/models/patient_model.dart';
import 'package:doctor/services/services.dart';
import 'package:doctor/widgets/popbutton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DoctorChatScreen extends StatefulWidget {
  const DoctorChatScreen({super.key, required this.user});
  final PatientModel user;

  @override
  State<DoctorChatScreen> createState() => _DoctorChatScreenState();
}

class _DoctorChatScreenState extends State<DoctorChatScreen> {
  bool _isUploading = false;
  List<MessageModel> _list = [];
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = widget.user;
    print("Widget rebuild");
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 235, 250, 254),
        appBar: AppBar(
          backgroundColor: darkColor,
          leading: const BackPopButton(
            color: Colors.white,
            bgcolor: darkColor,
          ),
          title: Text(
            // .capitalizes with velocity x
            "Chatting with ${user.name}",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: Services.getServiceMessages(widget.user),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return const Center(
                        child: SizedBox(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      final data = snapshot.data!.docs;
                      _list = data
                          .map(
                            (e) => MessageModel.fromJson(e.data()),
                          )
                          .toList();

                      if (_list.isNotEmpty) {
                        return ListView.builder(
                          reverse: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(top: 6),
                          itemCount: _list.length,
                          itemBuilder: (context, index) {
                            return MassageCard(
                              message: _list[index],
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text(
                            'Start a Chat with user 🙂',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      }
                  }
                },
              ),
            ),
            if (_isUploading)
              const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 20,
                    ),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )),
            _chatInput(),
          ],
        ),
      ),
    );
  }

// bootom field
  Widget _chatInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * .01,
        horizontal: MediaQuery.of(context).size.width * .025,
      ),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      onTap: () {},
                      controller: _textController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: "Type somthing...",
                        contentPadding: EdgeInsets.only(left: 8),
                        hintStyle: TextStyle(
                          color: darkColor,
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final List<XFile> images =
                          await ImagePicker().pickMultiImage(
                        imageQuality: 60,
                      );
                      for (var i in images) {
                        setState(() => _isUploading = true);
                        await Services.sendServiceChatImage(
                                widget.user, File(i.path))
                            .then((value) {
                          setState(() => _isUploading = false);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.image,
                      size: 26,
                      color: darkColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final XFile? image = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                        imageQuality: 60,
                      );
                      if (image != null) {
                        setState(() => _isUploading = true);
                        await Services.sendServiceChatImage(
                                widget.user, File(image.path))
                            .then((value) {
                          setState(() => _isUploading = false);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      size: 28,
                      color: darkColor,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .015,
                  )
                ],
              ),
            ),
          ),
          MaterialButton(
            minWidth: 0,
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 8),
            shape: const CircleBorder(),
            color: darkColor,
            onPressed: () {
              if (_textController.text.isNotEmpty) {
                if (_list.isEmpty) {
                  Services.sendServiceFirstMessage(
                      widget.user, _textController.text, Type.text);
                } else {
                  Services.sendServiceMessage(
                      widget.user, _textController.text, Type.text);
                }
                _textController.text = '';
              }
            },
            child: const Icon(
              Icons.send,
              color: Colors.white,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
