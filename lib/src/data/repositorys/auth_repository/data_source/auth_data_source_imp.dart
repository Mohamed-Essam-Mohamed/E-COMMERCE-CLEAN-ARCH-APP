import 'package:dartz/dartz.dart';
import '../../../model/request/auth_request/login_request.dart';
import '../../../../domain/entities/auth_response_entities.dart';
import '../../../../helper/failuers/failures.dart';

import '../../../api/api_manget.dart';
import '../../../model/request/auth_request/register_request.dart';

import '../../../../domain/repository/auth_repository/data_source/auth_remote_datasource_contract.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSourceContract {
  ApiManger apiManger;

  AuthRemoteDataSourceImp(this.apiManger);
  @override
  Future<Either<Failure, AuthResponseEntity>> register(
      RegisterRequest registerRequest) async {
    var either = await apiManger.register(registerRequest);

    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toEntity());
    });
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
      LoginRequest loginRequest) async {
    var either = await apiManger.login(loginRequest: loginRequest);
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toEntity());
    });
  }
}

AuthRemoteDataSourceContract injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImp(ApiManger.instance);
}
