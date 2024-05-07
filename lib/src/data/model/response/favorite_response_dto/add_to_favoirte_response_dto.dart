import 'package:e_commerce/src/domain/entities/favorite_entities/add_to_favorite_response_entity.dart';

class AddToFavoriteResponseDto extends AddToFavoriteResponseEntity {
  AddToFavoriteResponseDto({super.status, super.message, super.data});

  AddToFavoriteResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'].cast<String>();
  }
}
