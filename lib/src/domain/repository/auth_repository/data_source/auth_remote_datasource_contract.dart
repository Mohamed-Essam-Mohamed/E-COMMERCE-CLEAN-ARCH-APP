import 'package:dartz/dartz.dart';

import '../../../../data/models/request/auth_request/forgot_pass_request.dart';
import '../../../../data/models/request/auth_request/login_request.dart';
import '../../../../data/models/request/auth_request/register_request.dart';
import '../../../../data/models/request/auth_request/reset_pass_request.dart';
import '../../../../data/models/request/auth_request/resset_code_request.dart';
import '../../../../helper/failuers/failures.dart';
import '../../../entities/auth_entities/auth_response_entities.dart';
import '../../../entities/auth_entities/fotgot_pass_response_entity.dart';
import '../../../entities/auth_entities/reset_code_response_entity.dart';
import '../../../entities/auth_entities/reset_pass_response_entity.dart';

abstract class AuthRemoteDataSourceContract {
  Future<Either<Failure, AuthResponseEntity>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, AuthResponseEntity>> login(LoginRequest loginRequest);

  Future<Either<Failure, ForgotPasswordResponseEntity>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest);

  Future<Either<Failure, ResetCodeResponseEntity>> resetCode(
      ResetCodeRequest resetCodeRequest);

  Future<Either<Failure, ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequest resetPasswordRequest);
}
