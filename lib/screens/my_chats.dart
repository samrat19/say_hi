import 'package:flutter/material.dart';
import 'package:say_hi/utils/people_card.dart';

class MyChats extends StatelessWidget {
  const MyChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[400],
      child: ListView.builder(
        itemBuilder: (_, index) => const PeopleCard(),
        itemCount: 10,
      ),
    );
  }
}
