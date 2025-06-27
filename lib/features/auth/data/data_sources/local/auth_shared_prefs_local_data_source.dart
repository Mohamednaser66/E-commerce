import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource{


  @override
  Future<void> saveToken(String token) async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString(CacheConstant.token, token);
  }

  @override
  Future<String> getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   return prefs.getString(CacheConstant.token)!;

  }


}