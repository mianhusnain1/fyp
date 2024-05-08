import 'package:flutter/cupertino.dart';

import '../models/ai_chat_model.dart';
import '../services/ai_apis.dart';

class AiChatProvider with ChangeNotifier {
  List<AiChatModel> chatList = [];
  List<AiChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(AiChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswers(
      {required String msg, required String chosenModelId}) async {
    if (chosenModelId.toLowerCase().startsWith("gpt")) {
      chatList.addAll(
        await ApiService.sendMessagechatGPT(
          message: msg,
          modelId: chosenModelId,
        ),
      );
    } else {
      chatList.addAll(
        await ApiService.sendMessage(
          message: msg,
          modelId: chosenModelId,
        ),
      );
    }
    notifyListeners();
  }
}
