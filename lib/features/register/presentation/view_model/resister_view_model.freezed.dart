// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resister_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterViewModel {
  RegisterStatus get registerStatus => throw _privateConstructorUsedError;
  bool get isRegisterButtonEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterViewModelCopyWith<RegisterViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterViewModelCopyWith<$Res> {
  factory $RegisterViewModelCopyWith(
          RegisterViewModel value, $Res Function(RegisterViewModel) then) =
      _$RegisterViewModelCopyWithImpl<$Res, RegisterViewModel>;
  @useResult
  $Res call({RegisterStatus registerStatus, bool isRegisterButtonEnabled});
}

/// @nodoc
class _$RegisterViewModelCopyWithImpl<$Res, $Val extends RegisterViewModel>
    implements $RegisterViewModelCopyWith<$Res> {
  _$RegisterViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerStatus = null,
    Object? isRegisterButtonEnabled = null,
  }) {
    return _then(_value.copyWith(
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      isRegisterButtonEnabled: null == isRegisterButtonEnabled
          ? _value.isRegisterButtonEnabled
          : isRegisterButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterViewModelImplCopyWith<$Res>
    implements $RegisterViewModelCopyWith<$Res> {
  factory _$$RegisterViewModelImplCopyWith(_$RegisterViewModelImpl value,
          $Res Function(_$RegisterViewModelImpl) then) =
      __$$RegisterViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RegisterStatus registerStatus, bool isRegisterButtonEnabled});
}

/// @nodoc
class __$$RegisterViewModelImplCopyWithImpl<$Res>
    extends _$RegisterViewModelCopyWithImpl<$Res, _$RegisterViewModelImpl>
    implements _$$RegisterViewModelImplCopyWith<$Res> {
  __$$RegisterViewModelImplCopyWithImpl(_$RegisterViewModelImpl _value,
      $Res Function(_$RegisterViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerStatus = null,
    Object? isRegisterButtonEnabled = null,
  }) {
    return _then(_$RegisterViewModelImpl(
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as RegisterStatus,
      isRegisterButtonEnabled: null == isRegisterButtonEnabled
          ? _value.isRegisterButtonEnabled
          : isRegisterButtonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterViewModelImpl implements _RegisterViewModel {
  const _$RegisterViewModelImpl(
      {required this.registerStatus, required this.isRegisterButtonEnabled});

  @override
  final RegisterStatus registerStatus;
  @override
  final bool isRegisterButtonEnabled;

  @override
  String toString() {
    return 'RegisterViewModel(registerStatus: $registerStatus, isRegisterButtonEnabled: $isRegisterButtonEnabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterViewModelImpl &&
            (identical(other.registerStatus, registerStatus) ||
                other.registerStatus == registerStatus) &&
            (identical(
                    other.isRegisterButtonEnabled, isRegisterButtonEnabled) ||
                other.isRegisterButtonEnabled == isRegisterButtonEnabled));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, registerStatus, isRegisterButtonEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterViewModelImplCopyWith<_$RegisterViewModelImpl> get copyWith =>
      __$$RegisterViewModelImplCopyWithImpl<_$RegisterViewModelImpl>(
          this, _$identity);
}

abstract class _RegisterViewModel implements RegisterViewModel {
  const factory _RegisterViewModel(
      {required final RegisterStatus registerStatus,
      required final bool isRegisterButtonEnabled}) = _$RegisterViewModelImpl;

  @override
  RegisterStatus get registerStatus;
  @override
  bool get isRegisterButtonEnabled;
  @override
  @JsonKey(ignore: true)
  _$$RegisterViewModelImplCopyWith<_$RegisterViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
