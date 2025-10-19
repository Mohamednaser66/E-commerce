import 'cart_entity.dart';

/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "68e918cd109245158fbc8c5d"
/// data : {"_id":"68e918cd109245158fbc8c5d","cartOwner":"68e29093008e327d897c1ac6","products":[{"count":2,"_id":"68e918cd109245158fbc8c5e","product":"6428eb43dc1175abc65ca0b3","price":149}],"totalCartPrice":298}

class AddCartEntity {
  AddCartEntity({
      this.message, 
      this.cartId,
      this.data,});

  String? message;
  String? cartId;
  CartEntity? data;


}