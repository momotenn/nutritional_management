import 'package:freezed_annotation/freezed_annotation.dart';
part 'resister_view_model.freezed.dart';

enum RegisterStatus { initial, loading, failure, success }

@freezed
class RegisterViewModel with _$RegisterViewModel {
  const factory RegisterViewModel({
    required RegisterStatus registerStatus,
    required bool isRegisterButtonEnabled,
  }) = _RegisterViewModel;
}
