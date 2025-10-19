import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/AddCartEntity.dart';

abstract class CartProductRepository{
  Future<Either<Failure,AddCartEntity>> addProductToCart(String productId);
}