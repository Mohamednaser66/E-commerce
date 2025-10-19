import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/product_details/data/models/add_to_cart_model/AddCartResponse.dart';

abstract class CartDataSource{
 Future<AddCartResponse>addProductToCart(String productId);
}