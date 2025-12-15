import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserRequest.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/data/models/UpdateUserResponse.dart';
import 'package:ecommerce_app/features/main_layout/profile_tab/domain/usecase/update_user_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'update_user_state.dart';
@injectable
class ProfileCubit extends Cubit<UpdateUserState> {
  @factoryMethod
  ProfileCubit(this._useCase) : super(UpdateUserInitial());
  UpdateUserUseCase _useCase;
  UpdateUser(UpdateUserRequest request)async{
 emit(UpdateUserLoading());
 var result =await _useCase.invoke(request);
 result.fold((error) {
   emit(UpdateUserError(message: error.message));
 }, (response) {
emit(UpdateUserSuccess(response: response));
 },);


  }
  logout(BuildContext context){
    removeUserData();
      Navigator.pushReplacementNamed(context, Routes.signInRoute);


  }
removeUserData()async{
  SharedPreferences prefs =await SharedPreferences.getInstance();
   prefs.remove("name");
   prefs.remove("email");
   prefs.remove("role");
   prefs.remove(CacheConstant.token);

}
}
