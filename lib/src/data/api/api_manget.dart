// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/model/request/auth_request/login_request.dart';
import 'package:e_commerce/src/data/model/response/auth_response_dto/login_response_dto.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';

import '../../constant/api_const.dart';
import '../model/request/auth_request/register_request.dart';
import '../model/response/auth_response_dto/regsiter_response_dto.dart';
import 'package:http/http.dart' as http;

class ApiManger {
  ApiManger._();
  static ApiManger? _instance;
  static ApiManger get instance {
    _instance ??= ApiManger._();
    return _instance!;
  }

  //! function register
  Future<Either<Failuer, RegisterResponseDto>> register(
      RegisterRequest registerRequest) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected inter net
      Uri url = Uri.https(apiBaseUrl, apiRegister);
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(registerResponse);
      } else if (response.statusCode == 400 &&
          registerResponse.errors != null) {
        //? have error in response such invalid number or email or password or rePassword
        return Left(Failuer(errorMessage: registerResponse.errors?.msg));
      } else {
        //? account already exists
        return Left(Failuer(
            errorMessage:
                registerResponse.message ?? "Account Already Exists"));
      }
    } else {
      return Left(Failuer(errorMessage: 'No Internet Connection'));
    }
  }

  //! function login
  Future<Either<Failuer, LoginResponseDto>> login(
      {required LoginRequest loginRequest}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected inter net
      Uri url = Uri.https(apiBaseUrl, apiLogin);
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(loginResponse);
      } else if (response.statusCode == 400 && loginResponse.errors != null) {
        //? have error in response such invalid   email or password
        return Left(Failuer(errorMessage: loginResponse.errors?.msg));
      } else {
        //? Incorrect email or password
        return Left(Failuer(errorMessage: loginResponse.message));
      }
    } else {
      return Left(Failuer(errorMessage: 'No Internet Connection'));
    }
  }
}
