import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:say_hi/utils/people_card.dart';

import '../../logic/services/database_service.dart';

class MyChats extends StatelessWidget {
  const MyChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = context.watch<List<UserModel>?>();

    return Container(
      color: Colors.blueGrey[400],
      child: users == null || users.isEmpty
          ? const Center(
              child: CupertinoActivityIndicator(),
            )
          : ListView.builder(
              itemBuilder: (_, index) => PeopleCard(
                user: users[index],
              ),
              itemCount: users.length,
            ),
    );
  }
}
