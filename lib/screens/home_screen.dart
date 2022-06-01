import 'package:flutter/material.dart';

import 'my_chats.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text(
          'Say Hi',
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 1.2,
            fontSize: 22,
          ),
        ),
      ),
      body: const MyChats(),
    );
  }
}