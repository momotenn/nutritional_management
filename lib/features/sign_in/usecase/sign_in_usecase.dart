import 'package:nutritional_management/features/sign_in/domain/sign_in_repository_interface.dart';
import 'package:nutritional_management/features/sign_in/usecase/sign_in_use_case_interface.dart';

class SignInUseCase implements SignInUseCaseInterface {
  final SignInRepositoryInterface _firebaseRepository;

  SignInUseCase(this._firebaseRepository);

  @override
  Future<bool> call() async {
    final result = await _firebaseRepository.signIn();
    print(result.toString());
    return result;
  }
}
