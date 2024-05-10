import 'src/feature/cart/view/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'init_screen.dart';
import 'src/feature/auth/contant_login/forget_password/view/forget_password_screen.dart';
import 'src/feature/auth/contant_login/login/view/login_screen.dart';
import 'src/feature/auth/contant_login/reset_code/view/reset_code_email_screen.dart';
import 'src/feature/auth/contant_login/reset_password/view/reset_password_screen.dart';
import 'src/feature/auth/register/view/register_screen.dart';
import 'src/feature/auth/widget/sign_success_screen.dart';
import 'src/feature/home/view/home_screen.dart';
import 'src/feature/navigation_bar_screen/navigation_bar_screen.dart';
import 'src/feature/splash/splash_screen.dart';
import 'src/utils/app_theme.dart';
import 'src/utils/shared_preference_utils.dart';
import 'src/widget/product_details_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.init();
  String route;
  var user = SharedPreferencesUtils.getData(key: 'Token');
  if (user == null) {
    route = LoginScreen.routeName;
  } else {
    route = NavigationBarScreen.routeName;
  }
  runApp(
    EcommerceRouteApp(
      routeName: route,
    ),
  );
}

class EcommerceRouteApp extends StatelessWidget {
  final String routeName;
  const EcommerceRouteApp({required this.routeName, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
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
            ResendCodeEmailScreen.routeName: (context) =>
                ResendCodeEmailScreen(),
            ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
            ProductDetailsView.routeName: (context) => ProductDetailsView(),
            CartScreen.routeName: (context) => CartScreen(),
          },
        );
      },
    );
  }
}
