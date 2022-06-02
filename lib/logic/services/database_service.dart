import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class DataBaseService {
  final userCollection = FirebaseFirestore.instance.collection('Users');

  Stream<List<UserModel>> getUsers() {
    return userCollection.snapshots().map(
          (snapShot) => snapShot.docs
              .map((document) => UserModel.fromJson(document.data()))
              .toList(),
        );
  }
}
