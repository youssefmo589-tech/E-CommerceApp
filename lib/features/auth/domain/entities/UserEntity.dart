class UserEntity {
  String name;

  String ? userid;

  String password;

  String email;


  UserEntity(
      {required this.name, this.userid, required this.email, required this.password});
}
