import 'User.dart';

class LoginResponse {
  const LoginResponse({
      required this.message,
      required this.user,
      required this.token,});

 factory LoginResponse.fromJson(dynamic json){
   return LoginResponse(message: json['message'], user:  json['user'], token: json['token']);
  }
  final String message;
  final User user;
  final String token;


}