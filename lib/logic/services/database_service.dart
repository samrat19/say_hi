import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:say_hi/logic/model/message_model.dart';

import '../model/user_model.dart';

class DataBaseService {
  final userCollection = FirebaseFirestore.instance.collection('Users');


  Stream<UserModel> getUser(String userID) {
    return userCollection.doc(userID).snapshots().map((event) =>
        UserModel.fromJson(event.data()!)
    );
  }

  Stream<List<UserModel>> getUsers(String userID) {
    return userCollection.where('user_id', isNotEqualTo: userID)
        .snapshots()
        .map(
          (snapShot) =>
          snapShot.docs
              .map((document) => UserModel.fromJson(document.data()))
              .toList(),
    );
  }

  Stream<List<MessageModel>> getMessages(String senderID, String receiverID) {
    print(senderID);
    print(receiverID);

    return userCollection
        .doc(senderID)
        .collection('My Messages')
        .doc(receiverID)
        .collection('Messages').orderBy('unique_index', descending: false)
        .snapshots()
        .map(
          (event) =>
          event.docs.map((e) => MessageModel.fromJSON(e.data())).toList(),
    );
  }

  sendMessage(Map<String, dynamic> json) async {
    try {
      var collectionRef = userCollection
          .doc(json['sender_id'])
          .collection('My Messages')
          .doc(json['receiver_id']);

      var hasDoc = await collectionRef.get();
      int count = 0;

      if (hasDoc.exists) {
        count = hasDoc.data()!['unique_index'];
      } else {
        count = 0;
      }

      await userCollection
          .doc(json['sender_id'])
          .collection('My Messages')
          .doc(json['receiver_id'])
          .collection('Messages').add({...json, ...{'unique_index': count}});

      await userCollection
          .doc(json['receiver_id'])
          .collection('My Messages')
          .doc(json['sender_id'])
          .collection('Messages').add({...json, ...{'unique_index': count}});

      try {
        await userCollection
            .doc(json['sender_id'])
            .collection('My Messages')
            .doc(json['receiver_id']).set({'unique_index': count + 1});

        await userCollection
            .doc(json['receiver_id'])
            .collection('My Messages')
            .doc(json['sender_id']).set({'unique_index': count + 1});
      } catch (e) {
        print(e.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
