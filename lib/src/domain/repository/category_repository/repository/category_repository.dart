import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

abstract class CategoryRepository {
  Future<Either<Failure, CategoryResponseEntity>> getCategory();
}
