import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(AuthInitial());
  final AuthRepository _authRepository;

  void register(RegisterRequest request) async {
    try {
      emit(AuthLoading());
      User user = await _authRepository.register(request);
      emit(AuthSuccess(user: user));
    } catch (error) {
      emit(AuthError(error: error.toString()));
    }
  }
}

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  User user;

  AuthSuccess({required this.user});
}

class AuthError extends AuthState {
  String error;

  AuthError({required this.error});
}
