import 'package:ecommerce_app/features/cart/domain/entity/get_cart_response_entity.dart';

import 'cart.dart';

/// status : "success"
/// numOfCartItems : 2
/// cartId : "68ee76c100820cb5a4fb0918"
/// data : {"_id":"68ee76c100820cb5a4fb0918","cartOwner":"68e46327d1f44b020671adb1","products":[{"count":1,"_id":"68ee76c100820cb5a4fb0919","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428e997dc1175abc65ca0a1","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680402838276-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428e997dc1175abc65ca0a1"},"price":149},{"count":4,"_id":"68ee76f000820cb5a4fb0939","product":{"subcategory":[{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}],"_id":"6428ead5dc1175abc65ca0ad","title":"Woman Shawl","quantity":220,"imageCover":"https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg","category":{"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"},"brand":{"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"},"ratingsAverage":4.8,"id":"6428ead5dc1175abc65ca0ad"},"price":149}],"createdAt":"2025-10-14T16:13:53.897Z","updatedAt":"2025-10-16T18:20:19.179Z","__v":1,"totalCartPrice":745}

class GetCartResponse {
  GetCartResponse({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  GetCartResponse.fromJson(dynamic json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? Cart.fromJson(json['data']) : null;
  }
  String? status;
  int? numOfCartItems;
  String? cartId;
  Cart? data;

  GetCartResponseEntity toGetCartResponseEntity(){
  return GetCartResponseEntity(data: data, status: status, cartId: cartId);
}
}