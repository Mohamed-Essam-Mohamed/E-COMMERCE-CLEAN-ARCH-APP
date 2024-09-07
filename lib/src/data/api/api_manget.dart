// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/src/data/models/response/add_cart_response_dto/addcart_response_dto.dart';
import 'package:e_commerce/src/data/models/response/add_cart_response_dto/get_logged_cart_response_dto.dart';
import 'package:e_commerce/src/data/models/response/categoryorbrand_response_dto/categoriesorbrand_response_dto.dart';
import 'package:e_commerce/src/data/models/response/product_response_dto/product_response_dto.dart';
import 'package:e_commerce/src/data/models/response/product_response_dto/product_specific_dto.dart';
import 'package:e_commerce/src/helper/failuers/failures.dart';
import 'package:e_commerce/src/utils/shared_preference_utils.dart';
import 'package:http/http.dart' as http;

import '../../constant/api_const.dart';

class ApiManger {
  ApiManger._();
  static ApiManger? _instance;
  static ApiManger get instance {
    _instance ??= ApiManger._();
    return _instance!;
  }

  //? function getAllCategories
  Future<Either<Failure, CategoryOrBrandResponseDto>> getAllCategory() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected internet
      Uri url = Uri.https(apiBaseUrl, apiGetAllCategory);
      var response = await http.get(url);

      var getAllCategoryResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(getAllCategoryResponse);
      } else {
        //? Incorrect
        return Left(Failure(errorMessage: 'Error in response'));
      }
    } else {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  //? function getAllProducts
  Future<Either<Failure, ProductResponseDto>> getAllProduct() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected internet
      Uri url = Uri.https(apiBaseUrl, apiGetAllProducts);
      var response = await http.get(
        url,
      );

      var getAllProductResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(getAllProductResponse);
      } else {
        //? Incorrect
        return Left(Failure(errorMessage: 'Error in response'));
      }
    } else {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  //? fucntion getSpecificProduct
  Future<Either<Failure, ProductResponseDto>> getSpecificProduct(
      {required String specificProductId}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected internet
      Uri url = Uri.https(
        apiBaseUrl,
        apiGetAllProducts,
        {
          "category": specificProductId,
        },
      );
      var response = await http.get(
        url,
      );

      var getAllProductResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(getAllProductResponse);
      } else {
        //? Incorrect
        return Left(Failure(errorMessage: 'Error in response'));
      }
    } else {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  //? function get product item details
  Future<Either<Failure, ProuductSpecificDataDto>> getProductItemDetails(
      {required String productId}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.parse(
          "https://ecommerce.routemisr.com/api/v1/products/$productId");
      var response = await http.get(url);

      var getDataProduct =
          ProuductSpecificDataDto.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        //? success get data
        return Right(getDataProduct);
      } else {
        //? Incorrect
        return Left(Failure(errorMessage: 'Error in response'));
      }
    } else {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  //? function getBrand
  Future<Either<Failure, CategoryOrBrandResponseDto>> getAllBrands() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected internet
      Uri url = Uri.https(apiBaseUrl, apiGetAllBrands);
      var response = await http.get(url);

      var getAllBrandResponse =
          CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(getAllBrandResponse);
      } else {
        //? Incorrect
        return Left(Failure(errorMessage: 'Error in response'));
      }
    } else {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  //? get Token
  var token = SharedPreferencesUtils.getData(key: 'Token').toString();
  //? function add to cart
  Future<Either<Failure, AddToCartResponseDto>> addToCart(
      {required String productId}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected internet
      Uri url = Uri.https(apiBaseUrl, apiAddToCart);
      var response = await http.post(url, headers: {
        "token": token,
      }, body: {
        "productId": productId,
      });

      var addToCartResponse =
          AddToCartResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(Failure(errorMessage: addToCartResponse.message));
      } else {
        //? Incorrect
        return Left(Failure(errorMessage: addToCartResponse.message));
      }
    } else {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  //? function get  all cart

  Future<Either<Failure, GetLoggedCartResponseDto>> getAllCart() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected internet
      Uri url = Uri.https(apiBaseUrl, apiGetAllCart);
      var response = await http.get(url, headers: {
        "token": token.toString(),
      });

      var getAllCartResponse =
          GetLoggedCartResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(getAllCartResponse);
      } else {
        //? Incorrect
        return Left(Failure(errorMessage: getAllCartResponse.message));
      }
    } else {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  //? function delete cart
  Future<Either<Failure, GetLoggedCartResponseDto>> deleteItemCart(
      {required String cartId}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected internet
      Uri url = Uri.https(apiBaseUrl, "$apiGetAllCart/$cartId");
      var response = await http.delete(url, headers: {
        "token": token.toString(),
      });
      var deleteItemCartResponse =
          GetLoggedCartResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(deleteItemCartResponse);
      } else {
        //? Incorrect
        return Left(Failure(errorMessage: deleteItemCartResponse.message));
      }
    } else {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }

  //? function update counte cart
  Future<Either<Failure, GetLoggedCartResponseDto>> updateCountInCart(
      {required String cartId, required String count}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //? connected internet
      Uri url = Uri.https(apiBaseUrl, "$apiGetAllCart/$cartId");
      var response = await http.put(url, headers: {
        "token": token.toString(),
      }, body: {
        "count": count,
      });
      var updateCountCartResponse =
          GetLoggedCartResponseDto.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        //? success get data
        return Right(updateCountCartResponse);
      } else {
        //? Incorrect
        return Left(Failure(errorMessage: updateCountCartResponse.message));
      }
    } else {
      return Left(Failure(errorMessage: 'No Internet Connection'));
    }
  }
}
