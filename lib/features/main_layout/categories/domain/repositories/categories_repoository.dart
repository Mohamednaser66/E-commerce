import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/category.dart';

abstract class CategoriesRepository{
  Future<Either<Failure, List<Category>>>getCategories();
}