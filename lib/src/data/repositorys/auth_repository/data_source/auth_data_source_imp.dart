import 'package:dartz/dartz.dart';

import '../../../../domain/entities/auth_entities/auth_response_entities.dart';
import '../../../../domain/entities/auth_entities/fotgot_pass_response_entity.dart';
import '../../../../domain/entities/auth_entities/reset_code_response_entity.dart';
import '../../../../domain/entities/auth_entities/reset_pass_response_entity.dart';
import '../../../../domain/repository/auth_repository/data_source/auth_remote_datasource_contract.dart';
import '../../../../helper/failuers/failures.dart';
import '../../../api/api_manget.dart';
import '../../../model/request/auth_request/forgot_pass_request.dart';
import '../../../model/request/auth_request/login_request.dart';
import '../../../model/request/auth_request/register_request.dart';
import '../../../model/request/auth_request/reset_pass_request.dart';
import '../../../model/request/auth_request/resset_code_request.dart';

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

  @override
  Future<Either<Failure, ForgotPasswordResponseEntity>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    var either = await apiManger.forgotPassword(
        forgotPasswordRequest: forgotPasswordRequest);
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toEntity());
    });
  }

  @override
  Future<Either<Failure, ResetCodeResponseEntity>> resetCode(
      ResetCodeRequest resetCodeRequest) async {
    var either = await apiManger.resetCode(resetCodeRequest: resetCodeRequest);
    return either.fold((l) {
      return Left(Failure(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toEntity());
    });
  }

  @override
  Future<Either<Failure, ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) async {
    var either = await apiManger.resetPassword(
        resetPasswordRequest: resetPasswordRequest);
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
