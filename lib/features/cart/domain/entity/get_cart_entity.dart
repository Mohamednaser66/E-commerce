import 'package:ecommerce_app/features/cart/data/models/Products.dart';
import 'package:ecommerce_app/features/cart/domain/entity/cart_product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';

class GetCartEntity{
  String? id;
  List<Products>? products;
  int? totalCartPrice;
  GetCartEntity({required this.id, required this.products,required this.totalCartPrice});
}