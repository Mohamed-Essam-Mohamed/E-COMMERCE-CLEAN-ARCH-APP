import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/product_response_entity.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failure, ProductResponseEntity>> getAllProduct();
}
