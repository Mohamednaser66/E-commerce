import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/cart_entity.dart';

import 'CartProductModel.dart';

/// _id : "68e918cd109245158fbc8c5d"
/// cartOwner : "68e29093008e327d897c1ac6"
/// products : [{"count":1,"_id":"68e918cd109245158fbc8c5e","product":"6428eb43dc1175abc65ca0b3","price":149}]
/// createdAt : "2025-10-10T14:31:41.446Z"
/// updatedAt : "2025-10-10T14:31:41.673Z"
/// __v : 0
/// totalCartPrice : 149

class CartModel {
  CartModel({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  CartModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartProductModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartProductModel>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }
  CartEntity  toCartEntity(){
    return CartEntity(
      id: id,
      cartOwner: cartOwner,
      products: products?.map((e) => e.toCartProductEntity(),).toList()
    );
  }

}