import 'dart:ffi';

abstract class UserLocalRepositoryInterface {
  Future<void> saveUserInfo(String userID);
}
