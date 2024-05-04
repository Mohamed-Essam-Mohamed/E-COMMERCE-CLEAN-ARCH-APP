import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/home_repository/data_source/home_remote_datasource_imp.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';
import 'package:e_commerce/src/domain/repository/home_repository/data_source/home_remote_datasource.dart';
import 'package:e_commerce/src/domain/repository/home_repository/repository/home_repository.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImp({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, CategoryResponseEntity>> getAllCategory() {
    return homeRemoteDataSource.getAllCategory();
  }
}

HomeRepository injectCategoryRepository() {
  return HomeRepositoryImp(
      homeRemoteDataSource: injectCategoryRemoteDataSource());
}
