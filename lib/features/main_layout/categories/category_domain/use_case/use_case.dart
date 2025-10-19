import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_data/models/Data.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_domain/entity/sub_category_response_entity.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_domain/repository/repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoryUseCase{
 final CategoryRemoteRepo _repo;
 @factoryMethod
 const CategoryUseCase(this._repo);
 Future<Either<Failure,List<Category>>> invokeCategory(){
    return _repo.getCategory();
  }
  Future<Either<Failure,SubCategoryResponseEntity>>invokeSubCategory(String categoryId){
  return _repo.getSubCategory(categoryId);

  }
}