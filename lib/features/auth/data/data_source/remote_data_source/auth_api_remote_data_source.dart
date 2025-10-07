import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/constants_manager.dart';
@Injectable(as: AuthRemoteDataSource )
class AuthApiRemoteDataSource implements AuthRemoteDataSource{
  @override
  final Dio _dio =Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  Future<LoginResponse> login(LoginRequest request)async {
 try{

  final response= await _dio.post(ApiConstant.loginEndPoint,data: request.toJson());
  return LoginResponse.fromJson(response.data);

  }on DioException catch(exception){
   String? message;
  message = exception.response?.data['message'];
  throw RemoteException(message??'Failed To Login ');
  }

  }
  @override
  Future<RegisterResponse> register(RegisterRequest request) async{
     try{
       final response =await _dio.post(ApiConstant.registerEndPoint,data: request.toJson());
       return RegisterResponse.fromJson(response.data);
     }on DioException catch(exception){
       String? message;
       exception.response?.data['message'];
       throw RemoteException(message??'Failed To register');

     }

  }
  
}