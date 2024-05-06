import 'package:dartz/dartz.dart';

import '../../../../helper/failuers/failures.dart';
import '../../../entities/home_entites/categoryorbrand_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllCategory();
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllBrand();
}
