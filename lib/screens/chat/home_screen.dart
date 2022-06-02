import 'package:flutter/material.dart';
import 'package:say_hi/logic/services/auth_service.dart';

import 'my_chats.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        await AuthService().signOut();
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueGrey[700],
          title: const Text(
            'Say Hi',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.2,
              fontSize: 22,
            ),
          ),
        ),
        body: const MyChats(),
      ),
    );
  }
}