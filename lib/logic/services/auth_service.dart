import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final userCollection = FirebaseFirestore.instance.collection('Users');

  ///a stream which will be listened to get user auth state
  ///
  ///
  Stream<User?> get userAuthStream => _auth.idTokenChanges();

  ///login an user
  ///
  ///
  Future<String> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return '1';
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (e) {
      return '0';
    }
  }

  ///register an user
  ///get user ID
  ///create a user document
  ///save the user
  Future<String> register(
      String userName, String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ///todo create user document
      ///
      ///
      String userID = result.user!.uid;
      try{
        await userCollection
            .doc(userID)
            .set({'user_name': userName, 'email_id': email});

      } catch(e) {
        log(e.toString());
      }

      return '1';
    } on FirebaseAuthException catch (e) {
      return e.message!;
    } catch (e) {
      return '0';
    }
  }

  signOut() async {
    await _auth.signOut();
  }
}
