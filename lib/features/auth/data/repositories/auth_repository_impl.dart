import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepository)
 class AuthRepositoryImpl implements AuthRepository{

   AuthLocalDataSource _localDataSource;
   AuthRemoteDataSource _remoteDataSource;
   @factoryMethod
   AuthRepositoryImpl(this._remoteDataSource,this._localDataSource);
   @override
  Future<Either<Failure,User>> login(LoginRequest request)async {
 try{
   final response=await _remoteDataSource.login(request);
   _localDataSource.saveToken(response.token);
   _localDataSource.saveUser(response.user);
   return right(response.user);

 }on AppException catch(exception){
   return left(Failure(exception.message));
 }
  }

  @override
  Future<Either<Failure,User>> register(RegisterRequest request) async{
try{
  final response =await _remoteDataSource.register(request);
  _localDataSource.saveUser(response.user);
  _localDataSource.saveToken(response.token);
  return   right(response.user);
}on AppException catch(exception){
  return left(Failure(exception.message));
}
  }

  @override
Future<String?> getToken()async {
   return await _localDataSource.getToken();
  }
  Future<User>getUser()async{
     return await _localDataSource.getUser();
  }

}