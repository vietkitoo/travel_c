import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _messageController = TextEditingController();
  List<String> _chatMessages = [];

  Future<String> _sendMessageToBot(String message) async {
    final response = await http.post(
      Uri.parse("https://response-answer.onrender.com/fetch"),
      body: jsonEncode({"Text": message}),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      final botReply = responseJson["result"];

      // Convert the bot's reply from UTF-8 to a different encoding if needed
      String formattedBotReply = utf8.decode(utf8.encode(botReply));

      return formattedBotReply;
    } else {
      throw Exception('Failed to send message to bot');
    }
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
        title: Text("Travel_C"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  key: Key(index.toString()),
                  title: Text(
                    _chatMessages[index],
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
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
