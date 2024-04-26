import 'package:dartz/dartz.dart';
import '../../../model/request/auth_request/login_request.dart';
import '../../../../domain/entities/auth_response_entities.dart';
import '../../../../helper/failuers/failures.dart';

import '../../../api/api_manget.dart';
import '../../../model/request/auth_request/register_request.dart';

import '../../../../domain/repository/data_source/auth_data_source_contract.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSourceContract {
  ApiManger apiManger;

  AuthRemoteDataSourceImp(this.apiManger);
  @override
  Future<Either<Failuer, AuthResponseEntity>> register(
      RegisterRequest registerRequest) async {
    var either = await apiManger.register(registerRequest);

    return either.fold((l) {
      return Left(Failuer(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toEntity());
    });
  }

  @override
  Future<Either<Failuer, AuthResponseEntity>> login(
      LoginRequest loginRequest) async {
    var either = await apiManger.login(loginRequest: loginRequest);
    return either.fold((l) {
      return Left(Failuer(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toEntity());
    });
  }
}

AuthRemoteDataSourceContract injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImp(ApiManger.instance);
}
