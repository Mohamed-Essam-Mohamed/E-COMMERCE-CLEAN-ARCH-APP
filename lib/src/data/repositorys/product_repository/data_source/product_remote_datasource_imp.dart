import 'package:dartz/dartz.dart';
import '../../../../domain/entities/product_entites/add_to_cart/addtocart_response_enitiy.dart';
import '../../../../domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';
import '../../../api/api_manget.dart';
import '../../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../../domain/repository/product_repository/data_source/prosuct_remote_datasource.dart';
import '../../../../helper/failuers/failures.dart';

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  ApiManger apiManger;
  ProductRemoteDataSourceImp({required this.apiManger});

  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProduct() async {
    var either = await apiManger.getAllProduct();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toEntity());
    });
  }

  @override
  Future<Either<Failure, AddToCartResponseEntity>> addToCart(
      {required String productId}) async {
    var either = await apiManger.addToCart(productId: productId);
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failure, GetLoggedCartResponseEntity>>
      getAllLoggedCart() async {
    var either = await apiManger.getAllCart();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failure, GetLoggedCartResponseEntity>> deletItemCart(
      {required String cartId}) async {
    var either = await apiManger.deleteItemCart(cartId: cartId);
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failure, GetLoggedCartResponseEntity>> updateCountInCart(
      {required String cartId, required String count}) async {
    var either =
        await apiManger.updateCountInCart(cartId: cartId, count: count);
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
}

ProductRemoteDataSource injectProductRemoteDataSource() {
  return ProductRemoteDataSourceImp(apiManger: ApiManger.instance);
}
