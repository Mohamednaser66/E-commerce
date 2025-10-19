import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/domain/usee_case/get-cart_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/get_cart_entity.dart';

part 'cart_state.dart';
@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this._useCase) : super(CartInitial());
  final GetCartUseCase _useCase;

  getCartProduct()async{
    emit(CartLoading());
  var result= await _useCase.invoke();
  result.fold((error) {
    emit(CartError(message: error.message));

  }, (response) {
    emit(CartSuccess(cartEntity: response.data!.toCartProduct()));
  },);
  }
}
