import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:say_hi/logic/services/database_service.dart';
import 'package:say_hi/utils/people_card.dart';

import '../../logic/model/user_model.dart';

class MyChats extends StatelessWidget {
  const MyChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final firebaseUser = context.watch<User?>();

    return Container(
      color: Colors.blueGrey[400],
      child: firebaseUser == null ? const SizedBox() :StreamBuilder<List<UserModel>>(
        stream: DataBaseService().getUsers(firebaseUser.uid),
        builder: (_, AsyncSnapshot<List<UserModel>> snapshot){
          if(snapshot.hasData) {
            if(snapshot.data!.isNotEmpty){
              List<UserModel> users = snapshot.data!;
              return ListView.builder(
                itemBuilder: (_, index) => PeopleCard(
                  user: users[index],
                ),
                itemCount: users.length,
              );
            }else{
              return const Center(child: CupertinoActivityIndicator(),);
            }
          }else{
            return const Center(child: CupertinoActivityIndicator(),);
          }
        },
      ),
    );
  }
}
