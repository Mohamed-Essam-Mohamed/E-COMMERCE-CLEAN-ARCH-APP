import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/domain/entities/favorite_entities/get_all_favorite_response_enitiy.dart';
import 'package:e_commerce/src/domain/entities/home_entites/categoryorbrand_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/favorite_usecase/addtofavorite_usecase.dart';
import 'package:e_commerce/src/domain/usecases/favorite_usecase/getallfavorite_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_brand_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_all_catergories_usecase.dart';
import 'package:e_commerce/src/domain/usecases/home_usecase/get_specific_product.dart';
import '../../../domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entites/product_response_entity.dart';
import '../../../domain/usecases/product_usecase/all_product_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'product_view_model_state.dart';

class ProductViewModelCubit extends Cubit<ProductViewModelState> {
  GetAllCategoriesUseCases getAllCategoriesUseCases;
  GetAllBrandUseCase getAllBrandsUseCases;
  AllProductUseCase allProductUseCases;
  AddToCartUseCase addToCartUseCase;
  AddFavoriteUseCase addFavoriteUseCase;
  GetProductSpecificUseCase getProductSpecificUseCase;
  GetAllFavoriteUseCase getAllFavoriteUseCase;

  bool checkAddProductOrNot = true;

  ProductViewModelCubit({
    required this.allProductUseCases,
    required this.addToCartUseCase,
    required this.addFavoriteUseCase,
    required this.getAllCategoriesUseCases,
    required this.getAllBrandsUseCases,
    required this.getProductSpecificUseCase,
    required this.getAllFavoriteUseCase,
  }) : super(
          ProductViewModelInitial(),
        );

  static ProductViewModelCubit getBloc(context) =>
      BlocProvider.of<ProductViewModelCubit>(context);

  //? Get All Product
  List<ProductDataEntity> allProductList = [];
  Future<void> getAllProduct() async {
    emit(GetAllProductViewModelLoading());
    var either = await allProductUseCases.invoke();
    either.fold(
      (l) {
        emit(GetAllProductViewModelError(errorMessage: l.errorMessage));
      },
      (r) {
        allProductList = r.data ?? [];
        emit(GetAllProductViewModelSuccess());
      },
    );
  }

  //? Add To Cart
  Future<void> addToCart({required String productId}) async {
    emit(AddToCartViewModelLoading());
    var either = await addToCartUseCase.invoke(productId: productId);
    either.fold((l) {
      emit(AddToCartViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(AddToCartViewModelSuccess());
    });
  }

  //? Add to Favorite
  Future<void> addToFavorite({required String productId}) async {
    emit(AddToFavoriteViewModelLoading());
    var either = await addFavoriteUseCase.invoke(productId: productId);
    either.fold((l) {
      emit(AddToFavoriteViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      emit(AddToFavoriteViewModelSuccess());
    });
  }

  //? get All Favorite
  List<FavoriteDataEntity> allFavoriteList = [];
  Future<void> getAllFavorite() async {
    emit(GetAllFavoriteViewModelLoading());
    var either = await getAllFavoriteUseCase.invoke();
    either.fold((l) {
      emit(GetAllFavoriteViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      allFavoriteList = r.data ?? [];
      emit(GetAllFavoriteViewModelSuccess());
      emit(ProductViewModelInitial());
    });
  }

  //? Search
  List<ProductDataEntity> searchProductList = [];
  TextEditingController searchController = TextEditingController();
  void searchTextInList(String text) {
    searchProductList = allProductList.where((product) {
      return product.title!.toLowerCase().contains(text.toLowerCase());
    }).toList();
    emit(SearchTextInListViewModelSuccess());
  }

  //? Get All Category
  List<CategoryOrBrandDataEntity> allCategoryList = [];
  Future<void> getAllCategory() async {
    emit(GetAllCategoryViewModelLoading());
    var either = await getAllCategoriesUseCases.invoke();
    return either.fold((l) {
      emit(GetAllCategoryViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      allCategoryList = r.data ?? [];
      emit(GetAllCategoryViewModelSuccess());
    });
  }

  //? Get All Brand
  List<CategoryOrBrandDataEntity> allBrandList = [];
  Future<void> getAllBrand() async {
    emit(GetAllBrandViewModelLoading());
    var either = await getAllBrandsUseCases.invoke();
    return either.fold((l) {
      emit(GetAllBrandViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      allBrandList = r.data ?? [];
      emit(GetAllBrandViewModelSuccess(listBrandData: allBrandList));
    });
  }

  //? Get Specific Product
  Future<void> getSpecificProduct({required String productId}) async {
    emit(GetSpecificProductViewModelLoading());
    var either =
        await getProductSpecificUseCase.invoke(specificProductId: productId);
    return either.fold((l) {
      emit(GetSpecificProductViewModelError(errorMessage: l.errorMessage));
    }, (r) {
      allProductList = r.data ?? [];
      emit(GetSpecificProductViewModelSuccess());
    });
  }
}
