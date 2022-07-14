// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int id;
  String firstname;
  String lastname;
  String email;
  String avatar;
  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      firstname: json["first_name"],
      lastname: json["last_name"],
      email: json["email"],
      avatar: json["avatar"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstname,
        "last_name": lastname,
        "email": email,
        "avatar": avatar,
      };
}
