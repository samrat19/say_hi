import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:say_hi/logic/services/auth_service.dart';
import 'package:say_hi/screens/chat/home_screen.dart';
import 'package:say_hi/utils/ui_elements.dart';

import '../../utils/authentication_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthService get authService => GetIt.I<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Expanded(flex: 5, child: SizedBox()),
            TextFormField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              autofocus: true,
              decoration: UIElements.getDecoration('email ID'),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            TextFormField(
              controller: _passwordController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              autofocus: true,
              decoration: UIElements.getDecoration('password'),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            GestureDetector(
                onTap: () async{
                  var value = await authService.login(
                    _emailController.text,
                    _passwordController.text,
                  );
                  if (value == '1') {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    /*Navigator.of(context).pushReplacement(
                      CupertinoPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );*/
                  }
                },
                child: const AuthenticationButton(title: 'Sign In')),
            const Expanded(
              flex: 4,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
