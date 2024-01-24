import 'package:flutter/material.dart';
import 'package:travel_c/domain/chat_model.dart';
import 'package:travel_c/domain/repository/chat_bot_repository.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatModel> _chatMessages = [];
  final chatbotRepository = ChatBotRepositoryImpl();

  Future<ChatModel> _sendMessageToBot(String message) async {
    final chatModel =
        await chatbotRepository.getChatBotResponse(message: message);
    return chatModel;
  }

  void _sendAndReceiveMessage(String message) {
    setState(() {
      final sendMsg = ChatModel(result: "You: $message");
      _chatMessages.add(sendMsg);
    });
    _sendMessageToBot(message).then((botReply) {
      setState(() {
        print("Bot's Reply: $botReply");
        final msg = botReply.result ?? "";
        final botmsg = botReply.copyWith(result: "Bot: $msg");
        print(botmsg.result);
        _chatMessages.add(botmsg);
      });
    }).catchError((e) {
      print("Error: $e");
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel_C"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                final msg = _chatMessages[index].result ?? "";
                final isBotMessage = msg.startsWith("Bot:");
                final messageText = msg.replaceFirst(RegExp(r'(You: |Bot: )'),
                    ''); // Loại bỏ "You: " hoặc "Bot: "
                final imageurl = _chatMessages[index].image ?? "";
                return Column(
                  children: [
                    Align(
                      alignment: isBotMessage
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: isBotMessage
                              ? Colors.grey.shade300
                              : Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          messageText,
                          style: TextStyle(
                            fontSize: 16,
                            color: isBotMessage ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    if (imageurl.isNotEmpty)
                      Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 40, 10),
                          child: Image.network(imageurl)),
                  ],
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "Type a message...",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    String message = _messageController.text;
                    if (message.isNotEmpty) {
                      _sendAndReceiveMessage(message);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
