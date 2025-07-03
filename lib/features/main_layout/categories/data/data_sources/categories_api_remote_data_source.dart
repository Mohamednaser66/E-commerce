import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/data_sources/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CategoriesRemoteDataSource)
class CategoriesApiRemoteDataSource implements CategoriesRemoteDataSource{
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<CategoriesResponse> getCategories() async{
    try{
      final response = await _dio.get(ApiConstant.categoriesEndPoint);
      return CategoriesResponse.fromJson(response.data);
    }on DioException catch(exception){
      String? message;
      message = exception.response?.data["message"];
      throw RemoteException(message ?? "Failed To get Categories");
    }
  }

}