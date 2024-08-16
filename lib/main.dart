import 'package:e_commerce/src/constant/box_hive_const.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:e_commerce/src/domain/usecases/product_usecase/get_all_logged_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/animation/shimmer_cart_screen.dart';
import 'src/domain/usecases/product_usecase/add_to_cart_usecase.dart';
import 'src/domain/usecases/product_usecase/delete_item_cart_usecase.dart';
import 'src/domain/usecases/product_usecase/update_count_cart_usecase.dart';
import 'src/feature/cart/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'init_screen.dart';
import 'src/feature/auth/contant_login/forget_password/view/forget_password_screen.dart';
import 'src/feature/auth/contant_login/login/view/login_screen.dart';
import 'src/feature/auth/contant_login/reset_code/view/resend_code_email_screen.dart';
import 'src/feature/auth/contant_login/reset_password/view/reset_password_screen.dart';
import 'src/feature/auth/register/view/register_screen.dart';
import 'src/feature/auth/widget/sign_success_screen.dart';
import 'src/feature/cart/view_model/cart_view_model_cubit.dart';
import 'src/feature/home/view/home_screen.dart';
import 'src/feature/home/view/specific_product_screen.dart';
import 'src/feature/navigation_bar_screen/navigation_bar_screen.dart';
import 'src/feature/splash/splash_screen.dart';
import 'src/utils/app_theme.dart';
import 'src/utils/shared_preference_utils.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductDataEntityAdapter());
  await Hive.openBox<ProductDataEntity>(cartHive);
  await Hive.openBox<ProductDataEntity>(favoriteHive);
  String route;
  var user = SharedPreferencesUtils.getData(key: 'Token');
  if (user == null) {
    route = SplashScreen.routeName;
  } else {
    route = NavigationBarScreen.routeName;
  }
  runApp(
    EcommerceApp(
      routeName: route,
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  final String routeName;
  EcommerceApp({required this.routeName, super.key});
  CartViewModelCubit cubit = CartViewModelCubit(
    getAllLoggedCartUseCase: injectGetAllLoggedCartUseCase(),
    deleteItemCartUseCase: injectDeleteItemCartUseCase(),
    updateCuntCartUseCase: injectUpdateCuntCartUseCase(),
    addToCartUseCase: injectAddToCartUseCase(),
  );
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider<CartViewModelCubit>(
          create: (context) => cubit,
          child: MaterialTokotoApp(routeName: routeName),
        );
      },
    );
  }
}

class MaterialTokotoApp extends StatelessWidget {
  const MaterialTokotoApp({
    super.key,
    required this.routeName,
  });

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      initialRoute: routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        InitScreen.routeName: (context) => InitScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        SuccessScreen.routeName: (context) => SuccessScreen(),
        NavigationBarScreen.routeName: (context) => NavigationBarScreen(),
        ForGetPasswordScreen.routeName: (context) => ForGetPasswordScreen(),
        ResendCodeEmailScreen.routeName: (context) => ResendCodeEmailScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
        // ProductDetailsView.routeName: (context) => ProductDetailsView(),
        CartScreen.routeName: (context) => CartScreen(),
        ShimmmerCartScreen.routeName: (context) => ShimmmerCartScreen(),
        SpecificProductScreen.routeName: (context) => SpecificProductScreen(),
      },
    );
  }
}
