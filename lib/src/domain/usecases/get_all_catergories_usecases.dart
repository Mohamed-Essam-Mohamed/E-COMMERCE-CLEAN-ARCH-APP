import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/categories_repository/repository/category_repository_imp.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';
import 'package:e_commerce/src/domain/repository/category_repository/repository/category_repository.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class GetAllCategoriesUseCases {
  CategoryRepository categoryRepository;
  GetAllCategoriesUseCases({required this.categoryRepository});
  Future<Either<Failure, CategoryResponseEntity>> invoke() async {
    return categoryRepository.getCategory();
  }
}

GetAllCategoriesUseCases injectGetAllCategoriesUseCases() =>
    GetAllCategoriesUseCases(categoryRepository: injectCategoryRepository());
