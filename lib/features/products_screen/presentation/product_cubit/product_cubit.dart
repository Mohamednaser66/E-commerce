import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_case/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductCubit extends Cubit<ProductState>{
  @factoryMethod
  ProductCubit(this._useCase):super(ProductInitialState());
  ProductUseCase _useCase;
Future<void>  getAllProduct()async{
    emit(ProductLoadingState());
 var result=  await _useCase.invoke();
 result.fold((l) => emit(ProductErrorState(message: l.message)),
      (r) => emit(ProductSuccessState(products: r.data)),);
  }


}




sealed class ProductState{}
class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductErrorState extends ProductState{
  String? message;
  ProductErrorState({required this.message});
}
class ProductSuccessState extends ProductState{
  ProductSuccessState({required this.products});
  List<ProductEntity>? products;
}
