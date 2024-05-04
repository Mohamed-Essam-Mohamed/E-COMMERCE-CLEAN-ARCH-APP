import 'package:dartz/dartz.dart';
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
}

ProductRepository injectProductRepository() {
  return ProductRepositoryImp(
      productRemoteDataSource: injectProductRemoteDataSource());
}
