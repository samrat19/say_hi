import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:say_hi/utils/ui_elements.dart';

import '../../utils/authentication_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Expanded(flex: 5, child: SizedBox()),
            TextFormField(
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
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  );
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
