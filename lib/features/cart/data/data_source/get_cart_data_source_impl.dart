import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit.dart';
import 'package:ecommerce_app/features/cart/data/models/GetCartResponse.dart';
import 'package:injectable/injectable.dart';

import 'get_cart_data_source.dart';
@Injectable(as: GetCartDataSource)
class GetCartDataSourceImpl implements GetCartDataSource {
 final Dio _dio =Dio(BaseOptions(baseUrl: ApiConstant.baseURL));


  Future<GetCartResponse> getCartProduct()async{
   final token = await getIt<AuthCubit>().getToken();

    try{
      var response= await _dio.get(ApiConstant.cart,options: Options(headers: {CacheConstant.token:token}));
      return GetCartResponse.fromJson(response.data);
    }on DioException catch(exception){
      String? message;
      message=exception.response?.data['message'];
      throw RemoteException(message??'Failed To Get Product');
    }
    

  }

}
