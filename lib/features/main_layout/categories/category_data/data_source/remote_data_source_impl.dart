import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_data/data_source/remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_data/models/CategoriesResponse.dart';
import 'package:ecommerce_app/features/main_layout/categories/category_data/models/SubCategoriesResponse.dart';

import 'package:injectable/injectable.dart';
@Injectable(as: CategoryRemoteDataSource)
class CategoryApiDataSource implements CategoryRemoteDataSource{
  final Dio _dio =Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<CategoriesResponse> getCategory()async  {
   try{var response=  await _dio.get(ApiConstant.categoriesEndPoint);
return CategoriesResponse.fromJson(response.data);
  }on DioException catch(exception){
     String? message;
   message=  exception.response?.data['message'];
   throw RemoteException(message??'Failed Load Category');
   }

  }

  @override
  Future<SubCategoriesResponse> getSubCategory(String categoryId)async {
   try{
     var response=await  _dio.get(ApiConstant.subCategory(categoryId));
     return SubCategoriesResponse.fromJson(response.data);
   }on DioException catch(exception){
     String?message;
     message=exception.response?.data['message'];
     throw RemoteException(message??"Failed To Load Subcategories");
   }



  }

}