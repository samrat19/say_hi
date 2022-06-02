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