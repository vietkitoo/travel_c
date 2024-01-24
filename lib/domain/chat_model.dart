class ChatModel {
  final String? result;
  final String? image;

  const ChatModel({
    this.result,
    this.image,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      result: json['result'] as String?,
      image: json['image'] as String?,
    );
  }

  ChatModel copyWith({String? result, String? image}) {
    return ChatModel(
      result: result ?? this.result,
      image: image ?? this.image,
    );
  }
}
