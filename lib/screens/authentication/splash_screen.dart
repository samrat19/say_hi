import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:say_hi/logic/services/auth_service.dart';
import 'package:say_hi/screens/authentication/login_screen.dart';
import 'package:say_hi/screens/authentication/welcome_screen.dart';
import 'package:say_hi/screens/chat/home_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    ///todo a stream will be listened
    //final authStream = widgetRef.watch(authProvider);

    ///todo if no login found route to welcome screen
    ///todo if login found route to home screen
    return StreamBuilder<User?>(
      stream: AuthService().userAuthStream,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
        if(snapshot.hasError){
          return Scaffold(
            backgroundColor: Colors.blueGrey[700],
            body: const Center(
              child: Text(
                'Say Hi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                ),
              ),
            ),
          );
        }else if(snapshot.data == null){
          return const WelcomeScreen();
        }else if(snapshot.data != null){
          return const HomeScreen();
        }else if(snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(
            backgroundColor: Colors.blueGrey[700],
            body: const Center(
              child: Text(
                'Say Hi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                ),
              ),
            ),
          );
        }else{
          return Scaffold(
            backgroundColor: Colors.blueGrey[700],
            body: const Center(
              child: Text(
                'Say Hi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                ),
              ),
            ),
          );
        }
      },
    );
    /*return authStream.map(
      data: (_) => _.value == null ? const WelcomeScreen() : const HomeScreen(),
      error: (_) => const LoginScreen(),
      loading: (_) => Scaffold(
        backgroundColor: Colors.blueGrey[700],
        body: const Center(
          child: Text(
            'Say Hi',
            style: TextStyle(
              color: Colors.white,
              fontSize: 120,
            ),
          ),
        ),
      ),
    );*/
  }
}
