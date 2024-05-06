import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/product_entites/add_to_cart/addtocart_response_enitiy.dart';
import '../../../entities/home_entites/categoryorbrand_response_entity.dart';

import '../../../../helper/failuers/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllCategory();
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllBrand();
}
