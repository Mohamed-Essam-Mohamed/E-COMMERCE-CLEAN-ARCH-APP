import 'package:dartz/dartz.dart';
import '../../../../data/model/request/auth_request/login_request.dart';
import '../../../entities/auth_response_entities.dart';
import '../../../../helper/failuers/failures.dart';

import '../../../../data/model/request/auth_request/register_request.dart';

abstract class AuthRemoteDataSourceContract {
  Future<Either<Failure, AuthResponseEntity>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, AuthResponseEntity>> login(LoginRequest loginRequest);
}
