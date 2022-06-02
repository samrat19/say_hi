import 'package:cloud_firestore/cloud_firestore.dart';

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

class UserModel {
  final String userName;
  final String userEmailID;
  final String userID;

  const UserModel({required this.userName, required this.userEmailID, required this.userID});

  factory UserModel.fromJson(Map<String, dynamic> userMap) {
    return UserModel(
      userName: userMap['user_name'],
      userEmailID: userMap['email_id'],
      userID: userMap['user_id'],
    );
  }
}
