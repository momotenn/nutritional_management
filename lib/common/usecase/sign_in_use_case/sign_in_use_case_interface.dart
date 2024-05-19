import 'package:nutritional_management/common/domain/model/user/user.dart';
import 'package:nutritional_management/common/usecase/sign_in_use_case/sign_in_use_case_model.dart';

abstract class SignInUseCaseInterface {
  Future<SignInUseCaseModel?> call();
}
