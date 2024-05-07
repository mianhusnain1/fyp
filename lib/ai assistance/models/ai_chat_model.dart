class AiChatModel {
  final String msg;
  final int chatIndex;

  AiChatModel({required this.msg, required this.chatIndex});

  factory AiChatModel.fromJson(Map<String, dynamic> json) => AiChatModel(
        msg: json["msg"],
        chatIndex: json["chatIndex"],
      );
}
