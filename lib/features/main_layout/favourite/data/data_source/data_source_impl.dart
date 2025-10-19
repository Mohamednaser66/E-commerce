import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_source/wish_list_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WishListResponse.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: WishListDataSource)
class WishListDataSourceImpl implements WishListDataSource{
  Dio _dio=Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  final AuthUseCase _useCase;
  @factoryMethod
  WishListDataSourceImpl(this._useCase);


  @override

  Future<WishListResponse> addToWishList(String productId) async{
  var token=  await _useCase.getTokenUseCase();
    try{
      var response= await _dio.post( ApiConstant.wishList, data: {"productId": productId},options: Options(headers: {CacheConstant.token:token}));
     return WishListResponse.fromJson(response.data);
    }on DioException catch(exception){
String? message;
message=exception.response?.data['message'];
throw RemoteException(message??'Failed To Add Product');
    }

  }

  @override
  Future<ProductResponse> getWishList() async{
    var token=  await _useCase.getTokenUseCase();
     print('Wishlist ADD' );
    try{
      var response= await _dio.get( ApiConstant.wishList,options: Options(headers: {CacheConstant.token:token}));
      return ProductResponse.fromJson(response.data);
    }on DioException catch(exception){
      String? message;
      message=exception.response?.data['message'];
      throw RemoteException(message??'Failed To Get Wish List');  }}

  @override
  Future<WishListResponse> removeFromWishList(String productId) async{
print('WishListRemove');
    var token=  await _useCase.getTokenUseCase();
    try{
      var response= await _dio.delete( ApiConstant.deleteWishList(productId), data: {"productId": productId},options: Options(headers: {CacheConstant.token:token}));
      return WishListResponse.fromJson(response.data);
    }on DioException catch(exception){
      String? message;
      message=exception.response?.data['message'];
      throw RemoteException(message??'Failed To Delete Product');
    }

  }}