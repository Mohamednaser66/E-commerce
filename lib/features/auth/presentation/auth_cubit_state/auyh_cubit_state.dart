import 'package:ecommerce_app/features/auth/data/models/User.dart';

sealed class AuthState{}

class InitialState extends AuthState{}
class RegisterLoadingState extends AuthState{}
class RegisterSuccessState extends AuthState{
  User user;
  RegisterSuccessState({required this.user});
}
class RegisterErrorState extends AuthState{
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}
class LoginLoadingState extends AuthState{}
class LoginSuccessState extends AuthState{
  User user;
  LoginSuccessState({required this.user});
}
class LoginErrorState extends AuthState{
  String error;
  LoginErrorState({required this.error});
}
