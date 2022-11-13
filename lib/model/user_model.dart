class User {
  String userId;
  String userName;
  String email;
  String hobby;

  User({
    required this.userId,
    required this.userName,
    required this.email,
    required this.hobby,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        userName: json["user_name"],
        email: json["email"],
        hobby: json["hobby"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "email": email,
        "hobby": hobby,
      };
}
