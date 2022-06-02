import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authProvider = StreamProvider((ref) => AuthService().userAuthStream);


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///a stream which will be listened to get user auth state
  ///
  ///
  Stream<User?> get userAuthStream => _auth.authStateChanges();

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
  Future<String> register(String userName,String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
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

  signOut()async{
    await _auth.signOut();
  }
}
