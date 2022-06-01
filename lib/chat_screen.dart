import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatScreen extends StatelessWidget {
  final String name;

  const ChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 1.2,
            fontSize: 22,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          chatBody(context),
          chatTextField(context),
        ],
      ),
    );
  }

  Widget chatBody(BuildContext context) {
    return Container(
      color: Colors.green[200],
    );
  }

  Widget chatTextField(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        style: const TextStyle(fontSize: 17,),
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Type your message here.....',
          contentPadding: EdgeInsets.all(8),
          suffixIcon: Icon(
            Icons.send,
            color: Colors.blueGrey,
          ),
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }
}
