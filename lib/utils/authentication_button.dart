import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  final String title;

  const AuthenticationButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
