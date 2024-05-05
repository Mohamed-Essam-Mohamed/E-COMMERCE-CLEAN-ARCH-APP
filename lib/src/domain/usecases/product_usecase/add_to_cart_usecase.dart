import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/repository/product_repository/repository/product_repository.dart';
import '../../../data/repositorys/product_repository/repsitory/product_repository_imp.dart';
import '../../../helper/failuers/failures.dart';
import '../../entities/add_to_cart/addtocart_response_enitiy.dart';

class AddToCartUseCase {
  final ProductRepository productRepository;
  AddToCartUseCase({required this.productRepository});
  Future<Either<Failure, AddToCartResponseEntity>> invoke(
      {required String productId}) async {
    return productRepository.addToCart(productId: productId);
  }
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(productRepository: injectProductRepository());
}
