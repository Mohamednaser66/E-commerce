import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/AddCartEntity.dart';
import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/cart_entity.dart';

sealed class CartState{}
class AddCartInitialState extends CartState{}
class AddToCartLoadingState extends CartState{}
class AddCartErrorState extends CartState{
String errorMessage;
AddCartErrorState({required this.errorMessage});

}
class AddCartSuccessState extends CartState{
  AddCartEntity cartEntity;
  AddCartSuccessState({required this.cartEntity});
}