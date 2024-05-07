import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/get_all_favorite_response_enitiy.dart';

import '../../../../helper/failuers/failures.dart';
import '../../../entities/favorite_entities/add_to_favorite_response_entity.dart';

abstract class FavoriteRemoteDataSource {
  Future<Either<Failure, AddToFavoriteResponseEntity>> addToFavorite(
      {required String productId});
  Future<Either<Failure, GetAllFavoriteResponseEntity>> getAllFavorite();
}
