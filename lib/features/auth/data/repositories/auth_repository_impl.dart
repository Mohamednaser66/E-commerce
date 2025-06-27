import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);



  @override
  Future<User> register(RegisterRequest request)async {
  final response = await _remoteDataSource.register(request);
  _localDataSource.saveToken(response.token);
  return response.user;
  }

  @override
  Future<User> login(LoginRequest request) async{
   final response = await _remoteDataSource.login(request);
   return response.user;
  }


}