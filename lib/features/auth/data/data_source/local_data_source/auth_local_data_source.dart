import 'package:ecommerce_app/features/auth/data/models/User.dart';

abstract class AuthLocalDataSource{

  void saveToken(String token);
  Future<String?> getToken();
  void saveUser(User user);
  Future<User> getUser();
}