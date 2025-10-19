import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/AddCartEntity.dart';

import 'CartModel.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 1
/// cartId : "68e918cd109245158fbc8c5d"
/// data : {"_id":"68e918cd109245158fbc8c5d","cartOwner":"68e29093008e327d897c1ac6","products":[{"count":1,"_id":"68e918cd109245158fbc8c5e","product":"6428eb43dc1175abc65ca0b3","price":149}],"createdAt":"2025-10-10T14:31:41.446Z","updatedAt":"2025-10-10T14:31:41.673Z","__v":0,"totalCartPrice":149}

class AddCartResponse {
  AddCartResponse({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  AddCartResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? CartModel.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  CartModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    map['cartId'] = cartId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
  AddCartEntity toAddCartEntity(){
    return AddCartEntity(data: data?.toCartEntity(),
    message: message,cartId: cartId);
  }

}