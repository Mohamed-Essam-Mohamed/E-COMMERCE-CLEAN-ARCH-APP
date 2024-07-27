import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';

import '../../../../helper/failuers/failures.dart';
import '../../../entities/home_entites/categoryorbrand_response_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllCategory();
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllBrand();
  Future<Either<Failure, ProductResponseEntity>> getSpecificProduct(
      {required String specificProductId});
}
