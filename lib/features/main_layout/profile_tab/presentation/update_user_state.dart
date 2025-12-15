part of 'update_user_cubit.dart';

@immutable
sealed class UpdateUserState {}

final class UpdateUserInitial extends UpdateUserState {}
final class UpdateUserLoading extends UpdateUserState {}
final class UpdateUserError extends UpdateUserState {
  String message;
  UpdateUserError({required this.message});
}
final class UpdateUserSuccess extends UpdateUserState {
  UpdateUserResponse response;
  UpdateUserSuccess({required this.response});
}
