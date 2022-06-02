class MessageModel {
  final String text;
  final String name;
  final String senderID;
  final String receiverID;

  MessageModel({
    required this.text,
    required this.name,
    required this.senderID,
    required this.receiverID,
  });

  factory MessageModel.fromJSON(Map<String, dynamic> json) {

    print('Data: $json');

    return MessageModel(
      text: json['text'],
      name: json['name'],
      senderID: json['sender_id'],
      receiverID: json['receiver_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['name'] = name;
    data['sender_id'] = senderID;
    data['receiver_id'] = receiverID;
    return data;
  }
}
