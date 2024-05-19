import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutritional_management/common/domain/model/user/user.dart';
part 'sign_in_use_case_model.freezed.dart';

@freezed
class SignInUseCaseModel with _$SignInUseCaseModel {
  const factory SignInUseCaseModel({
    required User? user,
    required String? uid,
  }) = _SignInUseCaseModel;
}
