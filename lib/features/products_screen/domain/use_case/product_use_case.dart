import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductResponseEntity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductUseCase{
 final ProductRepository _repository;
 @factoryMethod
const ProductUseCase(this._repository);

 Future<Either<Failure, ProductResponseEntity>> invoke()async{
  return await _repository.getProduct();
}
}