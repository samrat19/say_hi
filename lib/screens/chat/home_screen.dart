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
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hello',
                              style:
                                  TextStyle(fontSize: 80, color: Colors.white),
                            ),
                            Text(
                              snapShot.data!.userName,
                              style: const TextStyle(
                                fontSize: 45,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Expanded(flex: 2, child: MyChats()),
                            const SizedBox(
                              height: 30,
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
