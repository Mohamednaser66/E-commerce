import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/domain/use_case/wish_list_use_case.dart';
import 'package:ecommerce_app/features/products_screen/domain/entity/ProductEntity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';
@injectable
class WishListCubit extends Cubit<WishListState> {
 final WishListUseCase _useCase;
 List<ProductEntity> products =[];
 String? loadingProductId;

  @factoryMethod
  WishListCubit(this._useCase) : super(WishListInitial());
  getWishList()async{
    emit(GetWishListLoading());
  var result =await  _useCase.invokeGetWishList();
  result.fold((l) =>emit(GetWishListError(message: l.message)) ,

       (r) {
   products=r.data!;
   emit(GetWishListSuccess(products: r.data!));
       } ,);

  }
 addToWishList(String productId)async{
    loadingProductId=productId;
  emit(EditWishListLoading());
  var result =await  _useCase.invokeAddToWishList(productId);
  result.fold((l) {
    loadingProductId=null;
    emit(EditWishListError(message: l.message));
  }, (r) {
    loadingProductId=null;
    emit( EditWishListSuccess());
  },);

 }
 removeFromWishList(String productId)async{
    loadingProductId=productId;
  emit(EditWishListLoading());
  var result =await  _useCase.invokeDeleteFromWishList(productId);
  result.fold((l) {
    loadingProductId=null;
   emit(EditWishListError(message: l.message));
  }, (r) {
    loadingProductId=null;
    products.removeWhere((element) => element.id == productId);
    emit( EditWishListSuccess());
  },);

 }
bool cheekIsFav(String productId,){
   return products.any((element) => element.id==productId,);

}
 editWishList(String productId, bool isFav) {
   if (isFav==true) {
     return addToWishList(productId);
   } else if(isFav ==false){
     return removeFromWishList(productId);
   }
 }
}
