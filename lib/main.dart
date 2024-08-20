import 'package:e_commerce/ecommerce_app.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/src/constant/box_hive_const.dart';
import 'package:e_commerce/src/domain/entities/product_entites/product_response_entity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/feature/navigation_bar_screen/navigation_bar_screen.dart';
import 'src/feature/splash/splash_screen.dart';
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
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    CommerceApp(routeName: route),
  );
}
