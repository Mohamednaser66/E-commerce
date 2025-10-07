import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttii54012@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZTI5MDkzMDA4ZTMyN2Q4OTdjMWFjNiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzU5Njc5MjQzLCJleHAiOjE3Njc0NTUyNDN9.NF1n9biixqaAEoCLnbR9IManIRzBOGsTFTa8hurugGU"

class LoginResponse {
  LoginResponse({
      required this.message,
      required this.user,
      required this.token,});

  factory LoginResponse.fromJson(dynamic json) {
    return LoginResponse(message: json['message'], user: User.fromJson(json['user']), token:  json['token']);

  }
  String message;
  User user;
  String token;



}