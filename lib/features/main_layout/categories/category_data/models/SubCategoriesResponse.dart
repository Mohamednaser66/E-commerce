
import 'package:ecommerce_app/features/main_layout/categories/category_data/models/Metadata.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_domain/entity/sub_category_response_entity.dart';

import 'sub_category.dart';

/// results : 2
/// metadata : {"currentPage":1,"numberOfPages":1,"limit":40}
/// data : [{"_id":"6407f276b575d3b90bf957b8","name":"Bags & luggage","slug":"bags-and-luggage","category":"6439d5b90049ad0b52b90048","createdAt":"2023-03-08T02:27:02.780Z","updatedAt":"2023-04-14T23:10:29.386Z"},{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048","createdAt":"2023-03-08T02:26:11.097Z","updatedAt":"2023-04-14T23:10:29.386Z"}]

class SubCategoriesResponse {
  SubCategoriesResponse({
      this.results, 
      this.metadata, 
      this.data,});

  SubCategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SubCategory.fromJson(v));
      });
    }
  }
  int? results;
  Metadata? metadata;
  List<SubCategory>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
  SubCategoryResponseEntity toSubCategoryResponseEntity(){
  return  SubCategoryResponseEntity(data: data?.map((e) => e.toSubCategoryEntity(),).toList(),results: results);
}
}