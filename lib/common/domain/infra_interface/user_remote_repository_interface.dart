import 'package:nutritional_management/common/domain/model/user/user.dart';

abstract class UserRemoteRepositoryInterface {
  Future<String> create(String name, String? base64Data, String uid);
  Future<User?> readByGoogleUID(String uid);
}
