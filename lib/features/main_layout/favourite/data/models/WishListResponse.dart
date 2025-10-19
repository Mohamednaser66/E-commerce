import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';

class WishListResponse {
  WishListResponse({
    this.status,
    this.count,
    this.data,
  });

  String? status;
  int? count;
  List<dynamic>? data;

  WishListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['count'] = count;
    map['data'] = data;
    return map;
  }

}
