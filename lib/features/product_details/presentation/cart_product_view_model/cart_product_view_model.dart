import 'package:ecommerce_app/features/product_details/domain/use_case/add_to_cart_use_case/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/product_details/presentation/cart_product_view_model/cart_product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartProductViewModel extends Cubit<AddCartState>{
  @factoryMethod
  CartProductViewModel(this._useCase) : super(AddCartInitialState());
AddToCartUseCase _useCase;
String? currentId;
AddToCart(String productId)async{
  emit(AddToCartLoadingState());
  currentId=productId;
 var result=await _useCase.invokeAddToCart(productId);
 result.fold((error) {
   emit(AddCartErrorState(errorMessage: error.message));
 }, (cartEntity) {
   emit(AddCartSuccessState(cartEntity: cartEntity));
 },);
}

}