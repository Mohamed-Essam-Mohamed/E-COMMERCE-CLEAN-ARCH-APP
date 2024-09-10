import 'package:e_commerce/src/data/firebase/app_firebase.dart';
import 'package:e_commerce/src/data/models/firebase_model/app_user.dart';
import 'package:e_commerce/src/utils/shared_preference_utils.dart';
import 'package:flutter/foundation.dart';

class SaveUserProvider extends ChangeNotifier {
  AppUser? user;
  String token = SharedPreferencesUtils.getData(key: 'Token') as String;

  SaveUserProvider() {
    initUser();
  }
  initUser() async {
    if (user == null) {
      user = await AppFirebase.getUser(token);
      notifyListeners();
    }
  }
}
