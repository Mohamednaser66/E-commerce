import 'package:ecommerce_app/features/main_layout/categories/category_domain/use_case/use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/brand_domain/use_case/brand_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/home_cubit/main_lay_out_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainLayoutCubit extends Cubit<CategoryState>{
  @factoryMethod
  MainLayoutCubit(this._categoryUseCase,this._brandUseCase):super(InitialState());
  CategoryUseCase _categoryUseCase;
  BrandUseCase _brandUseCase;
 getCategory()async{
var result=  await  _categoryUseCase.invokeCategory();
result.fold((error) {
  emit(CategoryErrorState(errorMessage: error.message));
}, (categories) {
  emit(CategorySuccessState(categories: categories));
},);
 }
  getBrands()async{

var _result=  await _brandUseCase.invoke();
_result.fold((error) =>
    emit(BrandErrorState(errorMessage: error.message))
    , (r) => emit(BrandSuccessState(brands: r.brand)),);
 }
 getSubCategories(String categoryId)async{
   emit(SubCategoryLoadingState());
  var result=await _categoryUseCase.invokeSubCategory(categoryId);
  result.fold((error) {
    emit(SubCategoryErrorState(errorMessage: error.message));
  }, (r) {
    emit(SubCategorySuccessState(subCategories: r.data!));
  }
    );
 }
}






















