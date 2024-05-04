import 'package:dartz/dartz.dart';

import '../../../../helper/failuers/failures.dart';
import '../../../entities/product_entites/product_response_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponseEntity>> getAllProduct();
}
