import 'package:ecommerce_app/features/main_layout/categories/category_data/models/Data.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_domain/entity/subCategoryEntity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/brand_domain/entities/brand_entity/BrandEntity.dart';

sealed class CategoryState {}
class InitialState extends CategoryState{}
class CategoryLoadingState extends CategoryState{}
class CategorySuccessState extends CategoryState{
  List<Category> categories;
  CategorySuccessState({required this.categories});
}
class CategoryErrorState extends CategoryState{
  String errorMessage;
  CategoryErrorState({required this.errorMessage});
}
class BrandLoadingState extends CategoryState{}
class BrandSuccessState extends CategoryState{
  List<BrandEntity>? brands;
  BrandSuccessState({required this.brands});
}
class BrandErrorState extends CategoryState{
  String errorMessage;
  BrandErrorState({required this.errorMessage});
}
class SubCategoryLoadingState extends CategoryState{}
class SubCategorySuccessState extends CategoryState{
  List<SubCategoryEntity> subCategories;
  SubCategorySuccessState({required this.subCategories});
}
class SubCategoryErrorState extends CategoryState{
  String errorMessage;
  SubCategoryErrorState({required this.errorMessage});
}