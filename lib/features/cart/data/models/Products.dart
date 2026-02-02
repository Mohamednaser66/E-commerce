import 'package:ecommerce_app/features/cart/domain/entity/ListProductEntity.dart';

import 'Product.dart';



class Products {
  Products({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  Products.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
  }
  int? count;
  String? id;
  Product? product;
  int? price;


  ProductEntity toListProductEntity(){
  return ProductEntity(product: product?.toCartProductEntity());
}
}