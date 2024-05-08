import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doctor/main.dart';
import 'package:flutter/material.dart';

class AiChatWidget extends StatefulWidget {
  const AiChatWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;

  @override
  State<AiChatWidget> createState() => _AiChatWidgetState();
}

class _AiChatWidgetState extends State<AiChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: widget.chatIndex == 0
              ? EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .13,
                )
              : EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * .13,
                ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .02,
              vertical: MediaQuery.of(context).size.height * .01,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .018,
              vertical: MediaQuery.of(context).size.height * .008,
            ),
            decoration: BoxDecoration(
              color: widget.chatIndex == 0 ? lightColor : darkColor,
              border: Border.all(
                color: widget.chatIndex == 0 ? darkColor : Colors.black,
              ),
              borderRadius: widget.chatIndex == 0
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor:
                            widget.chatIndex == 0 ? darkColor : lightColor,
                        child: Center(
                            child: Text(
                          widget.chatIndex == 0 ? "P" : "AI",
                          style: TextStyle(
                            fontSize: 16,
                            color: widget.chatIndex == 0
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: widget.chatIndex == 0
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.msg,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            : widget.shouldAnimate
                                ? DefaultTextStyle(
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                    child: AnimatedTextKit(
                                      isRepeatingAnimation: false,
                                      repeatForever: false,
                                      displayFullTextOnTap: true,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          widget.msg.trim(),
                                        ),
                                      ],
                                    ),
                                  )
                                : Text(
                                    widget.msg.trim(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
