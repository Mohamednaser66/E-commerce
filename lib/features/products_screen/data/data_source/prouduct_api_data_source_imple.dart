import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/product_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductDataSource)
class ProductApiDataSourceImpl implements ProductDataSource{
  @override
 final  Dio _dio =Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  Future<ProductResponse> getProduct() async{

    try{
      var  response= await  _dio.get(ApiConstant.products);
      return  ProductResponse.fromJson(response.data);
      
    } on DioException catch(exception){
      String? message;
   message=   exception.response?.data["message"];
      throw RemoteException(message?? 'Failed To Load Product');
    }
  }
  
}