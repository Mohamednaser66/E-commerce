import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/brand_data/data_source/brand_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/brand_data/models/BrandResponse.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/brand_domain/brand_reository/brand_repository.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/brand_domain/entities/brand_entity/brand_response_entity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:BrandRepository )
class BrandRepositoryImpl implements BrandRepository{
  final BrandDataSource _dataSource;
  @factoryMethod
  BrandRepositoryImpl(this._dataSource);
  @override
  Future<Either<Failure,BrandResponseEntity >> getBrand() async{
 try{
   var response  =await _dataSource.getBrand();
 var entity =  response.toBrandResponseEntity();
 return Right(entity);
 }on AppException catch(error){
  return Left(Failure(error.message));
   }
  }

}