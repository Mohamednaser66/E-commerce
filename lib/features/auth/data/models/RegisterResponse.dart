import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttii54012@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZTI5MDkzMDA4ZTMyN2Q4OTdjMWFjNiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzU5Njc4NjEyLCJleHAiOjE3Njc0NTQ2MTJ9.WwRAA62R6993mXU7T0C2lY-fgtCjgmlYbd-T63dGhN8"

class RegisterResponse {
  RegisterResponse({
     required this.message,
    required this.user,
    required this.token,});

 factory RegisterResponse.fromJson(dynamic json) {
   return RegisterResponse(message:  json['message'], user:  User.fromJson(json['user']), token: json['token']);

  }
  String message;
  User user;
  String token;



}