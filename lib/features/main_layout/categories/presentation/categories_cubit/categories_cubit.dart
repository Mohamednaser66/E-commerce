import 'package:ecommerce_app/features/main_layout/categories/data/models/category.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CategoriesCubit extends Cubit<CategoriesState>{
  @factoryMethod
  CategoriesCubit(this.categoriesUseCase):super(CategoriesInitial());
  GetCategoriesUseCase categoriesUseCase;
  void loadCategories()async{
    emit(CategoriesLoading());
   var result = await  categoriesUseCase.invoke();
   result.fold((failure){
     emit(CategoriesError(failure.message));
   } , (categories) {
     emit(CategoriesSuccess(categories));
   },);

  }
}


abstract class CategoriesState{}

class CategoriesInitial extends CategoriesState{}
class CategoriesLoading extends CategoriesState{}
class CategoriesSuccess extends CategoriesState{
  List<Category> categories;
  CategoriesSuccess(this.categories);
}

class CategoriesError extends CategoriesState{
  String error;
  CategoriesError(this.error);
}