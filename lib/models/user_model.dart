// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  bool status;
  String message;
  UserData? data;
  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory UserModel.fromJson(json) {
    return UserModel(
      status: json['status'],
      message: json["message"],
      data: json['data']!=null? UserData.fromJson(json['data']):null,
    );
  }
}

class UserData {
  int id;
  String name;
  String email;
  String phone;
  String token;
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.token,
  });

  factory UserData.fromJson(json) {
    return UserData(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        token: json['token']);
  }
}
