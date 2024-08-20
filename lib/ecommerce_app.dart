import 'package:e_commerce/main.dart';
import 'package:e_commerce/materail_tokoto_app.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/delete_item_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/get_all_logged_cart_usecase.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/update_count_cart_usecase.dart';
import 'package:e_commerce/src/feature/cart/view_model/cart_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommerceApp extends StatefulWidget {
  final String routeName;
  CommerceApp({required this.routeName, super.key});

  @override
  State<CommerceApp> createState() => _CommerceAppState();
}

class _CommerceAppState extends State<CommerceApp> {
  late CartViewModelCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = CartViewModelCubit(
      getAllLoggedCartUseCase: injectGetAllLoggedCartUseCase(),
      deleteItemCartUseCase: injectDeleteItemCartUseCase(),
      updateCuntCartUseCase: injectUpdateCuntCartUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
    );
    checkLocalDataProduct();
  }

  void checkLocalDataProduct() async {
    await cubit.initDataHiveApp();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider<CartViewModelCubit>(
          create: (context) => cubit,
          child: MaterialTokotoApp(routeName: widget.routeName),
        );
      },
    );
  }
}
