import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/products_screen/data/data_source/product_data_source.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductResponseEntity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repository/product_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository{
final  ProductDataSource _dataSource;
@factoryMethod
  const ProductRepositoryImpl(this._dataSource);
  @override
  Future<Either<Failure, ProductResponseEntity>> getProduct() async{
  try{
var  response = await  _dataSource.getProduct();

return Right(response.toProductResponseEntity());

  }on AppException catch(exception){
  return  Left(Failure(exception.message));

  }
  }

}