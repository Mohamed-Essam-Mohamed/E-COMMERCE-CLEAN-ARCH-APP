import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/home_repository/repository/home_repository_imp.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';
import 'package:e_commerce/src/domain/repository/home_repository/repository/home_repository.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class GetAllCategoriesUseCases {
  HomeRepository categoryRepository;
  GetAllCategoriesUseCases({required this.categoryRepository});
  Future<Either<Failure, CategoryResponseEntity>> invoke() async {
    return categoryRepository.getAllCategory();
  }
}

GetAllCategoriesUseCases injectGetAllCategoriesUseCases() =>
    GetAllCategoriesUseCases(categoryRepository: injectCategoryRepository());
