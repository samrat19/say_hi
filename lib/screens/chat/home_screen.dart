import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:say_hi/logic/services/auth_service.dart';

import 'my_chats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService get authService => GetIt.I<AuthService>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await authService.signOut();
        /*Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.of(context).pushReplacement(
          CupertinoPageRoute(
            builder: (_) => const CheckStatus(),
          ),
        );*/
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
