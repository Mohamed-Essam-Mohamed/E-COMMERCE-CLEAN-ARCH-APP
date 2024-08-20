import 'package:e_commerce/src/data/firebase/app_firebase.dart';
import 'package:e_commerce/src/data/model/firebase_model/app_user.dart';
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
      user = await AppFirebase.getUser(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YzI0MDg4ZWQwZGMwMDE2YzlkMGUyOCIsIm5hbWUiOiJNb2hhbWVkIEVzYW0iLCJyb2xlIjoidXNlciIsImlhdCI6MTcyNDAwNjUzNiwiZXhwIjoxNzMxNzgyNTM2fQ.LngDKpOzBs9xSboj2VAEPUI04nEHHI03aiwflyzBeXA");
      notifyListeners();
    }
  }
}
