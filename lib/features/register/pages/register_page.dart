import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nutritional_management/features/register/presentation/register_presentation.dart';
import 'package:nutritional_management/features/register/presentation/view_model/resister_view_model.dart';
import 'package:nutritional_management/features/timeline/pages/timeline_page.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key, required this.uid});
  final String uid; // サインイン画面からもらうもの
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 意味を変換しなければいけない状態管理→Presentation(変換作業(ロジック)があるのでPresentation)
    // そのままの意味で使えるもの→Hooks(UI)
    final name = useState('');
    final image = useState<List<int>?>(null);

    final imagePicker = ImagePicker();

    Future getImageFromGarally() async {
      final pickedFile =
          await imagePicker.pickImage(source: ImageSource.gallery);
      image.value = await pickedFile?.readAsBytes();
    }

    final registerPresentation =
        ref.watch(registerPresentationProvider); // ここで一度だけプロバイダを読み取る

    if (registerPresentation.registerStatus == RegisterStatus.success) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return const TimeLinePage();
        }));
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("新規登録"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('名前'),
              SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) {
                    name.value = value;
                    ref
                        .read(registerPresentationProvider.notifier)
                        .didEditedNameTextField(value);
                    //インスタンス変数.メソッド（）
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('画像'),
              ElevatedButton(
                onPressed: getImageFromGarally,
                child: const Text('画像を選ぶ'),
              )
            ],
          ),
          ElevatedButton(
              onPressed: registerPresentation.isRegisterButtonEnabled
                  ? () {
                      ref
                          .read(registerPresentationProvider.notifier)
                          .didTappedRegisterButton(
                              name.value, image.value, uid);
                    }
                  : null,
              child: const Text('登録')),
        ],
      ),
    );
  }
}
