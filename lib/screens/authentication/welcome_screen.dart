import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:say_hi/screens/authentication/login_screen.dart';
import 'package:say_hi/screens/authentication/registration_screen.dart';
import 'package:say_hi/utils/authentication_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Padding(
        padding: EdgeInsets.all(width * 10 / 375),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: width * 65 / 375,
            ),
            Text(
              'Welcome to',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 60 / 375,
              ),
            ),
            Text(
              'Say Hi',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 80 / 375,
              ),
            ),
            const Expanded(flex: 3, child: SizedBox()),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  );
                },
                child: const AuthenticationButton(title: 'Sign In')),
            const Expanded(flex: 1, child: SizedBox()),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => const RegistrationScreen(),
                    ),
                  );
                },
                child: const AuthenticationButton(title: 'Sign Up')),
            const Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
