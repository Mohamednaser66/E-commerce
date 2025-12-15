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
final class CleanCartSuccess extends CartState {}
final class CleanCartLoadingState extends CartState {}
final class CleanCartErrorState extends CartState {
  String? message;
  CleanCartErrorState({required this.message});
}
final class UpdateCartCountSuccess extends CartState {
  GetCartEntity cartEntity;
  UpdateCartCountSuccess({required this.cartEntity});
}
final class UpdateCartCountLoadingState extends CartState {}
final class UpdateCartCountErrorState extends CartState {
  String? message;
  UpdateCartCountErrorState({required this.message});
}
final class RemoveSpecificSuccess extends CartState {}
final class RemoveSpecificLoading extends CartState {}
final class RemoveSpecificError extends CartState {
  String? message;
  RemoveSpecificError({required this.message});
}
