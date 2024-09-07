import 'package:dartz/dartz.dart';
import '../../../entities/product_entites/add_to_cart/addtocart_response_enitiy.dart';
import '../../../entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';

import '../../../../helper/failuers/failures.dart';
import '../../../entities/product_entites/product_response_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, ProductResponseEntity>> getAllProduct();
  Future<Either<Failure, AddToCartResponseEntity>> addToCart(
      {required String productId});
  Future<Either<Failure, GetLoggedCartResponseEntity>> getAllLoggedCart();
  Future<Either<Failure, GetLoggedCartResponseEntity>> deletItemCart(
      {required String cartId});
  Future<Either<Failure, GetLoggedCartResponseEntity>> updateCountInCart(
      {required String cartId, required String count});
  Future<Either<Failure, ProductDataEntity>> getProductItemDetails(
      {required String productId});
}
