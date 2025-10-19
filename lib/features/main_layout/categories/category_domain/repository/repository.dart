import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_data/models/Data.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_domain/entity/sub_category_response_entity.dart';

abstract class CategoryRemoteRepo{
  Future<Either<Failure,List<Category>>> getCategory();
  Future<Either<Failure,SubCategoryResponseEntity>> getSubCategory(String categoryId);
}