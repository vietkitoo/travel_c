import 'package:flutter/material.dart';
import 'package:travel_c/domain/repository/chat_bot_repository.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _chatMessages = [];
  final chatbotRepository = ChatBotRepositoryImpl();

  Future<String> _sendMessageToBot(String message) async {
    final chatModel =
    await chatbotRepository.getChatBotResponse(message: message);
    return chatModel.result ?? "";
  }

  void _sendAndReceiveMessage(String message) {
    setState(() {
      _chatMessages.add("You: $message");
    });

    _sendMessageToBot(message).then((botReply) {
      setState(() {
        print("Bot's Reply: $botReply");
        _chatMessages.add("Bot: $botReply");
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
                final isBotMessage = _chatMessages[index].startsWith("Bot:");
                final messageText = _chatMessages[index].replaceFirst(
                    RegExp(r'(You: |Bot: )'),
                    ''); // Loại bỏ "You: " hoặc "Bot: "
                return Align(
                  alignment: isBotMessage ? Alignment.centerLeft : Alignment
                      .centerRight,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: isBotMessage ? Colors.grey.shade300 : Colors.blue
                          .shade300,
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
