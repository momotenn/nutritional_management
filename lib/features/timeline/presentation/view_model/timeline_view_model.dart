import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'timeline_view_model.freezed.dart';

//投稿一覧を取得するstate
enum FetchTimeLineStatus { initial, loading, failure, success }

//いいねの状態を更新するstate
enum UpdateLikeStatus { initial, loading, failure, success }

@freezed
class TimeLineViewModel with _$TimeLineViewModel {
  const factory TimeLineViewModel({
    required FetchTimeLineStatus fetchTimeLineStatus,
    required UpdateLikeStatus updateLikeStatus,
    required List<Post> posts,
  }) = _TimeLineViewModel;
}

class Post {
  final String id;
  final String userId;
  final String text;
  final String userName;
  final Image profileImage;
  final int likeCount;
  final Color likeButtonColor;
  final String createdAtText;

  Post(
    this.id,
    this.userId,
    this.text,
    this.userName,
    this.likeCount,
    this.likeButtonColor,
    this.createdAtText,
    this.profileImage,
  );
}
