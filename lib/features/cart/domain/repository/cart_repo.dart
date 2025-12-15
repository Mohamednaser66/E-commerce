import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/get_cart_response_entity.dart';

abstract class CartRepo {
  Future<Either<Failure,CartResponseEntity>> getCartProduct();
  Future<Either<Failure,void>> removeSpecificProduct(String productId);
  Future<Either<Failure,void>> clearCart();
  Future<Either<Failure,CartResponseEntity>> updateCartProductQuantity(int count,String productId);

}