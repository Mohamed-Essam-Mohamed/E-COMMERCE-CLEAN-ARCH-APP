import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/domain/entities/add_to_cart/addtocart_response_enitiy.dart';
import '../../../api/api_manget.dart';
import '../../../../domain/entities/home_entites/categoryorbrand_response_entity.dart';
import '../../../../domain/repository/home_repository/data_source/home_remote_datasource.dart';
import '../../../../helper/failuers/failures.dart';

class HomeRemoteDataSourceImp implements HomeRemoteDataSource {
  ApiManger apiManger;
  HomeRemoteDataSourceImp({required this.apiManger});

  @override
  Future<Either<Failure, CategoryOrBrandResponseEntity>>
      getAllCategory() async {
    var either = await apiManger.getAllCategory();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toEntity());
    });
  }

  @override
  Future<Either<Failure, CategoryOrBrandResponseEntity>> getAllBrand() async {
    var either = await apiManger.getAllBrands();
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toEntity());
    });
  }

  @override
  Future<Either<Failure, AddToCartResponseEntity>> addToCart(
      {required String productId}) async {
    var either = await apiManger.addToCart(productId: productId);
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
}

HomeRemoteDataSource injectCategoryRemoteDataSource() {
  return HomeRemoteDataSourceImp(apiManger: ApiManger.instance);
}
