import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:say_hi/logic/services/auth_service.dart';
import 'package:say_hi/screens/chat/home_screen.dart';

import '../../utils/authentication_button.dart';
import '../../utils/ui_elements.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              autofocus: true,
              decoration: UIElements.getDecoration('Name'),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            TextFormField(
              controller: emailController,
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
              controller: passwordController,
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
                  var value = await authService.register(nameController.text,emailController.text, passwordController.text);
                  if(value == '1') {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    /*Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );*/
                  }
                },
                child: const AuthenticationButton(title: 'Sign Up')),
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
