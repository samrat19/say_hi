import 'package:flutter/material.dart';

abstract class UIElements{
  static getDecoration(String hintText){
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.white,
      ),
      filled: true,
      fillColor: Colors.blueGrey[700],
      border: getBorder(),
      disabledBorder: getBorder(),
      focusedBorder: getBorder(),
      enabledBorder: getBorder(),
    );
  }

  static getBorder(){
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        color: Colors.white,
      ),
    );
  }
}