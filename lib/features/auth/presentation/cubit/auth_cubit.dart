import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/auth_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class AuthCubit extends Cubit<AuthState> {
  @factoryMethod
  AuthCubit(this._authUseCase,) : super(AuthInitial());
  final AuthUseCase _authUseCase;


  void register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await _authUseCase.invokeRegister(request);
    result.fold((failure) {
      emit(RegisterError(error: failure.message));
    }, (user) {
      emit(RegisterSuccess(user: user));
    },);
  }

  void login(LoginRequest request) async {
    emit(LoginLoading());
   var result =await  _authUseCase.invokeLogin(request);
   result.fold((failure) {
     emit(LoginError(failure.message));
   }, (user) {
     emit(LoginSuccess(user));
   },);
  }
}

sealed class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  User user;

  RegisterSuccess({required this.user});
}

class RegisterError extends AuthState {
  String error;

  RegisterError({required this.error});
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  User user;

  LoginSuccess(this.user);
}

class LoginError extends AuthState {
  String error;

  LoginError(this.error);
}
