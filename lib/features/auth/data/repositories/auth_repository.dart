import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';

abstract class AuthRepository{
  Future<User>register(RegisterRequest request);
  Future<User> login(LoginRequest request);

}