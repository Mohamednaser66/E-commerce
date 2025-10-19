import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/brand_data/data_source/brand_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/brand_data/models/BrandResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:BrandDataSource )
class BrandApiDataSourceImpl implements BrandDataSource{
 final Dio _dio =Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override

   getBrand()async {
    try{
      Response response =await _dio.get(ApiConstant.brands);
    return BrandResponse.fromJson(response.data);

    }on DioException catch(exception){
      String? message;
      message =exception.response?.data['message'];
      throw RemoteException(message?? 'Failed To Load Brands');
  }

}}