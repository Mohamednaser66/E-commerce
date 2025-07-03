import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseURL,
  ));

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try{
      final response =
          await _dio.post(ApiConstant.registerEndPoint, data: request.toJson());
      return RegisterResponse.fromJson(response.data);
    }on DioException catch(exception){
      String? message;
      message = exception.response?.data["message"];
      throw RemoteException(message ?? "Failed To Register");
    }

  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try{
      final response =
          await _dio.post(ApiConstant.loginEndPoint, data: request.toJson());
      return LoginResponse.fromJson(response.data);
    }on DioException catch(exception){
      String? message ;
      message = exception.response?.data["message"];
      throw RemoteException(message ?? "Failed To login");
    }
  }
}
