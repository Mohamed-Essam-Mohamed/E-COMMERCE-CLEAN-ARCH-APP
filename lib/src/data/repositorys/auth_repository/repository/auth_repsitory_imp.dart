import 'package:dartz/dartz.dart';

import '../../../../domain/entities/auth_entities/auth_response_entities.dart';
import '../../../../domain/entities/auth_entities/fotgot_pass_response_entity.dart';
import '../../../../domain/entities/auth_entities/reset_code_response_entity.dart';
import '../../../../domain/entities/auth_entities/reset_pass_response_entity.dart';
import '../../../../domain/repository/auth_repository/data_source/auth_remote_datasource_contract.dart';
import '../../../../domain/repository/auth_repository/repository/auth_repository_contract.dart';
import '../../../../helper/failuers/failures.dart';
import '../../../models/request/auth_request/forgot_pass_request.dart';
import '../../../models/request/auth_request/login_request.dart';
import '../../../models/request/auth_request/register_request.dart';
import '../../../models/request/auth_request/reset_pass_request.dart';
import '../../../models/request/auth_request/resset_code_request.dart';
import '../data_source/auth_data_source_imp.dart';

class AuthRepositoryImp extends AuthRepositoryContract {
  AuthRemoteDataSourceContract authDataSourceContract;
  AuthRepositoryImp(this.authDataSourceContract);
  @override
  Future<Either<Failure, AuthResponseEntity>> register(
      RegisterRequest registerRequest) async {
    return authDataSourceContract.register(registerRequest);
  }

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
      LoginRequest loginRequest) async {
    return authDataSourceContract.login(loginRequest);
  }

  @override
  Future<Either<Failure, ForgotPasswordResponseEntity>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    return authDataSourceContract.forgotPassword(forgotPasswordRequest);
  }

  @override
  Future<Either<Failure, ResetCodeResponseEntity>> resetCode(
      ResetCodeRequest resetCodeRequest) {
    return authDataSourceContract.resetCode(resetCodeRequest);
  }

  @override
  Future<Either<Failure, ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequest resetPasswordRequest) {
    return authDataSourceContract.resetPassword(resetPasswordRequest);
  }
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImp(injectAuthRemoteDataSource());
}
