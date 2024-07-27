import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';

import '../../../../domain/entities/home_entites/categoryorbrand_response_entity.dart';
import '../../../../domain/repository/home_repository/data_source/home_remote_datasource.dart';
import '../../../../domain/repository/home_repository/repository/home_repository.dart';
import '../../../../helper/failuers/failures.dart';
import '../data_source/home_remote_datasource_imp.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImp({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllCategory() {
    return homeRemoteDataSource.getAllCategory();
  }

  @override
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllBrand() {
    return homeRemoteDataSource.getAllBrand();
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getSpecificProduct(
      {required String specificProductId}) {
    return homeRemoteDataSource.getSpecificProduct(
        specificProductId: specificProductId);
  }
}

HomeRepository injectHomeRepository() {
  return HomeRepositoryImp(
      homeRemoteDataSource: injectCategoryRemoteDataSource());
}
