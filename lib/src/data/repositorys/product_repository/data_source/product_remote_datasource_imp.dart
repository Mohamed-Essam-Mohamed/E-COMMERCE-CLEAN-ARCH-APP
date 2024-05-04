import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/api/api_manget.dart';
import 'package:e_commerce/src/domain/entities/product_response_entity.dart';
import 'package:e_commerce/src/domain/repository/product_repository/data_source/prosuct_remote_datasource.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

class ProductRemoteDataSourceImp implements ProductRemoteDataSource {
  ApiManger apiManger;
  ProductRemoteDataSourceImp({required this.apiManger});

  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProduct() async {
    var either = await apiManger.getAllProduct();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toEntity());
    });
  }
}

ProductRemoteDataSource injectProductRemoteDataSource() {
  return ProductRemoteDataSourceImp(apiManger: ApiManger.instance);
}
