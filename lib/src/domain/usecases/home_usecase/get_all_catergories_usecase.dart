import 'package:dartz/dartz.dart';

import '../../../data/repositorys/home_repository/repository/home_repository_imp.dart';
import '../../../helper/failuers/failures.dart';
import '../../entities/home_entites/categoryorbrand_response_entity.dart';
import '../../repository/home_repository/repository/home_repository.dart';

class GetAllCategoriesUseCases {
  HomeRepository categoryRepository;
  GetAllCategoriesUseCases({required this.categoryRepository});
  Future<Either<Failure, CategoryOrBrandResponseEntity>> invoke() async {
    return categoryRepository.getAllCategory();
  }
}

GetAllCategoriesUseCases injectGetAllCategoriesUseCases() =>
    GetAllCategoriesUseCases(categoryRepository: injectCategoryRepository());
