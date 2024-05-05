import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/add_to_cart/addtocart_response_enitiy.dart';
import '../data_source/product_remote_datasource_imp.dart';
import '../../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../../domain/repository/product_repository/data_source/prosuct_remote_datasource.dart';
import '../../../../domain/repository/product_repository/repository/product_repository.dart';
import '../../../../helper/failuers/failures.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImp({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProduct() {
    return productRemoteDataSource.getAllProduct();
  }

  @override
  Future<Either<Failure, AddToCartResponseEntity>> addToCart(
      {required String productId}) {
    return productRemoteDataSource.addToCart(productId: productId);
  }
}

ProductRepository injectProductRepository() {
  return ProductRepositoryImp(
      productRemoteDataSource: injectProductRemoteDataSource());
}
