
import 'package:ecommerce_app/features/main_layout/categories/category_data/models/Data.dart';
import 'package:ecommerce_app/features/main_layout/home/data/brand_data/models/Data.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'Subcategory.dart';

class Product {
  Product({
    this.priceAfterDiscount,
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      sold: json['sold'],
      images: (json['images'] as List?)?.cast<String>() ?? [],
      subcategory: (json['subcategory'] as List?)
          ?.map((v) => Subcategory.fromJson(v))
          .toList() ??
          [],
      ratingsQuantity: json['ratingsQuantity'],
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'], // can be num (int or double)
      imageCover: json['imageCover'],
      category:
      json['category'] != null ? Category.fromJson(json['category']) : null,
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      priceAfterDiscount: json['priceAfterDiscount'],
    );
  }

  num? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity; // safer if backend sometimes returns decimals
  num? price;
  String? imageCover;
  Category? category;
  Brand? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? priceAfterDiscount;

  ProductEntity toProductEntity() {
    return ProductEntity(
      id: id,
      title: title,
      description: description,
      imageCover: imageCover,
      images: images,
      price: price,
      quantity: quantity?.toInt(),
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      slug: slug,
      sold: sold,
      priceAfterDiscount: priceAfterDiscount,
    );
  }
}
