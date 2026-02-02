
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/cart/data/models/CheckOutResponse.dart';
import 'package:ecommerce_app/features/cart/domain/entity/get_cart_response_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repository/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartUseCase{
 final CartRepo _repo;
  @factoryMethod
  CartUseCase(this._repo);
 Future<Either<Failure, CartResponseEntity>> invokeGetCart(){
    return _repo.getCartProduct();
  }
  Future<Either<Failure,CartResponseEntity>> invokeUpdateCartQuantity(int count,String productId){
  return _repo.updateCartProductQuantity(count, productId);
  }
  Future<Either<Failure,void>>invokeClearCart(){
  return _repo.clearCart();
  }
 Future<Either<Failure,void>> invokeRemoveSpecificProduct(String productId){
  return _repo.removeSpecificProduct(productId);
 }
 Future<Either<Failure,CheckOutResponse>>checkOut(String cartId){
  return _repo.checkOut(cartId);
 }
}