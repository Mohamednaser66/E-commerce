import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WishListResponse.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductResponseEntity.dart';

abstract class WishListRepository{
  Future<Either<Failure,void>> addToWishList(String productId);
  Future<Either<Failure,void>> removeFromWishList(String productId);
  Future<Either<Failure,ProductResponseEntity>>getWishList();
}