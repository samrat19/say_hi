import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../logic/model/user_model.dart';
import '../screens/chat/chat_screen.dart';

class PeopleCard extends StatelessWidget {

  final UserModel user;

  const PeopleCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(CupertinoPageRoute(
          builder: (_) => ChatScreen(name: user.userName,receiverID: user.userID),
        ));
      },
      child: Card(
        color: Colors.blueGrey,
        elevation: 4,
        margin: EdgeInsets.all(width * 8 / 375),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(width * 12 / 375))),
        child: Padding(
          padding: EdgeInsets.all(width * 8 / 375),
          child: ListTile(
            title: Text(
              user.userName,
              style: TextStyle(
                fontSize: width * 18 / 375,
                color: Colors.white,
                letterSpacing: 1.4,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey[200],
              child: Text(user.userName[0].toUpperCase(),style: TextStyle(
                fontSize: width * 22 / 375,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
