import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:say_hi/logic/model/message_model.dart';

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

  Stream<List<MessageModel>> getMessages(String userID, String receiverID) {
    return userCollection
        .doc(userID)
        .collection('My Messages')
        .doc(receiverID)
        .collection('Messages')
        .snapshots()
        .map(
          (event) =>
              event.docs.map((e) => MessageModel.fromJSON(e.data())).toList(),
        );
  }

  sendMessage(Map<String,dynamic> json)async{

    try{
      var collectionRef = userCollection
          .doc(json['sender_id'])
          .collection('My Messages')
          .doc(json['receiver_id']);

      var hasDoc = await collectionRef.get();
      int count = 0;

      if(hasDoc.exists){
        count = await collectionRef
            .collection('Messages').snapshots().length;
      }else{
        count = 0;
      }

      await userCollection
          .doc(json['sender_id'])
          .collection('My Messages')
          .doc(json['receiver_id'])
          .collection('Messages').add({...json,...{'unique_index':count}});

      await userCollection
          .doc(json['receiver_id'])
          .collection('My Messages')
          .doc(json['receiver_id'])
          .collection('Messages').add({...json,...{'unique_index':count}});

    }catch(e){
      print(e.toString());
    }
  }
}
