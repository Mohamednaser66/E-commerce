/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttii54012@gmail.com"
/// password : "Ahmed@123"
/// rePassword : "Ahmed@123"
/// phone : "01010700701"

class RegisterRequest {
  RegisterRequest({
      required this.name,
      required this.email,
      required this.password,
      required this.rePassword,
      required this.phone,});


  String name;
  String email;
  String password;
  String rePassword;
  String phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }

}