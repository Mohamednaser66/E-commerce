import 'package:ecommerce_app/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/resources/constants_manager.dart';
@Injectable(as:AuthLocalDataSource )
class AuthSharedPrefsDataSource implements AuthLocalDataSource{
  @override
  Future<String?> getToken()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   return  prefs.getString(CacheConstant.token);
  }

  @override
  void saveToken(String token)async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CacheConstant.token, token);
  }

  @override
  Future<User> getUser()async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
 return User(
     name:  prefs.getString("name")??'', email:  prefs.getString("email")??'', role: prefs.getString('role')??'' );
  }

  @override
  void saveUser(User user) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", user.name);
    await prefs.setString("email", user.email);
    await prefs.setString("role", user.role);
  }


}