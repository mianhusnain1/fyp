// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:doctor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../providers/chats_provider.dart';
import '../providers/models_provider.dart';
import '../widgets/chat_widget.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  bool _isTyping = false;
  List<ChatProvider> chatList = [];
  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;

  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<ModelsProvider>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkColor,
        elevation: 2,
        title: const Text(
          "Medical AI Assistance",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                controller: _listScrollController,
                itemCount: chatProvider.getChatList.length,
                itemBuilder: (context, index) {
                  if (chatProvider.chatList.isNotEmpty) {
                    return InkWell(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            title: const Text('Copy text'),
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 25,
                                  right: 20,
                                  bottom: 12,
                                ),
                                child: Text(
                                  "Copy text to clipboard?",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 110),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 12,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                          'Cencel',
                                          style: TextStyle(
                                            color: darkColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Clipboard.setData(ClipboardData(
                                          text: chatProvider
                                              .getChatList[index].msg,
                                        )).then((value) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  "Text copy to ClipBoard"),
                                              duration: Duration(seconds: 3),
                                              backgroundColor: Colors.green,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
                                          );
                                        });
                                      },
                                      child: const Text(
                                        'Copy',
                                        style: TextStyle(
                                          color: darkColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      child: ChatWidget(
                        msg: chatProvider.getChatList[index].msg,
                        chatIndex: chatProvider.getChatList[index].chatIndex,
                        shouldAnimate:
                            chatProvider.getChatList.length - 1 == index,
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        "Start Chat",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            if (_isTyping) ...[
              const SizedBox(
                height: 14,
              ),
            ],
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: darkColor,
                size: 18,
              ),
            ],
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .012,
                horizontal: MediaQuery.of(context).size.width * .025,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              onSubmitted: (value) async {
                                await sendMessageFCT(
                                  modelsProvider: modelsProvider,
                                  chatProvider: chatProvider,
                                );
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              cursorColor: darkColor,
                              decoration: const InputDecoration(
                                counterStyle: TextStyle(
                                  height: 20,
                                ),
                                hintText: "Ask somthing...",
                                hintStyle: TextStyle(
                                  color: darkColor,
                                  fontSize: 15.5,
                                ),
                                border: InputBorder.none,
                              ),
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
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 12, right: 8),
                    shape: const CircleBorder(),
                    color: darkColor,
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      await sendMessageFCT(
                        modelsProvider: modelsProvider,
                        chatProvider: chatProvider,
                      );
                    },
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT(
      {required ModelsProvider modelsProvider,
      required ChatProvider chatProvider}) async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "You cant send multiple messages at a time",
          ),
          backgroundColor: darkColor,
        ),
      );
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please type a message",
          ),
          backgroundColor: darkColor,
        ),
      );
      return;
    }
    // try {
    //   String msg = textEditingController.text;
    //   setState(() {
    //     _isTyping = true;
    //     chatProvider.addUserMessage(msg: msg);
    //     textEditingController.clear();
    //     focusNode.unfocus();
    //   });
    //   await chatProvider.sendMessageAndGetAnswers(
    //     msg: msg,
    //     chosenModelId: modelsProvider.getCurrentModel,
    //   );
    //   setState(() {});
    // } catch (error) {
    //   log("Server error please try again leter");
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(
    //       error.toString(),
    //     ),
    //     backgroundColor: darkColor,
    //   ));
    // } finally {
    //   setState(() {
    //     scrollListToEND();
    //     _isTyping = false;
    //   });
    // }
  }
}
