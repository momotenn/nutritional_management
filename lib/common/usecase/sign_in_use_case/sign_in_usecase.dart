import 'package:nutritional_management/common/domain/infra_interface/user_remote_repository_interface.dart';
import 'package:nutritional_management/common/domain/model/user/user.dart';
import 'package:nutritional_management/common/domain/infra_interface/sign_in_gateway_interface.dart';

import 'package:nutritional_management/common/usecase/sign_in_use_case/sign_in_use_case_interface.dart';
import 'package:nutritional_management/common/usecase/sign_in_use_case/sign_in_use_case_model.dart';

class SignInUseCase implements SignInUseCaseInterface {
  final SignInGatewayInterface _signInGateway;
  final UserRemoteRepositoryInterface _userRemoteRepository;

  SignInUseCase(this._signInGateway, this._userRemoteRepository);

  @override
  Future<SignInUseCaseModel?> call() async {
    final a = await _signInGateway.signIn();
    final uid = a.user?.uid;

    final user = await _userRemoteRepository.readByGoogleUID(uid!);
    final result = SignInUseCaseModel(user: user, uid: uid);

    return result;
  }
}
