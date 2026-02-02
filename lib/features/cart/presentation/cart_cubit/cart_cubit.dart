import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart/data/models/CheckOutResponse.dart';
import 'package:ecommerce_app/features/cart/domain/usee_case/cart_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entity/get_cart_entity.dart';

part 'cart_state.dart';
@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this._useCase) : super(CartInitial());
  final CartUseCase _useCase;
  String? loadingProductId;


  getCartProduct()async{
    emit(CartLoading());
  var result= await _useCase.invokeGetCart();
  result.fold((error) {
    emit(CartError(message: error.message));

  }, (response) {
    emit(CartSuccess(cartEntity: response.data!.toCartProductEntity()));
  },);
  }
  clearCart()async{
    emit(CleanCartLoadingState());
    var result =await _useCase.invokeClearCart();
    result.fold((error) {
      emit(CleanCartErrorState(message: error.message));
    }, (response) {
      emit(CleanCartSuccess());
    },);
  }
  updateCartItemCount(int count ,String productId)async{
    loadingProductId=productId;
    emit(UpdateCartCountLoadingState());
   var result = await _useCase.invokeUpdateCartQuantity(count, productId);
   result.fold((error) {
     loadingProductId=null;
     emit(UpdateCartCountErrorState(message: error.message));
   }, (response) {
     loadingProductId=null;
     emit(UpdateCartCountSuccess(cartEntity: response.data!.toCartProductEntity()));
   },);

  }
  removeSpecificProduct(String productId)async{
    loadingProductId=productId;
    emit(RemoveSpecificLoading());
  var  result=await _useCase.invokeRemoveSpecificProduct(productId);
  result.fold((error) {
    loadingProductId=null;
    emit(RemoveSpecificError(message: error.message));
  }, (r) {
    loadingProductId=null;
    emit(RemoveSpecificSuccess());
  },);
  }
checkOut(String cartId)async{
    emit(CheckOutLoading());
    var result = await _useCase.checkOut(cartId);
    result.fold((l) {
      emit(CheckOutError(message: l.message));
    }, (r) {
      emit(CheckOutSuccess(response: r));
    },);
}
  launchMyUrl(String url) async {
    final uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
