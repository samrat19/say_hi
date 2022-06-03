import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:say_hi/logic/model/user_model.dart';
import 'package:say_hi/logic/services/auth_service.dart';
import 'package:say_hi/logic/services/database_service.dart';
import 'package:say_hi/utils/authentication_button.dart';

import 'my_chats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthService get authService => GetIt.I<AuthService>();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      body: firebaseUser == null
          ? const SizedBox()
          : SafeArea(
              top: true,
              child: StreamBuilder<UserModel>(
                stream: DataBaseService().getUser(firebaseUser.uid),
                builder: (_, AsyncSnapshot<UserModel> snapShot) {
                  if (snapShot.hasData && snapShot.data != null) {
                    return Padding(
                      padding: EdgeInsets.all(width * 10 / 375),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style:
                                  TextStyle(fontSize: width * 80 / 375, color: Colors.white),
                            ),
                            Text(
                              snapShot.data!.userName,
                              style: TextStyle(
                                fontSize: width * 45 / 375,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: width * 50 / 375,
                            ),
                            const Expanded(flex: 2, child: MyChats()),
                            SizedBox(
                              height: width * 30 / 375,
                            ),
                            GestureDetector(
                                onTap: ()async{
                                  authService.signOut();
                                },
                                child: const AuthenticationButton(title: 'Logout')
                            ),
                          ]),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
    );
  }
}
