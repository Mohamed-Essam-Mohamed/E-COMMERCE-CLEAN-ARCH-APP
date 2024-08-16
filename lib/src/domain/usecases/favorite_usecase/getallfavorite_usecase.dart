import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/model/response/favorite_response_dto/get_all_favorite_response_dto.dart';
import 'package:e_commerce/src/data/repositorys/favorite_repository/repository/favorite_repository_imp.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/add_to_favorite_response_entity.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/get_all_favorite_response_enitiy.dart';
import 'package:e_commerce/src/domain/repository/favorite_repository/repository/favorite_repositroy.dart';

import '../../../helper/failuers/failures.dart';

class GetAllFavoriteUseCase {
  FavoriteRepository favoriteRepository;

  GetAllFavoriteUseCase({required this.favoriteRepository});

  Future<Either<Failure, GetAllFavoriteResponseEntity>> invoke() async {
    return favoriteRepository.getAllFavorite();
  }
}

GetAllFavoriteUseCase injectGetAllFavoriteUseCase() {
  return GetAllFavoriteUseCase(favoriteRepository: injectFavoriteRepository());
}
