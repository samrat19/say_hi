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
          style: const TextStyle(
            color: Colors.white,
            letterSpacing: 1.2,
            fontSize: 22,
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
                  firebaseUser.uid,
                  widget.receiverID,
                  widget.name,
                ),
                chatTextField(
                  context,
                  firebaseUser.uid,
                  widget.receiverID,
                ),
              ],
            ),
    );
  }

  Widget chatBody(
      BuildContext context, String senderID, String receiverID, String name) {
    return Container(
      color: Colors.green[200],
      child: StreamBuilder<List<MessageModel>>(
        stream: DataBaseService().getMessages(senderID, receiverID),
        builder:
            (BuildContext context, AsyncSnapshot<List<MessageModel>> snapshot) {
          if (snapshot.hasData) {
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (message.isByMe) const Spacer(),
                      Flexible(
                        flex: 4,
                        child: Container(
                          color: Colors.amber[100],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: message.isByMe
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  message.text,
                                  style: const TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (!message.isByMe) const Spacer(),
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
      BuildContext context, String senderID, String receiverID) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        controller: _messageController,
        style: const TextStyle(
          fontSize: 17,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Type your message here.....',
          contentPadding: const EdgeInsets.all(8),
          suffix: GestureDetector(
            onTap: () async {
              MessageModel message = MessageModel(
                text: _messageController.text,
                name: '',
                isByMe: true,
                senderID: senderID,
                receiverID: receiverID,
              );
              print(message.toJson().toString());
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
