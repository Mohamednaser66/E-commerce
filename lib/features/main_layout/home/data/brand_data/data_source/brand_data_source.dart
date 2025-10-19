import 'package:ecommerce_app/features/main_layout/home/data/brand_data/models/BrandResponse.dart';

abstract class BrandDataSource{
 Future<BrandResponse> getBrand();
}