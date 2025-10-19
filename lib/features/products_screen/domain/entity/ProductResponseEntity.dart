import 'ProductEntity.dart';

/// results : 56
/// data : [{"sold":21760,"images":["https://ecommerce.routemisr.com/Route-Academy-products/1680403397482-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397482-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397483-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403397485-4.jpeg"],"ratingsQuantity":18,"_id":"6428ebc6dc1175abc65ca0b9","title":"Woman Shawl","slug":"woman-shawl","description":"Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen","quantity":225,"price":191,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403397402-cover.jpeg","ratingsAverage":4.8}]

class ProductResponseEntity {
  ProductResponseEntity({
      this.results, 
      this.data,});

  int? results;
  List<ProductEntity>? data;


}