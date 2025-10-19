import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/data_source/wish_list_data_source.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/WishListResponse.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/repository/wish_list_repository.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductResponseEntity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: WishListRepository)
class WishListRepositoryImpl implements WishListRepository{
  WishListDataSource _dataSource;
  @factoryMethod
  WishListRepositoryImpl(this._dataSource);
  @override
  Future<Either<Failure, void>> addToWishList(String productId) async{
    try{
     return Right(_dataSource.addToWishList(productId));
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }

  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getWishList()async {
    try{
    var response=await  _dataSource.getWishList();
    return Right( (response.toProductResponseEntity()) );
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromWishList(String productId)async {
    try{
      return await Right(_dataSource.removeFromWishList(productId));
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

}