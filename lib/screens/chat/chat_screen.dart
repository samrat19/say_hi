import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:say_hi/logic/model/message_model.dart';
import 'package:say_hi/logic/services/database_service.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String receiverID;

  const ChatScreen({Key? key, required this.name, required this.receiverID})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    double width = MediaQuery.of(context).size.width;

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
          widget.name,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.2,
            fontSize: width * 22 / 375,
          ),
        ),
      ),
      body: firebaseUser == null
          ? const SizedBox()
          : Stack(
              fit: StackFit.expand,
              children: [
                chatBody(
                  context,
                  widget.name,
                  width,
                  receiverID: widget.receiverID,
                  senderID: firebaseUser.uid,
                ),
                chatTextField(
                  context,
                  firebaseUser.uid,
                  widget.receiverID,
                  width,
                ),
              ],
            ),
    );
  }

  Widget chatBody(
      BuildContext context,String name, double width,{String? senderID, String? receiverID,}) {
    return Container(
      color: Colors.green[200],
      child: StreamBuilder<List<MessageModel>>(
        stream: DataBaseService().getMessages(receiverID!,senderID!),
        builder:
            (BuildContext context, AsyncSnapshot<List<MessageModel>> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const SizedBox();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.separated(
              separatorBuilder: (_, index) => const SizedBox(
                height: 1,
              ),
              itemBuilder: (_, index) {
                MessageModel message = snapshot.data![index];
                return Padding(
                  padding: EdgeInsets.all(width * 6 / 375),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (message.senderID.trim() == senderID.trim()) const Spacer(),
                      Flexible(
                        flex: 4,
                        child: Container(
                          color: Colors.amber[100],
                          child: Padding(
                            padding: EdgeInsets.all(width * 6 / 375),
                            child: Text(
                              message.text,
                              style: TextStyle(
                                fontSize: width * 16 / 375,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (message.senderID.trim() != senderID.trim()) const Spacer(),
                    ],
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget chatTextField(
      BuildContext context, String senderID, String receiverID, double width) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        controller: _messageController,
        style: TextStyle(
          fontSize: width * 15 / 375,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Type your message here.....',
          contentPadding: EdgeInsets.all(width * 6 / 375),
          suffix: GestureDetector(
            onTap: () async {
              MessageModel message = MessageModel(
                text: _messageController.text,
                name: '',
                senderID: senderID,
                receiverID: receiverID,
              );
              await DataBaseService().sendMessage(message.toJson());
              _messageController.clear();
            },
            child: const Icon(
              Icons.send,
              color: Colors.blueGrey,
            ),
          ),
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }
}
