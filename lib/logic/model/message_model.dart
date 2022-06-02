class MessageModel {
  final String text;
  final String name;
  final bool isByMe;
  final String senderID;
  final String receiverID;

  MessageModel({
    required this.text,
    required this.name,
    required this.isByMe,
    required this.senderID,
    required this.receiverID,
  });

  factory MessageModel.fromJSON(Map<String, dynamic> json) {
    return MessageModel(
      text: json['text'],
      name: json['name'],
      isByMe: json['by_me'],
      senderID: json['sender_id'],
      receiverID: json['receiver_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['name'] = name;
    data['by_me'] = isByMe;
    data['sender_id'] = senderID;
    data['receiver_id'] = receiverID;
    return data;
  }
}
