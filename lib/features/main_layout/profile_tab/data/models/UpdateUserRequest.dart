/// name : "Ahmed Abd "
/// email : "ahmedmutt26i2@gmail.com"
/// phone : "01010700730"

class UpdateUserRequest {
  UpdateUserRequest({
      this.name, 
      this.email, 
      this.phone,});

  UpdateUserRequest.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
  String? name;
  String? email;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

}