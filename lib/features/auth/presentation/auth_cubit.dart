import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/domain/use_case/auth_use_case.dart';
import 'package:ecommerce_app/features/auth/presentation/auth_cubit_state/auyh_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class AuthCubit extends Cubit<AuthState>{
  @factoryMethod
  AuthCubit( this._useCase):super(InitialState());
  AuthUseCase _useCase;
 register(RegisterRequest request)async{

      emit(RegisterLoadingState());
     var  result = await _useCase.invokeRegister(request);
    result.fold((failure) {
        emit(RegisterErrorState(errorMessage: failure.message));
      }, (user) {
       emit(RegisterSuccessState(user: user));
     }
    ,);

  }
  login(LoginRequest request)async{
    
      emit(LoginLoadingState());
      var result =await _useCase.invokeLogin(request);
    result.fold((failure) {
      emit(LoginErrorState(error: failure.message));
    }, (user) {
      emit(LoginSuccessState(user: user));
    },);
  }
  Future<String?> getToken(){
  return _useCase.getTokenUseCase();

  }

}