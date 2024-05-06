import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/product_repository/repsitory/product_repository_imp.dart';
import 'package:e_commerce/src/domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';
import 'package:e_commerce/src/domain/repository/product_repository/repository/product_repository.dart';

import '../../../helper/failuers/failures.dart';

class DeleteItemCartUseCase {
  final ProductRepository productRepository;

  DeleteItemCartUseCase({required this.productRepository});

  Future<Either<Failure, GetLoggedCartResponseEntity>> invoke(
      {required String carttId}) async {
    return productRepository.deletItemCart(cartId: carttId);
  }
}

DeleteItemCartUseCase injectDeleteItemCartUseCase() {
  return DeleteItemCartUseCase(productRepository: injectProductRepository());
}
