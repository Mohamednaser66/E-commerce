import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/brand_data/models/BrandResponse.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/brand_domain/entities/brand_entity/brand_response_entity.dart';

abstract class BrandRepository{
  Future<Either<Failure,BrandResponseEntity>> getBrand();
}