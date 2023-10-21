import 'package:dio/dio.dart';
import 'package:travel_c/domain/chat_model.dart';
import 'package:travel_c/infrastructure/client/dio_client.dart';

abstract class ChatBotRepository {
  Future<ChatModel> getChatBotResponse({
    required String message,
  });
}

class ChatBotRepositoryImpl extends ChatBotRepository {
  final dioClient = DioClient();

  ChatBotRepositoryImpl();

  @override
  Future<ChatModel> getChatBotResponse({
    required String message,
  }) async {
    final response = await dioClient.requestPost(
      'fetch',
      data: {
        'Text': message,
      },
    );

    return ChatModel.fromJson(response.data);
  }
}
