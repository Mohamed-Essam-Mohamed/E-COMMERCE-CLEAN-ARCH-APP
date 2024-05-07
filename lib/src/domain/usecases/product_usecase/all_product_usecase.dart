import 'package:dartz/dartz.dart';

import '../../../data/repositorys/product_repository/repsitory/product_repository_imp.dart';
import '../../../helper/failuers/failures.dart';
import '../../entities/product_entites/product_response_entity.dart';
import '../../repository/product_repository/repository/product_repository.dart';

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
