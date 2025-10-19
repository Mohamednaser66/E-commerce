import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repository.dart';
import 'package:ecommerce_app/features/product_details/data/data_source/cart_data_source.dart';
import 'package:ecommerce_app/features/product_details/data/models/add_to_cart_model/AddCartResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:CartDataSource )
class CartDataSourceImpl implements CartDataSource{
  AuthLocalDataSource _localDataSource;
  @factoryMethod
  CartDataSourceImpl(this._localDataSource);
 final Dio _dio =Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<AddCartResponse> addProductToCart(String productId)async {
    var token =await _localDataSource.getToken();
   try{
    var response =await _dio.post(ApiConstant.cart,data: {"productId": productId},options: Options(headers: {CacheConstant.token:token}));
    return AddCartResponse.fromJson(response.data);
     
   }on DioException catch(exception){
     String? message;
     message=exception.response?.data['message'];
     throw RemoteException(message??'Failed To Add Product');
   }
  }
  
}