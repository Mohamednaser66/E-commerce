import 'package:ecommerce_app/features/cart/data/models/Products.dart';

class GetCartEntity{
  String? id;
  List<Products>? products;
  int? totalCartPrice;
  GetCartEntity({required this.id, required this.products,required this.totalCartPrice});
}