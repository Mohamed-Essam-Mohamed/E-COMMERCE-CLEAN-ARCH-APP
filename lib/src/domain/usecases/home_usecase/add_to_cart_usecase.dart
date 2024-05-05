import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/home_repository/repository/home_repository_imp.dart';
import 'package:e_commerce/src/domain/repository/home_repository/repository/home_repository.dart';

import '../../../helper/failuers/failures.dart';
import '../../entities/add_to_cart/addtocart_response_enitiy.dart';

class AddToCartUseCase {
  HomeRepository homeRepository;
  AddToCartUseCase({required this.homeRepository});
  Future<Either<Failure, AddToCartResponseEntity>> invoke(
      {required String productId}) async {
    return homeRepository.addToCart(productId: productId);
  }
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(homeRepository: injectHomeRepository());
}
