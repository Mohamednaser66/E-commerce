import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/get_cart_response_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_source/cart_data_source.dart';
@Injectable(as: CartRepo)
class CartRepositoryImpl implements CartRepo{
 final CartDataSource _cartDataSource;
 @factoryMethod
  CartRepositoryImpl(this._cartDataSource);
  @override
  Future<Either<Failure, CartResponseEntity>> getCartProduct() async{
 try{
   var response=  await _cartDataSource.getCartProduct();
   return Right(response.toCartResponseEntity());
 }on AppException catch(exception){
   return Left(Failure(exception.message));
 }
  }

  @override
  Future<Either<Failure, CartResponseEntity>> updateCartProductQuantity(int count, String productId)async {
   try{
     var response =await _cartDataSource.updateCartProductQuantity(count, productId);
     return Right(response.toCartResponseEntity());
   }on AppException catch(exception){
     return Left(Failure(exception.message));
   }
  }

  @override
  Future<Either<Failure, void>> clearCart()async {
    try{
      var response =await _cartDataSource.clearCart();
      return Right(response);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }

  }

  @override
  Future<Either<Failure, void>> removeSpecificProduct(String productId)async {
  try{
 var response=await   _cartDataSource.removeSpecificProduct(productId);
 return Right(response);
  }on AppException catch(exception){
    return Left(Failure(exception.message));
  }
  }

}