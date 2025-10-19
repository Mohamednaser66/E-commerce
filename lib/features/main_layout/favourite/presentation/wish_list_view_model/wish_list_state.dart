part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}
final class   EditWishListLoading extends WishListState {}
final class EditWishListError extends WishListState {
  String? message;
  EditWishListError({required this.message});
}
final class EditWishListSuccess extends WishListState {}
final class GetWishListLoading extends WishListState {}
final class GetWishListError extends WishListState {
  String? message;
  GetWishListError({required this.message});
}
final class GetWishListSuccess extends WishListState {
  List<ProductEntity> products;
  GetWishListSuccess({required this.products});
}
