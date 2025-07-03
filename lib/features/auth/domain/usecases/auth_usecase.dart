import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class AuthUseCase{
  final AuthRepository authRepository;
  @factoryMethod
  const AuthUseCase(this.authRepository);
  Future<Either<Failure, User>> invokeLogin(LoginRequest request){
    return authRepository.login(request);
  }

  Future<Either<Failure, User>> invokeRegister(RegisterRequest request){
    return authRepository.register(request);
  }
}