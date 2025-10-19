import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/brand_domain/brand_reository/brand_repository.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/brand_domain/entities/brand_entity/brand_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/error/failure.dart';
@injectable
class BrandUseCase{
 final BrandRepository _repository;
@factoryMethod
 BrandUseCase( this._repository);
 Future<Either<Failure, BrandResponseEntity>>  invoke()async{
    return   _repository.getBrand();
  }

}