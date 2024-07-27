import 'package:dartz/dartz.dart';

import '../../../data/repositorys/home_repository/repository/home_repository_imp.dart';
import '../../../helper/failuers/failures.dart';
import '../../entities/home_entites/categoryorbrand_response_entity.dart';
import '../../repository/home_repository/repository/home_repository.dart';

class GetAllBrandUseCase {
  final HomeRepository brandRepository;
  const GetAllBrandUseCase({required this.brandRepository});
  Future<Either<Failure, CategoryOrBrandResponseEntity>> invoke() async {
    return brandRepository.getAllBrand();
  }
}

GetAllBrandUseCase injectGetAllBrandsUseCases() =>
    GetAllBrandUseCase(brandRepository: injectHomeRepository());
