import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/api/api_manget.dart';
import 'package:e_commerce/src/domain/entities/category_response_entity.dart';
import 'package:e_commerce/src/domain/repository/category_repository/data_source/category_remote_datasource.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class CategoryRemoteDataSourceImp implements CategoryRemoteDataSource {
  ApiManger apiManger;
  CategoryRemoteDataSourceImp({required this.apiManger});

  @override
  Future<Either<Failure, CategoryResponseEntity>> getCategory() async {
    var either = await apiManger.getAllCategory();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toEntity());
    });
  }
}

CategoryRemoteDataSource injectCategoryRemoteDataSource() {
  return CategoryRemoteDataSourceImp(apiManger: ApiManger.instance);
}
