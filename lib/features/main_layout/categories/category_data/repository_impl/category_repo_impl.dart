import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_data/data_source/remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_data/models/Data.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_domain/entity/sub_category_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../category_domain/repository/repository.dart';
@Injectable(as: CategoryRemoteRepo)
class CategoryRepoImpl implements CategoryRemoteRepo{
  CategoryRemoteDataSource _dataSource;
  @factoryMethod
  CategoryRepoImpl(this._dataSource);
  @override
  Future<Either<Failure,List<Category>>>getCategory()async {
   try{
   var response = await _dataSource.getCategory();
   return Right(response.category);

   }on AppException catch(exception){
   return  Left(Failure(exception.message));
     
   }
  }

  @override
  Future<Either<Failure, SubCategoryResponseEntity>> getSubCategory(String categoryId) async{
try{
  var response=await _dataSource.getSubCategory(categoryId);
  return Right(response.toSubCategoryResponseEntity());
}on AppException catch(exception){
  return Left(Failure(exception.message));
}
  }
}