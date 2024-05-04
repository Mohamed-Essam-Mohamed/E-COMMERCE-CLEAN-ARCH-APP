import 'package:dartz/dartz.dart';
import '../../../entities/product_entites/product_response_entity.dart';
import '../../../../helper/failuers/failures.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failure, ProductResponseEntity>> getAllProduct();
}
