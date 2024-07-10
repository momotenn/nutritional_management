// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimeLineViewModel {
  FetchTimeLineStatus get fetchTimeLineStatus =>
      throw _privateConstructorUsedError;
  UpdateLikeStatus get updateLikeStatus => throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeLineViewModelCopyWith<TimeLineViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeLineViewModelCopyWith<$Res> {
  factory $TimeLineViewModelCopyWith(
          TimeLineViewModel value, $Res Function(TimeLineViewModel) then) =
      _$TimeLineViewModelCopyWithImpl<$Res, TimeLineViewModel>;
  @useResult
  $Res call(
      {FetchTimeLineStatus fetchTimeLineStatus,
      UpdateLikeStatus updateLikeStatus,
      List<Post> posts});
}

/// @nodoc
class _$TimeLineViewModelCopyWithImpl<$Res, $Val extends TimeLineViewModel>
    implements $TimeLineViewModelCopyWith<$Res> {
  _$TimeLineViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchTimeLineStatus = null,
    Object? updateLikeStatus = null,
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      fetchTimeLineStatus: null == fetchTimeLineStatus
          ? _value.fetchTimeLineStatus
          : fetchTimeLineStatus // ignore: cast_nullable_to_non_nullable
              as FetchTimeLineStatus,
      updateLikeStatus: null == updateLikeStatus
          ? _value.updateLikeStatus
          : updateLikeStatus // ignore: cast_nullable_to_non_nullable
              as UpdateLikeStatus,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeLineViewModelImplCopyWith<$Res>
    implements $TimeLineViewModelCopyWith<$Res> {
  factory _$$TimeLineViewModelImplCopyWith(_$TimeLineViewModelImpl value,
          $Res Function(_$TimeLineViewModelImpl) then) =
      __$$TimeLineViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FetchTimeLineStatus fetchTimeLineStatus,
      UpdateLikeStatus updateLikeStatus,
      List<Post> posts});
}

/// @nodoc
class __$$TimeLineViewModelImplCopyWithImpl<$Res>
    extends _$TimeLineViewModelCopyWithImpl<$Res, _$TimeLineViewModelImpl>
    implements _$$TimeLineViewModelImplCopyWith<$Res> {
  __$$TimeLineViewModelImplCopyWithImpl(_$TimeLineViewModelImpl _value,
      $Res Function(_$TimeLineViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fetchTimeLineStatus = null,
    Object? updateLikeStatus = null,
    Object? posts = null,
  }) {
    return _then(_$TimeLineViewModelImpl(
      fetchTimeLineStatus: null == fetchTimeLineStatus
          ? _value.fetchTimeLineStatus
          : fetchTimeLineStatus // ignore: cast_nullable_to_non_nullable
              as FetchTimeLineStatus,
      updateLikeStatus: null == updateLikeStatus
          ? _value.updateLikeStatus
          : updateLikeStatus // ignore: cast_nullable_to_non_nullable
              as UpdateLikeStatus,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$TimeLineViewModelImpl implements _TimeLineViewModel {
  const _$TimeLineViewModelImpl(
      {required this.fetchTimeLineStatus,
      required this.updateLikeStatus,
      required final List<Post> posts})
      : _posts = posts;

  @override
  final FetchTimeLineStatus fetchTimeLineStatus;
  @override
  final UpdateLikeStatus updateLikeStatus;
  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'TimeLineViewModel(fetchTimeLineStatus: $fetchTimeLineStatus, updateLikeStatus: $updateLikeStatus, posts: $posts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeLineViewModelImpl &&
            (identical(other.fetchTimeLineStatus, fetchTimeLineStatus) ||
                other.fetchTimeLineStatus == fetchTimeLineStatus) &&
            (identical(other.updateLikeStatus, updateLikeStatus) ||
                other.updateLikeStatus == updateLikeStatus) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fetchTimeLineStatus,
      updateLikeStatus, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeLineViewModelImplCopyWith<_$TimeLineViewModelImpl> get copyWith =>
      __$$TimeLineViewModelImplCopyWithImpl<_$TimeLineViewModelImpl>(
          this, _$identity);
}

abstract class _TimeLineViewModel implements TimeLineViewModel {
  const factory _TimeLineViewModel(
      {required final FetchTimeLineStatus fetchTimeLineStatus,
      required final UpdateLikeStatus updateLikeStatus,
      required final List<Post> posts}) = _$TimeLineViewModelImpl;

  @override
  FetchTimeLineStatus get fetchTimeLineStatus;
  @override
  UpdateLikeStatus get updateLikeStatus;
  @override
  List<Post> get posts;
  @override
  @JsonKey(ignore: true)
  _$$TimeLineViewModelImplCopyWith<_$TimeLineViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
