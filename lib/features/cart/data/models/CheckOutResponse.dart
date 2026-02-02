import 'Session.dart';


class CheckOutResponse {
  CheckOutResponse({
      this.status, 
      this.session,});

  CheckOutResponse.fromJson(dynamic json) {
    status = json['status'];
    session = json['session'] != null ? Session.fromJson(json['session']) : null;
  }
  String? status;
  Session? session;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (session != null) {
      map['session'] = session?.toJson();
    }
    return map;
  }

}