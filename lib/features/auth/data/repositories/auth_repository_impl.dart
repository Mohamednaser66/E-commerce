import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<User> register(RegisterRequest request) async {
    final response = await _authRemoteDataSource.register(request);
    _authLocalDataSource.saveToken(response.token);
    return response.user;
  }

  @override
  Future<User> login(LoginRequest request) async {
    final response = await _authRemoteDataSource.login(request);
    return response.user;
  }
}
