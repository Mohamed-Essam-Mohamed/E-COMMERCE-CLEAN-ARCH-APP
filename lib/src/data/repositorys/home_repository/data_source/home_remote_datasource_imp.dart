import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/api/api_manget.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';
import 'package:e_commerce/src/domain/entities/product_response_entity.dart';
import 'package:e_commerce/src/domain/repository/home_repository/data_source/home_remote_datasource.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  ApiManger apiManger;
  HomeRemoteDataSourceImp({required this.apiManger});

  @override
  Future<Either<Failure, CategoryResponseEntity>> getAllCategory() async {
    var either = await apiManger.getAllCategory();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toEntity());
    });
  }
}

HomeRemoteDataSource injectCategoryRemoteDataSource() {
  return HomeRemoteDataSourceImp(apiManger: ApiManger.instance);
}
