import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';

abstract class AuthRepository{
  Future<Either<Failure,User>> login(LoginRequest request);
  Future<Either<Failure,User>> register(RegisterRequest request);
  Future<String?> getToken();
  Future<User>getUser();
}