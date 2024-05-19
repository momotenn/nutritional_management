import 'package:nutritional_management/common/infra/user_local_repository.dart';
import 'package:nutritional_management/common/infra/user_remote_repository.dart';
import 'package:nutritional_management/features/register/presentation/view_model/resister_view_model.dart';
import 'package:nutritional_management/common/usecase/register_use_case/register_use_case.dart';
import 'package:nutritional_management/common/usecase/register_use_case/register_use_case_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'register_presentation.g.dart';

final userRegisterUseCaseProvider = Provider((ref) {
  final repository = ref.read(userRemoteRepositoryProvider);
  final localRepository = ref.read(userLocalRepositoryProvider);
  return UserRegisterUseCase(localRepository, repository);
});

final userRemoteRepositoryProvider = Provider((ref) => UserRemoteRepository());
final userLocalRepositoryProvider = Provider((ref) => UserLocalRepository());

@riverpod
class RegisterPresentation extends _$RegisterPresentation {
  UserRegisterUseCaseInterface? usecase;
  RegisterPresentation();

  @override
  RegisterViewModel build() {
    usecase = ref.read(userRegisterUseCaseProvider);
    return const RegisterViewModel(
        registerStatus: RegisterStatus.initial, isRegisterButtonEnabled: false);
  }

  void didTappedRegisterButton(
      String name, List<int>? imageBytes, String uid) async {
    state = state.copyWith(
        registerStatus: RegisterStatus.loading, isRegisterButtonEnabled: false);
    usecase?.call(name, imageBytes, uid).then(
      (_) {
        state = state.copyWith(registerStatus: RegisterStatus.success);
      },
      onError: (err) {
        state = state.copyWith(
            registerStatus: RegisterStatus.failure,
            isRegisterButtonEnabled: true);
      },
    );
  }

  void didEditedNameTextField(String name) {
    final isEnabled = name.isNotEmpty;
    state = state.copyWith(isRegisterButtonEnabled: isEnabled);
  }
}
