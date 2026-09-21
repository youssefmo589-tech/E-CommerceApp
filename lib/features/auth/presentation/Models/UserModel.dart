import 'package:ecommerce/features/auth/domain/entities/UserEntity.dart';

class UserModel extends UserEntity {
  static const String collectionname = 'users';

  UserModel({
    required super.name,
    super.userid,
    required super.email,
    required super.password,
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      userid: json['userid'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> tojson() {
    return {'name': name, 'userid': userid, 'email': email};
  }
}
