class AuthResponseEntity {
  UserEntity? userEntity;

  String? token;

  AuthResponseEntity({this.userEntity, this.token});
}

//! register response user
class UserEntity {
  String? name;
  String? email;
  String? role;

  UserEntity({this.name, this.email, this.role});
}
