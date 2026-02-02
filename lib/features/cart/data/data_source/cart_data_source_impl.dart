import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit.dart';
import 'package:ecommerce_app/features/cart/data/models/CartResponse.dart';
import 'package:ecommerce_app/features/cart/data/models/CheckOutResponse.dart';
import 'package:injectable/injectable.dart';

import 'cart_data_source.dart';
@Injectable(as: CartDataSource)
class CartDataSourceImpl implements CartDataSource {
 final Dio _dio =Dio(BaseOptions(baseUrl: ApiConstant.baseURL));




  Future<CartResponse> getCartProduct()async{

  final  token = await getIt<AuthCubit>().getToken();
    try{
      var response= await _dio.get(ApiConstant.cart,options: Options(headers: {CacheConstant.token:token}));
      return CartResponse.fromJson(response.data);
    }on DioException catch(exception){
      String? message;
      message=exception.response?.data['message'];
      throw RemoteException(message??'Failed To Get Product');
    }
    

  }

  @override
  Future<CartResponse> updateCartProductQuantity(int count,String productId)async {
    final token = await getIt<AuthCubit>().getToken();

    try{
    var response =await  _dio.put(ApiConstant.updateCartCount(productId),data: { "count":count.toString()},options: Options(headers: {CacheConstant.token:token}));
    return CartResponse.fromJson(response.data);

    }on DioException catch(exception){
      throw RemoteException(exception.response?.data['message']);
    }
  }

  @override
  Future<void> clearCart()async {
    final token = await getIt<AuthCubit>().getToken();
 try{
   var response=await   _dio.delete(ApiConstant.cart,options: Options(headers:{CacheConstant.token:token} ));
 }on DioException catch(exception){
   throw RemoteException(exception.response?.data["message"]);
 }
  }

 Future<void> removeSpecificProduct(String productId)async {
   final token = await getIt<AuthCubit>().getToken();

   try{
     var response=await   _dio.delete(ApiConstant.updateCartCount(productId),options: Options(headers:{CacheConstant.token:token} ));
   }on DioException catch(exception){
     throw RemoteException(exception.response?.data["message"]);
   }
 }

  @override
  Future<CheckOutResponse> checkOut(String cardId) async{
    final token = await getIt<AuthCubit>().getToken();
    try{
    final  response =await _dio.post(ApiConstant.checkOut(cardId),options: Options(headers: {CacheConstant.token:token}));
    return CheckOutResponse.fromJson(response.data);
    }on DioException catch(exception){
      throw RemoteException(exception.response?.data['message']);
    }


  }

}
