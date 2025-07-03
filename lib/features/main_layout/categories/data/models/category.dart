class Category {
  Category({
      required this.id,
      required this.name,
      required this.slug,
      required this.image,
      required this.createdAt,
      required this.updatedAt,});

 factory Category.fromJson(dynamic json) {
   return Category(id: json['_id'], name: json['name'], slug: json['slug'], image: json['image'], createdAt:  json['createdAt'], updatedAt: json['updatedAt']);

  }
  String id;
  String name;
  String slug;
  String image;
  String createdAt;
  String updatedAt;



}