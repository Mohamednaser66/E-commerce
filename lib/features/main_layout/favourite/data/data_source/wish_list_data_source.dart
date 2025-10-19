import 'package:ecommerce_app/features/main_layout/favourite/data/models/WishListResponse.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductResponse.dart';

abstract class WishListDataSource{
Future<WishListResponse> addToWishList(String productId);
Future<WishListResponse> removeFromWishList(String productId);
Future<ProductResponse>getWishList();
}