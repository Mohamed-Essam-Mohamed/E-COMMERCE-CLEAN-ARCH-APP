import 'package:dartz/dartz.dart';

import '../../../data/repositorys/product_repository/repsitory/product_repository_imp.dart';
import '../../../helper/failuers/failures.dart';
import '../../entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';
import '../../repository/product_repository/repository/product_repository.dart';

class UpdateCuntCartUseCase {
  final ProductRepository productRepository;
  UpdateCuntCartUseCase({required this.productRepository});
  Future<Either<Failure, GetLoggedCartResponseEntity>> invoke(
      {required String cartId, required String count}) {
    return productRepository.updateCountInCart(cartId: cartId, count: count);
  }
}

UpdateCuntCartUseCase injectUpdateCuntCartUseCase() {
  return UpdateCuntCartUseCase(productRepository: injectProductRepository());
}
