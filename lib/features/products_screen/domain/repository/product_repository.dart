import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductResponseEntity.dart';

abstract class ProductRepository{
Future<Either<Failure,ProductResponseEntity>>   getProduct();
}