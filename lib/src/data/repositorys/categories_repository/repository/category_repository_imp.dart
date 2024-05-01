import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/repositorys/categories_repository/data_source/category_remote_datasource_imp.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';
import 'package:e_commerce/src/domain/repository/category_repository/data_source/category_remote_datasource.dart';
import 'package:e_commerce/src/domain/repository/category_repository/repository/category_repository.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class CategoryRepositoryImp implements CategoryRepository {
  CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryRepositoryImp({required this.categoryRemoteDataSource});
  @override
  Future<Either<Failure, CategoryResponseEntity>> getCategory() {
    return categoryRemoteDataSource.getCategory();
  }
}

CategoryRepository injectCategoryRepository() {
  return CategoryRepositoryImp(
      categoryRemoteDataSource: injectCategoryRemoteDataSource());
}
