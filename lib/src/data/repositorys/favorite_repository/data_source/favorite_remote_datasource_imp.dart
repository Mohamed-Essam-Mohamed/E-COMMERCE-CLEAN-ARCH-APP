import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/api/api_manget.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/add_to_favorite_response_entity.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/get_all_favorite_response_enitiy.dart';
import 'package:e_commerce/src/domain/repository/favorite_repository/data_source/favorite_remote_datasource.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class FavoriteRemoteDataSourceImp extends FavoriteRemoteDataSource {
  ApiManger apiManger;
  FavoriteRemoteDataSourceImp({required this.apiManger});
  @override
  Future<Either<Failure, AddToFavoriteResponseEntity>> addToFavorite(
      {required String productId}) async {
    var either = await apiManger.addToFavorite(productId: productId);
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failure, GetAllFavoriteResponseEntity>> getAllFavorite() async {
    var either = await apiManger.getAllFavorite();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
}

FavoriteRemoteDataSource injectFavoriteRemoteDataSource() {
  return FavoriteRemoteDataSourceImp(apiManger: ApiManger.instance);
}
