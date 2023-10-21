class ChatModel {
  final String? result;

  const ChatModel({
    this.result,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      result: json['result'] as String?,
    );
  }
}
