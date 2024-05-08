import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutritional_management/features/sign_in/presentation/sign_in_presentation.dart';

class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // build メソッド内でフックを使用できます。

    final signInPresentation =
        ref.watch(signInPresentationProvider); // ここで一度だけプロバイダを読み取る

    return Center(
      child: buildButtonWidget(signInPresentation, context, ref),
      widthFactor: 100,
      heightFactor: 600,
    );
  }

  Widget buildButtonWidget(
      SignInStatus signInStatus, BuildContext context, WidgetRef ref) {
    switch (signInStatus) {
      case SignInStatus.initial:
        return Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                ref
                    .read(signInPresentationProvider.notifier)
                    .didTappedSignInButton();
              },
              child: Text("ログイン"),
            ),
          ),
        );
      case SignInStatus.loading:
        return const CircularProgressIndicator();
      case SignInStatus.success:
        return const Text("ログインに成功、もう直ぐ遷移します。");
      case SignInStatus.failure:
        SchedulerBinding.instance.addPostFrameCallback((_) {
          showDialog<void>(
              context: context,
              builder: (_) {
                return AlertDialogSample(
                  didTappedRetryButtonClosure: () {
                    ref
                        .read(signInPresentationProvider.notifier)
                        .didTappedRetryButton();
                  },
                );
              });
        });

        return Container();
    }
  }
}

class AlertDialogSample extends StatelessWidget {
  Function didTappedRetryButtonClosure;

  AlertDialogSample({super.key, required this.didTappedRetryButtonClosure});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('サインインに失敗しました'),
      content: const Text('もう一度やり直してください'),
      actions: <Widget>[
        GestureDetector(
          child: const Text('戻る'),
          onTap: () {
            didTappedRetryButtonClosure();
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
