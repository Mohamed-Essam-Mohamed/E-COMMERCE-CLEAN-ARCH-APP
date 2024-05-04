import 'package:dartz/dartz.dart';
import '../../../entities/home_entites/categoryorbrand_response_entity.dart';

import '../../../../helper/failuers/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllCategory();
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllBrand();
}
