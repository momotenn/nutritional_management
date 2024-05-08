import 'package:nutritional_management/features/sign_in/repository/sign_in_repository.dart';
import 'package:nutritional_management/features/sign_in/usecase/sign_in_use_case_interface.dart';
import 'package:nutritional_management/features/sign_in/usecase/sign_in_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'sign_in_presentation.g.dart';

enum SignInStatus { initial, loading, failure, success }

@riverpod
class SignInPresentation extends _$SignInPresentation {
  //NotifierProviderは何かしら一つの型の状態を持つ
  @override
  SignInStatus build() {
    return SignInStatus.initial;
  }

  void didTappedSignInButton() async {
    state = SignInStatus.loading;
    final usecase =
        SignInUseCase(SignInRepository()); // コンストラクタ（クラス名()）を呼ぶとインスタンスが作れる
    usecase.call().then(
      (result) {
        if (result) {
          state = SignInStatus.success;
        } else {
          state = SignInStatus.failure;
        }
      },
      onError: (err) {
        state = SignInStatus.failure;
      },
    );
  }

  void didTappedRetryButton() async {
    state = SignInStatus.initial;
  }
}
