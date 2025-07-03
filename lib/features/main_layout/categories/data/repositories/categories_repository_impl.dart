import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/category.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/categories_repoository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoriesRepository)
class CategoriesRepoImpl implements CategoriesRepository{
 final  CategoriesRemoteDataSource _remoteDataSource;
 @factoryMethod
   const CategoriesRepoImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<Category>>> getCategories()async {
    try{
      final response = await _remoteDataSource.getCategories();
      return Right(response.categories);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

}