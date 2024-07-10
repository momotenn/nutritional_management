abstract class UserRegisterUseCaseInterface {
  Future<void> call(String name, List<int>? imageBytes, String uid);
}
