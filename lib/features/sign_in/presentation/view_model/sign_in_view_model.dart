import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutritional_management/features/sign_in/presentation/sign_in_presentation.dart';

part 'sign_in_view_model.freezed.dart';

enum SignInStatus { initial, loading, failure, success }

enum Destination { timeline, register }

@freezed
class SignInViewModel with _$SignInViewModel {
  const factory SignInViewModel({
    required SignInStatus signInStatus,
    required Destination? destination,
    required String? uid,
  }) = _SignInViewModel;
}
