import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/add_to_cart/addtocart_response_enitiy.dart';
import '../../../entities/product_entites/product_response_entity.dart';
import '../../../../helper/failuers/failures.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failure, ProductResponseEntity>> getAllProduct();
  Future<Either<Failure, AddToCartResponseEntity>> addToCart(
      {required String productId});
}
