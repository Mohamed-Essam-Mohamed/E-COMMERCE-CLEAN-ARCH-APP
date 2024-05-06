import 'package:e_commerce/src/constant/string_const_app.dart';
import 'package:e_commerce/src/domain/entities/product_entites/add_to_cart/get_logged_cart_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/delete_item_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/get_all_logged_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/update_count_cart_usecase.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewModelCubit extends Cubit<CartStates> {
  GetAllLoggedCartUseCase getAllLoggedCartUseCase;
  DeleteItemCartUseCase deleteItemCartUseCase;
  UpdateCuntCartUsecase updateCuntCartUsecase;
  List<ProductsCartsEntity> productCartList = [];
  bool _isClosed = false;
  CartViewModelCubit({
    required this.getAllLoggedCartUseCase,
    required this.deleteItemCartUseCase,
    required this.updateCuntCartUsecase,
  }) : super(GetCartInitialStates());
  @override
  Future<void> close() async {
    _isClosed = true;
    await super.close();
  }

  static CartViewModelCubit get(cotext) =>
      BlocProvider.of<CartViewModelCubit>(cotext);
  getAllCart() async {
    emit(GetCartLoadingStates(loadingMessage: loading));
    var either = await getAllLoggedCartUseCase.invoke();
    either.fold((l) {
      emit(GetCartErrorStates(errors: l.errorMessage));
    }, (r) {
      emit(GetCartLoadingStates(loadingMessage: loading));
      productCartList = r.data?.products ?? [];
      emit(GetCartSuccessStates(dataCartEntity: r.data!));
    });
  }

  deleteItemCart({required String cartId}) async {
    emit(GetCartLoadingStates(loadingMessage: loading));
    var either = await deleteItemCartUseCase.invoke(carttId: cartId);
    either.fold((l) {
      emit(GetCartErrorStates(errors: l.errorMessage));
    }, (r) {
      emit(GetCartLoadingStates(loadingMessage: loading));
      print("Deleted successfully");
      emit(GetCartSuccessStates(dataCartEntity: r.data!));
    });
  }

  upadateCountCartItme({required String cartId, required String count}) async {
    emit(UpdateCountInCartLoadingStates(loadingMessage: loading));
    var either =
        await updateCuntCartUsecase.invoke(cartId: cartId, count: count);
    either.fold((l) {
      emit(UpdateCountInCartErrorStates(errors: l.errorMessage));
    }, (r) {
      emit(GetCartLoadingStates(loadingMessage: loading));
      print("Update successfully");
      emit(GetCartSuccessStates(dataCartEntity: r.data!));
    });
  }
}
