import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/add_to_cart/addtocart_response_enitiy.dart';
import '../data_source/home_remote_datasource_imp.dart';
import '../../../../domain/entities/home_entites/categoryorbrand_response_entity.dart';
import '../../../../domain/repository/home_repository/data_source/home_remote_datasource.dart';
import '../../../../domain/repository/home_repository/repository/home_repository.dart';
import '../../../../helper/failuers/failures.dart';

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
  Future<Either<Failure, AddToCartResponseEntity>> addToCart(
      {required String productId}) {
    return homeRemoteDataSource.addToCart(productId: productId);
  }
}

HomeRepository injectHomeRepository() {
  return HomeRepositoryImp(
      homeRemoteDataSource: injectCategoryRemoteDataSource());
}
