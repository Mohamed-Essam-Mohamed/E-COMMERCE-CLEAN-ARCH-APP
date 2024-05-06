import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/product_entites/add_to_cart/addtocart_response_enitiy.dart';
import 'package:e_commerce/src/domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';
import '../../../entities/product_entites/product_response_entity.dart';
import '../../../../helper/failuers/failures.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failure, ProductResponseEntity>> getAllProduct();
  Future<Either<Failure, AddToCartResponseEntity>> addToCart(
      {required String productId});
  Future<Either<Failure, GetLoggedCartResponseEntity>> getAllLoggedCart();
  Future<Either<Failure, GetLoggedCartResponseEntity>> deletItemCart(
      {required String cartId});
  Future<Either<Failure, GetLoggedCartResponseEntity>> updateCountInCart(
      {required String cartId, required String count});
}
