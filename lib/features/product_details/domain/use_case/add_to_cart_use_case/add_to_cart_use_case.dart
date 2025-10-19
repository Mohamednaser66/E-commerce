import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/product_details/data/repository_impl/cart_product_repository_impl.dart';
import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/AddCartEntity.dart';
import 'package:ecommerce_app/features/product_details/domain/repository/cart_product_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class AddToCartUseCase{
CartProductRepository _repository;
@factoryMethod
AddToCartUseCase(this._repository);
Future<Either<Failure, AddCartEntity>>invokeAddToCart(String productId )=>_repository.addProductToCart(productId);
}