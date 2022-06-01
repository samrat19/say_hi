import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 2,child: SizedBox()),
        TextFormField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.blueGrey,
          ),
        ),
      ],
    );
  }
}
