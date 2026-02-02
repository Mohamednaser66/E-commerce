import 'package:ecommerce_app/features/cart/data/models/CartResponse.dart';
import 'package:ecommerce_app/features/cart/data/models/CheckOutResponse.dart';

abstract class CartDataSource {
  Future<CartResponse> getCartProduct();
  Future<void> clearCart();
  Future<void> removeSpecificProduct(String productId);
  Future<CartResponse> updateCartProductQuantity(int count,String productId);
  Future<CheckOutResponse> checkOut(String cartId);

}