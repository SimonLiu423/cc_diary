import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatroom',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _user = const types.User(id: 'user-1');
  final _bot = const types.User(id: 'bot');
  List<types.Message> _messages = [];
  Dio _dio = Dio(); // Instance of Dio

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  Future<void> _handleSendPressed(types.PartialText message) async {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().toString(),
      text: message.text,
    );

    _addMessage(textMessage);

    final response = await _sendMessageToServer(message.text);
    _handleServerResponse(response);
  }

  Future<String> _sendMessageToServer(String text) async {
    log(Localizations.localeOf(context).toString());
    try {
      final response = await _dio.post(
        'http://192.168.235.3:5000/query', // Replace with your server URL
        data: {
          'question': text,
          'language': Localizations.localeOf(context).toString()
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200) {
        return response.data['answer'];
      } else {
        throw Exception('Failed to load response');
      }
    } catch (e) {
      return 'Sorry, I couldn’t fetch a response.';
    }
  }

  void _handleServerResponse(String reply) {
    final textMessage = types.TextMessage(
      author: _bot,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().toString(),
      text: reply,
    );

    _addMessage(textMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.chatBot)), //AppLocalizations.of(context)!.chatBot
      body: Chat(
        messages: _messages,
        onSendPressed: _handleSendPressed,
        user: _user,
      ),
    );
  }
}
