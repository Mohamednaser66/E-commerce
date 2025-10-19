import 'package:ecommerce_app/features/products_screen/data/models/ProductResponse.dart';

abstract class ProductDataSource{
  Future<ProductResponse> getProduct();
}