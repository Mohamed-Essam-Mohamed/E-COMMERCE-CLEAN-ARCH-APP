import 'package:e_commerce/init_screen.dart';
import 'package:e_commerce/src/animation/shimmer_cart_screen.dart';
import 'package:e_commerce/src/feature/auth/contant_login/forget_password/view/forget_password_screen.dart';
import 'package:e_commerce/src/feature/auth/contant_login/login/view/login_screen.dart';
import 'package:e_commerce/src/feature/auth/contant_login/reset_code/view/resend_code_email_screen.dart';
import 'package:e_commerce/src/feature/auth/contant_login/reset_password/view/reset_password_screen.dart';
import 'package:e_commerce/src/feature/auth/register/view/register_screen.dart';
import 'package:e_commerce/src/feature/auth/widget/sign_success_screen.dart';
import 'package:e_commerce/src/feature/cart/view/cart_screen.dart';
import 'package:e_commerce/src/feature/home/view/home_screen.dart';
import 'package:e_commerce/src/feature/home/view/specific_product_screen.dart';
import 'package:e_commerce/src/feature/navigation_bar_screen/navigation_bar_screen.dart';
import 'package:e_commerce/src/feature/splash/splash_screen.dart';
import 'package:e_commerce/src/utils/app_theme.dart';
import 'package:flutter/material.dart';

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
        SplashScreen.routeName: (context) => const SplashScreen(),
        InitScreen.routeName: (context) => InitScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        SuccessScreen.routeName: (context) => const SuccessScreen(),
        NavigationBarScreen.routeName: (context) => NavigationBarScreen(),
        ForGetPasswordScreen.routeName: (context) => ForGetPasswordScreen(),
        ResendCodeEmailScreen.routeName: (context) =>
            const ResendCodeEmailScreen(),
        ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
        CartScreen.routeName: (context) => CartScreen(),
        SpecificProductScreen.routeName: (context) => SpecificProductScreen(),
      },
    );
  }
}
