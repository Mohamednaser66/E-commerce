import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/category.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/repositories/categories_repoository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCategoriesUseCase{
 final  CategoriesRepository _categoriesRepository;
 @factoryMethod
 GetCategoriesUseCase(this._categoriesRepository);

 Future<Either<Failure, List<Category>>> invoke(){
   return _categoriesRepository.getCategories();
 }
}