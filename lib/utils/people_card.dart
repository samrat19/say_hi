import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../logic/model/user_model.dart';
import '../screens/chat/chat_screen.dart';

class PeopleCard extends StatelessWidget {

  final UserModel user;

  const PeopleCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (_) => ChatScreen(name: user.userName,receiverID: user.userID),
        ));
      },
      child: Card(
        color: Colors.indigo.withOpacity(0.1),
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              user.userName,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                letterSpacing: 1.4,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.amber[100],
              child: Text(user.userName[0].toUpperCase(),style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
