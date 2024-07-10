import 'dart:ffi';

abstract class UserLocalRepositoryInterface {
  Future<void> saveUserInfo(String userID);
  Future<String?> getUserID();
}
