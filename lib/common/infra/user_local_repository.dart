import 'dart:ffi';

import 'package:nutritional_management/common/domain/infra_interface/user_local_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalRepository implements UserLocalRepositoryInterface {
  @override
  Future<void> saveUserInfo(String userID) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('userID', userID);

      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<String?> getUserID() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final currentUserID = sharedPreferences.getString('userID');
    return currentUserID;
  }
}
