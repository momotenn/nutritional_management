import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるdartファイルを記述
part 'user.freezed.dart';

// freezedでコード生成するために「@freezed」を記述
@freezed
class User with _$User {
  // withの後には「_$[class name]」の形式で記述

  // プロパティを指定
  const factory User({
    required String uid,
    required String name,
    required String? base64DataImage,
  }) = _User;
}
