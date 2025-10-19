import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/get_cart_response_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repository/get_cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_source/get_cart_data_source.dart';
@Injectable(as: GetCartRepo)
class GetCartRepositoryImpl implements GetCartRepo{
 final GetCartDataSource _cartDataSource;
 @factoryMethod
  GetCartRepositoryImpl(this._cartDataSource);
  @override
  Future<Either<Failure, GetCartResponseEntity>> getCartProduct() async{
 try{
   var response=  await _cartDataSource.getCartProduct();
   return Right(response.toGetCartResponseEntity());
 }on AppException catch(exception){
   return Left(Failure(exception.message));
 }
  }
}