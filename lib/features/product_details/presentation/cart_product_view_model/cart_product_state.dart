import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/AddCartEntity.dart';
import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/cart_entity.dart';

 class AddCartState{}
class AddCartInitialState extends AddCartState{}
class AddToCartLoadingState extends AddCartState{}
class AddCartErrorState extends AddCartState{
String errorMessage;
AddCartErrorState({required this.errorMessage});

}
class AddCartSuccessState extends AddCartState{
  AddCartEntity cartEntity;
  AddCartSuccessState({required this.cartEntity});
}