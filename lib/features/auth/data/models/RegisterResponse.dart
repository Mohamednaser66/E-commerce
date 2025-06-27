import 'User.dart';

class RegisterResponse {
  const RegisterResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory RegisterResponse.fromJson(dynamic json) {
    return RegisterResponse(
        message: json['message'], user: json['user'], token: json['token']);
  }

  final String message;
  final User user;
  final String token;
}
