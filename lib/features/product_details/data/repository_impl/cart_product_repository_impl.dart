import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/product_details/data/data_source/cart_data_source.dart';
import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/AddCartEntity.dart';
import 'package:ecommerce_app/features/product_details/domain/repository/cart_product_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartProductRepository)
class CartProductRepositoryImpl implements CartProductRepository {
  final CartDataSource _dataSource; // make it final since it's immutable

  @factoryMethod
 const CartProductRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failure, AddCartEntity>> addProductToCart(String productId) async {
    try {
      final result = await _dataSource.addProductToCart(productId);
      return right(result.toAddCartEntity());
    } on AppException catch (exception) {
      return left(Failure(exception.message));
    } catch (e) {
      // Optional: catch unexpected errors for debugging
      return left(Failure('Unexpected error: $e'));
    }
  }
}
