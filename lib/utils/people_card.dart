import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/chat_screen.dart';

class PeopleCard extends StatelessWidget {
  const PeopleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (_) => const ChatScreen(name: 'Jack',),
        ));
      },
      child: Card(
        color: Colors.indigo.withOpacity(0.1),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: const Text(
              'Jack',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                letterSpacing: 1.4,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.amber[100],
            ),
          ),
        ),
      ),
    );
  }
}
