import 'package:flutter/material.dart';

// todo:汎用的に使えるようにする
class AlertDialogSample extends StatelessWidget {
  final Function didTappedRetryButtonClosure;

  const AlertDialogSample(
      {super.key, required this.didTappedRetryButtonClosure});

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
