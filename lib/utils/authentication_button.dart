import 'package:flutter/material.dart';

class AuthenticationButton extends StatelessWidget {
  final String title;

  const AuthenticationButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: width * 300 / 375,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(width * 12 / 375)),
          border: Border.all(color: Colors.white),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: width * 8 / 375,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 40 / 375,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
