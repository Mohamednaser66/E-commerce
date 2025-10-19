import 'package:ecommerce_app/features/cart/domain/entity/cart_product_entity.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_data/models/Data.dart';
import 'package:ecommerce_app/features/main_layout/home/data/brand_data/models/Data.dart';
import 'package:ecommerce_app/features/products_screen/data/models/Subcategory.dart';


/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// _id : "6428e997dc1175abc65ca0a1"
/// title : "Woman Shawl"
/// quantity : 220
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// id : "6428e997dc1175abc65ca0a1"

class Product {
  Product({
      this.subcategory, 
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage,});

  Product.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
  }
  List<Subcategory>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;

  CartProductEntity toCartProductEntity(){
  return CartProductEntity(id: id, title: title, imageCover: imageCover, ratingsAverage: ratingsAverage, quantity: quantity);
}

}