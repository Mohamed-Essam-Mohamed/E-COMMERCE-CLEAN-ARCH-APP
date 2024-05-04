import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/product_repository/repsitory/product_repository_imp.dart';
import 'package:e_commerce/src/domain/repository/product_repository/repository/product_repository.dart';

import '../../../helper/failuers/failures.dart';
import '../../entities/product_response_entity.dart';

class AllProductUseCase {
  final ProductRepository productRepository;
  AllProductUseCase({required this.productRepository});
  Future<Either<Failure, ProductResponseEntity>> invoke() {
    return productRepository.getAllProduct();
  }
}

AllProductUseCase injectAllProductUseCase() {
  return AllProductUseCase(productRepository: injectProductRepository());
}
