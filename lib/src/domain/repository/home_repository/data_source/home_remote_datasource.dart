import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';

import '../../../../helper/failuers/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, CategoryResponseEntity>> getAllCategory();
}
