// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_use_case_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInUseCaseModel {
  User? get user => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInUseCaseModelCopyWith<SignInUseCaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInUseCaseModelCopyWith<$Res> {
  factory $SignInUseCaseModelCopyWith(
          SignInUseCaseModel value, $Res Function(SignInUseCaseModel) then) =
      _$SignInUseCaseModelCopyWithImpl<$Res, SignInUseCaseModel>;
  @useResult
  $Res call({User? user, String? uid});
}

/// @nodoc
class _$SignInUseCaseModelCopyWithImpl<$Res, $Val extends SignInUseCaseModel>
    implements $SignInUseCaseModelCopyWith<$Res> {
  _$SignInUseCaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInUseCaseModelImplCopyWith<$Res>
    implements $SignInUseCaseModelCopyWith<$Res> {
  factory _$$SignInUseCaseModelImplCopyWith(_$SignInUseCaseModelImpl value,
          $Res Function(_$SignInUseCaseModelImpl) then) =
      __$$SignInUseCaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, String? uid});
}

/// @nodoc
class __$$SignInUseCaseModelImplCopyWithImpl<$Res>
    extends _$SignInUseCaseModelCopyWithImpl<$Res, _$SignInUseCaseModelImpl>
    implements _$$SignInUseCaseModelImplCopyWith<$Res> {
  __$$SignInUseCaseModelImplCopyWithImpl(_$SignInUseCaseModelImpl _value,
      $Res Function(_$SignInUseCaseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? uid = freezed,
  }) {
    return _then(_$SignInUseCaseModelImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignInUseCaseModelImpl implements _SignInUseCaseModel {
  const _$SignInUseCaseModelImpl({required this.user, required this.uid});

  @override
  final User? user;
  @override
  final String? uid;

  @override
  String toString() {
    return 'SignInUseCaseModel(user: $user, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInUseCaseModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInUseCaseModelImplCopyWith<_$SignInUseCaseModelImpl> get copyWith =>
      __$$SignInUseCaseModelImplCopyWithImpl<_$SignInUseCaseModelImpl>(
          this, _$identity);
}

abstract class _SignInUseCaseModel implements SignInUseCaseModel {
  const factory _SignInUseCaseModel(
      {required final User? user,
      required final String? uid}) = _$SignInUseCaseModelImpl;

  @override
  User? get user;
  @override
  String? get uid;
  @override
  @JsonKey(ignore: true)
  _$$SignInUseCaseModelImplCopyWith<_$SignInUseCaseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
