import 'package:nutritional_management/features/sign_in/domain/sign_in_gateway_interface.dart';
import 'package:nutritional_management/features/sign_in/usecase/sign_in_use_case_interface.dart';

class SignInUseCase implements SignInUseCaseInterface {
  final SignInGatewayInterface _firebaseGateway;

  SignInUseCase(this._firebaseGateway);

  @override
  Future<bool> call() async {
    final result = await _firebaseGateway.signIn();
    return result;
  }
}
