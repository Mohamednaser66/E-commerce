import 'package:ecommerce_app/features/cart/data/models/Product.dart';
import 'package:ecommerce_app/features/cart/data/models/cart.dart';

class GetCartResponseEntity{
  String? status;
  String? cartId;
  Cart? data;
  GetCartResponseEntity({required this.data,required this.status,required this.cartId,});
}