
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repository/wish_list_repository.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductResponseEntity.dart';
import 'package:injectable/injectable.dart';

@injectable
  class WishListUseCase{
  WishListRepository _repository;
  @factoryMethod
  WishListUseCase(this._repository);

 Future<Either<Failure,void>> invokeAddToWishList(String productId)async{
    return await _repository.addToWishList(productId);
  }
  Future<Either<Failure,void>> invokeDeleteFromWishList(String productId)async{
    return await _repository.removeFromWishList(productId);
  }
  Future<Either<Failure,ProductResponseEntity>> invokeGetWishList()async{
    return await _repository.getWishList();
  }

}