import 'package:ecommerce_app/features/main_layout/categories/data/models/CategoriesResponse.dart';

abstract class CategoriesRemoteDataSource{
  Future<CategoriesResponse>getCategories();
}