import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewModelCubit extends Cubit<CartStates> {
  // GetCartUseCase getCartUseCase ;
  // DeleteItemInCartUseCase deleteItemInCartUseCase ;
  // UpdateCountInCartUseCase updateCountInCartUseCase ;
  CartViewModelCubit() : super(GetCartInitialStates());
  // List<GetProductCartEntity> productList = [];

  // static CartViewModel get(context) => BlocProvider.of(context);

  // getCart() async {
  //   emit(GetCartLoadingStates(loadingMessage: 'Loading...'));
  //   var either = await getCartUseCase.invoke();
  //   either.fold((l) {
  //     emit(GetCartErrorStates(errors: l));
  //   }, (response) {
  //     productList = response.data?.products ?? [];
  //     emit(GetCartSuccessStates(getCartResponseEntity: response));
  //   });
  // }
  // deleteItemInCart(String productId) async {
  //   emit(DeleteItemInCartLoadingStates(loadingMessage: 'Loading...'));
  //   var either = await deleteItemInCartUseCase.invoke(productId);
  //   either.fold((l) {
  //     emit(DeleteItemInCartErrorStates(errors: l));
  //   }, (response) {
  //     print('deleted successfully');
  //     // productList = response.data?.products ?? [];
  //     emit(GetCartSuccessStates(getCartResponseEntity: response));
  //   });
  // }
  // updateCountInCart(String productId,int count) async {
  //   emit(UpdateCountInCartLoadingStates(loadingMessage: 'Loading...'));
  //   var either = await updateCountInCartUseCase.invoke(productId,count);
  //   either.fold((l) {
  //     emit(UpdateCountInCartErrorStates(errors: l));
  //   }, (response) {
  //     print('update successfully');
  //     // productList = response.data?.products ?? [];
  //     emit(GetCartSuccessStates(getCartResponseEntity: response));
  //   });
  // }
}
