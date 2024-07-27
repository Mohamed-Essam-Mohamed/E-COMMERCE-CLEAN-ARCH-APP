import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';

import '../../../data/repositorys/home_repository/repository/home_repository_imp.dart';
import '../../../helper/failuers/failures.dart';
import '../../repository/home_repository/repository/home_repository.dart';

class GetProductSpecificUseCase {
  final HomeRepository getSpecificProductRepository;
  const GetProductSpecificUseCase({required this.getSpecificProductRepository});
  Future<Either<Failure, ProductResponseEntity>> invoke(
      {required String specificProductId}) async {
    return getSpecificProductRepository.getSpecificProduct(
        specificProductId: specificProductId);
  }
}

GetProductSpecificUseCase injectGetProductSpecificUseCases() =>
    GetProductSpecificUseCase(
        getSpecificProductRepository: injectHomeRepository());
