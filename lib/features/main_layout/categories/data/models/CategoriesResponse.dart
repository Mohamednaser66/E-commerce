import 'Metadata.dart';
import 'category.dart';

class CategoriesResponse {
  CategoriesResponse({
    required this.results,
    required this.metadata,
    required this.categories,});
  int results;
  Metadata metadata;
  List<Category> categories;

  factory CategoriesResponse.fromJson(dynamic json) {
    return CategoriesResponse(results: json['results'],
        metadata: Metadata.fromJson((json['metadata'])),
        categories: (json["data"] as List).map((e) =>
            Category.fromJson(e),).toList());
  }
}





