
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entity/get_cart_response_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repository/get_cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase{
 final GetCartRepo _repo;
  @factoryMethod
  GetCartUseCase(this._repo);
 Future<Either<Failure, GetCartResponseEntity>> invoke(){
    return _repo.getCartProduct();
  }
}