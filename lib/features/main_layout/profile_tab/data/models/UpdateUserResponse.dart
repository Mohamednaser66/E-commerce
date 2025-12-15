import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd","email":"ahmedmutt26i2@gmail.com","role":"user"}

class UpdateUserResponse {
  UpdateUserResponse({
      this.message, 
      this.user,});

  UpdateUserResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}