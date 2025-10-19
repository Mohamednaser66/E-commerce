import 'package:ecommerce_app/features/main_layout/categories/category_domain/entity/subCategoryEntity.dart';

class SubCategoryResponseEntity{
SubCategoryResponseEntity({required this.results,
  required this.data,});


int? results;
List<SubCategoryEntity>? data;
}