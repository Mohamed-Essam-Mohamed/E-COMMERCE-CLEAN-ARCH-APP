import '../../../../domain/entities/auth_response_entities.dart';

class RegisterResponseDto {
  String? message;
  UserDto? userDto;
  Errors? errors;
  String? token;

  RegisterResponseDto({this.message, this.userDto, this.errors, this.token});

  RegisterResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userDto = json['user'] != null ? new UserDto.fromJson(json['user']) : null;
    errors =
        json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.userDto != null) {
      data['user'] = this.userDto!.toJson();
    }
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    data['token'] = this.token;
    return data;
  }

  //? convert to entity
  AuthResponseEntity toEntity() =>
      AuthResponseEntity(userEntity: userDto?.toEntity(), token: token);
}

//! register response user
class UserDto {
  String? name;
  String? email;
  String? role;

  UserDto({this.name, this.email, this.role});

  UserDto.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }

  //? convert to entity
  UserEntity toEntity() => UserEntity(
        name: name,
        email: email,
      );
}

//! register response Errors
class Errors {
  String? value;
  String? msg;
  String? param;
  String? location;

  Errors({this.value, this.msg, this.param, this.location});

  Errors.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['msg'] = this.msg;
    data['param'] = this.param;
    data['location'] = this.location;
    return data;
  }
}
