/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttii54012@gmail.com"
/// role : "user"

class User {
  User({
      required this.name,
      required this.email,
      required this.role,});

 factory User.fromJson(dynamic json) {
   return User(name:  json['name'], email: json['email'], role: json['role']);

  }
  String name;
  String email;
  String role;


}