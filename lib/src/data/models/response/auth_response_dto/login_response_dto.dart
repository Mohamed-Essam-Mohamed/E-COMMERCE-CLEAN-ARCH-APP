import '../../../../domain/entities/auth_entities/auth_response_entities.dart';
import 'regsiter_response_dto.dart';

class LoginResponseDto {
  String? message;
  UserDto? userDto;
  String? token;
  Errors? errors;

  LoginResponseDto({this.message, this.userDto, this.token, this.errors});

  LoginResponseDto.fromJson(Map<String, dynamic> json) {
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
    data['token'] = this.token;
    return data;
  }

  AuthResponseEntity toEntity() => AuthResponseEntity(
        userEntity: userDto?.toEntity(),
        token: token,
      );
}
