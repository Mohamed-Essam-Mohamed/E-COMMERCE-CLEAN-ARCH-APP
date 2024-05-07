import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/favorite_repository/repository/favorite_repository_imp.dart';
import 'package:e_commerce/src/domain/repository/favorite_repository/repository/favorite_repositroy.dart';

import '../../../helper/failuers/failures.dart';
import '../../entities/favorite_entities/add_to_favorite_response_entity.dart';

class AddFavorteUsecase {
  FavoriteRepository favoriteRepository;

  AddFavorteUsecase({required this.favoriteRepository});

  Future<Either<Failure, AddToFavoriteResponseEntity>> invoke(
      {required String productId}) async {
    return favoriteRepository.addToFavorite(productId: productId);
  }
}

AddFavorteUsecase injectAddFavorteUsecase() {
  return AddFavorteUsecase(favoriteRepository: injectFavoriteRepository());
}
