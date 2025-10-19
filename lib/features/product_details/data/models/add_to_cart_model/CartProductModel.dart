import 'package:ecommerce_app/features/product_details/domain/entity/add_cart_entity/CartProductEntity.dart';

/// count : 1
/// _id : "68e918cd109245158fbc8c5e"
/// product : "6428eb43dc1175abc65ca0b3"
/// price : 149

class CartProductModel {
  CartProductModel({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartProductModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
  int? count;
  String? id;
  String? product;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
  CartProductEntity toCartProductEntity(){
    return CartProductEntity(id: id,count: count);
}
}