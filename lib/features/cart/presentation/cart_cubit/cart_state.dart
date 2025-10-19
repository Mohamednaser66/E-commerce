part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartError extends CartState {
  String? message;
  CartError({required this.message});
}
final class CartSuccess extends CartState {
  GetCartEntity cartEntity;
  CartSuccess({required this.cartEntity});
}
