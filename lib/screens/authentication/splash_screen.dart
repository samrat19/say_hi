import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
