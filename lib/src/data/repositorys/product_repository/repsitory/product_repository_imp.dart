import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/product_repository/data_source/product_remote_datasource_imp.dart';
import 'package:e_commerce/src/domain/entities/product_response_entity.dart';
import 'package:e_commerce/src/domain/repository/product_repository/data_source/prosuct_remote_datasource.dart';
import 'package:e_commerce/src/domain/repository/product_repository/repository/product_repository.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class ProductRepositoryImp implements ProductRepository {
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImp({required this.productRemoteDataSource});
  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProduct() {
    return productRemoteDataSource.getAllProduct();
  }
}

ProductRepository injectProductRepository() {
  return ProductRepositoryImp(
      productRemoteDataSource: injectProductRemoteDataSource());
}
