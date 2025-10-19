import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/get_cart_response_entity.dart';

abstract class GetCartRepo {
  Future<Either<Failure,GetCartResponseEntity>> getCartProduct();
}