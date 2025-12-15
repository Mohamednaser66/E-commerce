import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserRequest.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserResponse.dart';
import 'package:injectable/injectable.dart';

import 'update_user_service.dart';
@Injectable(as:UpdateUserService)
class UpdateUserServiceImpl implements UpdateUserService {
  AuthUseCase _useCase;
  @factoryMethod
  UpdateUserServiceImpl(this._useCase);
  final Dio _dio =Dio(BaseOptions(baseUrl: ApiConstant.baseURL));

  @override
  Future<UpdateUserResponse> updateUser(UpdateUserRequest request)async {
final token =await  _useCase.getTokenUseCase();
    try{
    var response =await  _dio.put(ApiConstant.updateUser,data:request.toJson(),options: Options(headers: {CacheConstant.token:token}));
    return UpdateUserResponse.fromJson(response.data);
    }on DioException catch(exception){
      String? message ;
      message =exception.response?.data['message'];
      throw RemoteException(message??"Failed");
    }
  }

}
