import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/favorite_repository/data_source/favorite_remote_datasource_imp.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/add_to_favorite_response_entity.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/get_all_favorite_response_enitiy.dart';
import 'package:e_commerce/src/domain/repository/favorite_repository/data_source/favorite_remote_datasource.dart';
import 'package:e_commerce/src/domain/repository/favorite_repository/repository/favorite_repositroy.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class FavoriteRepositoryImp implements FavoriteRepository {
  FavoriteRemoteDataSource favoriteRemoteDataSource;
  FavoriteRepositoryImp({required this.favoriteRemoteDataSource});
  @override
  Future<Either<Failure, AddToFavoriteResponseEntity>> addToFavorite(
      {required String productId}) {
    return favoriteRemoteDataSource.addToFavorite(productId: productId);
  }

  @override
  Future<Either<Failure, GetAllFavoriteResponseEntity>> getAllFavorite() {
    return favoriteRemoteDataSource.getAllFavorite();
  }
}

FavoriteRepository injectFavoriteRepository() {
  return FavoriteRepositoryImp(
    favoriteRemoteDataSource: injectFavoriteRemoteDataSource(),
  );
}
