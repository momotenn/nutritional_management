// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInViewModel {
  SignInStatus get signInStatus => throw _privateConstructorUsedError;
  Destination? get destination => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInViewModelCopyWith<SignInViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInViewModelCopyWith<$Res> {
  factory $SignInViewModelCopyWith(
          SignInViewModel value, $Res Function(SignInViewModel) then) =
      _$SignInViewModelCopyWithImpl<$Res, SignInViewModel>;
  @useResult
  $Res call({SignInStatus signInStatus, Destination? destination, String? uid});
}

/// @nodoc
class _$SignInViewModelCopyWithImpl<$Res, $Val extends SignInViewModel>
    implements $SignInViewModelCopyWith<$Res> {
  _$SignInViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signInStatus = null,
    Object? destination = freezed,
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as SignInStatus,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Destination?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInViewModelImplCopyWith<$Res>
    implements $SignInViewModelCopyWith<$Res> {
  factory _$$SignInViewModelImplCopyWith(_$SignInViewModelImpl value,
          $Res Function(_$SignInViewModelImpl) then) =
      __$$SignInViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SignInStatus signInStatus, Destination? destination, String? uid});
}

/// @nodoc
class __$$SignInViewModelImplCopyWithImpl<$Res>
    extends _$SignInViewModelCopyWithImpl<$Res, _$SignInViewModelImpl>
    implements _$$SignInViewModelImplCopyWith<$Res> {
  __$$SignInViewModelImplCopyWithImpl(
      _$SignInViewModelImpl _value, $Res Function(_$SignInViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signInStatus = null,
    Object? destination = freezed,
    Object? uid = freezed,
  }) {
    return _then(_$SignInViewModelImpl(
      signInStatus: null == signInStatus
          ? _value.signInStatus
          : signInStatus // ignore: cast_nullable_to_non_nullable
              as SignInStatus,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Destination?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SignInViewModelImpl
    with DiagnosticableTreeMixin
    implements _SignInViewModel {
  const _$SignInViewModelImpl(
      {required this.signInStatus,
      required this.destination,
      required this.uid});

  @override
  final SignInStatus signInStatus;
  @override
  final Destination? destination;
  @override
  final String? uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInViewModel(signInStatus: $signInStatus, destination: $destination, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInViewModel'))
      ..add(DiagnosticsProperty('signInStatus', signInStatus))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInViewModelImpl &&
            (identical(other.signInStatus, signInStatus) ||
                other.signInStatus == signInStatus) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signInStatus, destination, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInViewModelImplCopyWith<_$SignInViewModelImpl> get copyWith =>
      __$$SignInViewModelImplCopyWithImpl<_$SignInViewModelImpl>(
          this, _$identity);
}

abstract class _SignInViewModel implements SignInViewModel {
  const factory _SignInViewModel(
      {required final SignInStatus signInStatus,
      required final Destination? destination,
      required final String? uid}) = _$SignInViewModelImpl;

  @override
  SignInStatus get signInStatus;
  @override
  Destination? get destination;
  @override
  String? get uid;
  @override
  @JsonKey(ignore: true)
  _$$SignInViewModelImplCopyWith<_$SignInViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
