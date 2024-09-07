import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/product_repository/repsitory/product_repository_imp.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:e_commerce/src/domain/repository/product_repository/repository/product_repository.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class GetProductItemUseCase {
  final ProductRepository productRepository;

  GetProductItemUseCase({required this.productRepository});

  Future<Either<Failure, ProductDataEntity>> invoke(
      {required String productId}) async {
    return await productRepository.getProductItemDetails(productId: productId);
  }
}

GetProductItemUseCase injectGetProductItemUseCase() {
  return GetProductItemUseCase(productRepository: injectProductRepository());
}
