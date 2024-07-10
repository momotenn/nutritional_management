import 'package:nutritional_management/common/infra/user_remote_repository.dart';
import 'package:nutritional_management/common/infra/sign_in_gateway.dart';
import 'package:nutritional_management/features/sign_in/presentation/view_model/sign_in_view_model.dart';
import 'package:nutritional_management/common/usecase/sign_in_use_case/sign_in_use_case_interface.dart';
import 'package:nutritional_management/common/usecase/sign_in_use_case/sign_in_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_presentation.g.dart';

final signInUseCaseProvider = Provider((ref) {
  final gateway = ref.read(signInGatewayProvider);
  final repository = ref.read(userRemoteRepositoryProvider);

  return SignInUseCase(gateway, repository);
});

final signInGatewayProvider = Provider((ref) => SignInGateway());
final userRemoteRepositoryProvider = Provider((ref) => UserRemoteRepository());

@riverpod
class SignInPresentation extends _$SignInPresentation {
  SignInUseCaseInterface? usecase;
  SignInPresentation();

  //NotifierProviderは何かしら一つの型の状態を持つ
  @override
  SignInViewModel build() {
    usecase = ref.read(signInUseCaseProvider);
    return const SignInViewModel(
        signInStatus: SignInStatus.initial, destination: null, uid: null);
  }

  void didTappedSignInButton() async {
    state = state.copyWith(signInStatus: SignInStatus.loading);
    usecase?.call().then(
      (model) {
        Destination? destination;
        if (model?.user == null) {
          destination = Destination.register;
        } else {
          destination = Destination.timeline;
        }
        state = state.copyWith(
            signInStatus: SignInStatus.success,
            destination: destination,
            uid: model?.uid);
      },
      onError: (err) {
        print(err);
        state = state.copyWith(signInStatus: SignInStatus.failure);
      },
    );
  }

  void didTappedRetryButton() async {
    state = state.copyWith(signInStatus: SignInStatus.initial);
  }
}
