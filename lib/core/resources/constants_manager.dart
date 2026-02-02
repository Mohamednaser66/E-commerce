import 'package:flutter/material.dart';

class AppConstants {
  static const String delete = "Delete";
  static const String searchHint = "what do you search for?";
  static const String addToCart = "Add to Cart";

}

abstract class ApiConstant{
  static const String baseURL = "https://ecommerce.routemisr.com/api/v1/";
  static const String registerEndPoint = "auth/signup";
  static const String loginEndPoint = "auth/signin";
  static const String categoriesEndPoint = "categories";
  static const String brands = "brands";
  static const String products = "products";
  static const String cart = "cart";
  static const String updateUser = "users/updateMe/";
  static  String updateCartCount(String productId) => "cart/$productId";
  static const String wishList = "wishlist";
  static  String deleteWishList(String productId) => "wishlist/$productId";
  static  String subCategory(String categoryId) => "categories/$categoryId/subcategories";
  static  String checkOut(String cardId) => "https://ecommerce.routemisr.com/api/v1/orders/checkout-session/$cardId?url=http://localhost:3000";

}

abstract class CacheConstant{
  static const String token = "token";
}



