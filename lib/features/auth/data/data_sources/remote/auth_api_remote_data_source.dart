import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';

class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseURL,
  ));

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    final response =
        await _dio.post(ApiConstant.registerEndPoint, data: request.toJson());
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<LoginResponse> login(LoginRequest request)async {
    final response = await _dio.post(ApiConstant.loginEndPoint, data:request.toJson() );
    return LoginResponse.fromJson(response.data);
  }
}
