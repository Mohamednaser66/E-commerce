import 'package:ecommerce_app/features/cart/data/models/GetCartResponse.dart';

abstract class GetCartDataSource {
  Future<GetCartResponse> getCartProduct();
}