import 'package:ecommerce_app/features/main_layout/categories/category_data/models/CategoriesResponse.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_data/models/SubCategoriesResponse.dart';

abstract class CategoryRemoteDataSource{
  Future<CategoriesResponse>getCategory();
  Future<SubCategoriesResponse>getSubCategory(String categoryId);
}