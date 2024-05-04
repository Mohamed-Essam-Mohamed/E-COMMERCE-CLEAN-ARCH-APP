import 'package:dartz/dartz.dart';
import '../../../data/repositorys/home_repository/repository/home_repository_imp.dart';
import '../../repository/home_repository/repository/home_repository.dart';

import '../../../helper/failuers/failures.dart';
import '../../entities/home_entites/categoryorbrand_response_entity.dart';

class GetAllBrandUsecase {
  final HomeRepository BrandRepository;
  const GetAllBrandUsecase({required this.BrandRepository});
  Future<Either<Failure, CategoryOrBrandResponseEntity>> invoke() async {
    return BrandRepository.getAllBrand();
  }
}

GetAllBrandUsecase injectGetAllBrandsUseCases() =>
    GetAllBrandUsecase(BrandRepository: injectCategoryRepository());
