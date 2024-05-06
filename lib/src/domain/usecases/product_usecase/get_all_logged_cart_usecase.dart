import 'package:dartz/dartz.dart';
import '../../../data/repositorys/product_repository/repsitory/product_repository_imp.dart';
import '../../repository/product_repository/repository/product_repository.dart';

import '../../../helper/failuers/failures.dart';
import '../../entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';

class GetAllLoggedCartUseCase {
  final ProductRepository productRepository;
  GetAllLoggedCartUseCase({required this.productRepository});
  Future<Either<Failure, GetLoggedCartResponseEntity>> invoke() {
    return productRepository.getAllLoggedCart();
  }
}

GetAllLoggedCartUseCase injectGetAllLoggedCartUseCase() {
  return GetAllLoggedCartUseCase(productRepository: injectProductRepository());
}
