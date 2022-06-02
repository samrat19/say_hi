import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:say_hi/screens/authentication/welcome_screen.dart';
import 'package:say_hi/screens/chat/home_screen.dart';

import '../../logic/services/auth_service.dart';

class CheckStatus extends StatefulWidget {
  const CheckStatus({Key? key}) : super(key: key);

  @override
  State<CheckStatus> createState() => _CheckStatusState();
}

class _CheckStatusState extends State<CheckStatus> {
  AuthService get authService => GetIt.I<AuthService>();

  @override
  Widget build(BuildContext context) {
    ///todo a stream will be listened
    ///todo if no login found route to welcome screen
    ///todo if login found route to home screen
    return StreamBuilder<User?>(
      stream: authService.userAuthStream,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.blueGrey[700],
            body: const Center(
              child: Text(
                'Say Hi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                ),
              ),
            ),
          );
        } else if (snapshot.data == null) {
          return const WelcomeScreen();
        } else if (snapshot.data != null) {
          return const HomeScreen();
        } else {
          return Scaffold(
            backgroundColor: Colors.blueGrey[700],
            body: const Center(
              child: Text(
                'Say Hi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        CupertinoPageRoute(builder: (_) => const CheckStatus()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: const Center(
        child: Text(
          'Say Hi',
          style: TextStyle(
            color: Colors.white,
            fontSize: 120,
          ),
        ),
      ),
    );
  }
}
