import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutritional_management/common/infra/timeline_repository.dart';
import 'package:nutritional_management/common/infra/user_local_repository.dart';
import 'package:nutritional_management/common/usecase/timeline_use_case/fetch_timeline_use_case/fetch_timelein_use_case_interface.dart';
import 'package:nutritional_management/common/usecase/timeline_use_case/fetch_timeline_use_case/fetch_timeline_use_case.dart';
import 'package:nutritional_management/common/usecase/timeline_use_case/like_post_use_case/like_post_use_case.dart';
import 'package:nutritional_management/common/usecase/timeline_use_case/like_post_use_case/like_post_use_case_interface.dart';
import 'package:nutritional_management/common/usecase/timeline_use_case/un_like_post_use_case/unlike_post_use_case.dart';
import 'package:nutritional_management/common/usecase/timeline_use_case/un_like_post_use_case/unlike_post_use_case_interface.dart';
import 'package:nutritional_management/features/timeline/presentation/view_model/timeline_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'timeline_presentation.g.dart';

final fetchTimeLineUseCaseProvider = Provider((ref) {
  final repository = ref.read(timeLineRepositoryProvider);
  final localRepository = ref.read(userLocalRepositoryProvider);
  return FetchTimeLineUseCase(repository, localRepository);
});

final likePostUseCaseProvider = Provider((ref) {
  final repository = ref.read(timeLineRepositoryProvider);
  final localRepository = ref.read(userLocalRepositoryProvider);
  return LikePostUseCase(repository, localRepository);
});

final unLikePostUseCaseProvider = Provider((ref) {
  final repository = ref.read(timeLineRepositoryProvider);
  final localRepository = ref.read(userLocalRepositoryProvider);
  return UnLikePostUseCase(repository, localRepository);
});

final timeLineRepositoryProvider = Provider((ref) => TimeLineRepository());
final userLocalRepositoryProvider = Provider((ref) => UserLocalRepository());

@riverpod
class TimeLinePresentation extends _$TimeLinePresentation {
  FetchTimeLineUseCaseInterface? fetchTimeLineUseCase;
  LikePostUseCaseInterface? likePostUseCase;
  UnLikePostUseCaseInterface? unLikePostUseCase;

  TimeLinePresentation();

  @override
  TimeLineViewModel build() {
    fetchTimeLineUseCase = ref.read(fetchTimeLineUseCaseProvider);
    likePostUseCase = ref.read(likePostUseCaseProvider);
    unLikePostUseCase = ref.read(unLikePostUseCaseProvider);

    return const TimeLineViewModel(
        fetchTimeLineStatus: FetchTimeLineStatus.initial,
        updateLikeStatus: UpdateLikeStatus.initial,
        posts: []);
  }

//タイムラインに載せる投稿一覧を表示
//loading時はcircularprogresIndicatorを出す（UIで実施）
  Future<void> didPresentedTimeLine() async {
    state = state.copyWith(fetchTimeLineStatus: FetchTimeLineStatus.loading);
    await await Future.delayed(Duration(seconds: 1));
    //success時、タイムラインを表示
    //failure時、エラーを表示

    fetchTimeLineUseCase?.call().then(
      (posts) {
        state =
            state.copyWith(fetchTimeLineStatus: FetchTimeLineStatus.success);
        final convertedPosts = posts.map((element) {
          try {
            final color = element.hasUserLiked ? Colors.red : Colors.grey;
            final date =
                DateFormat("yyyy/MM/dd").format(element.createdAt).toString();
            final post = Post(
                element.id,
                element.userId,
                element.text,
                element.userName,
                element.likeCount,
                color,
                date,
                Image.memory(base64Decode(element.userProfileData)));

            return post;
          } catch (e) {
            print(e);
            throw e;
          }
        });
        state = state.copyWith(posts: convertedPosts.toList());
      },
      onError: (err) {
        state =
            state.copyWith(fetchTimeLineStatus: FetchTimeLineStatus.failure);
      },
    );
  }

//いいねを押したら状態を変更する　引数に該当ポストのインデックス番号を渡す
  Future<void> didTappedLikeButton(int postIndex) async {
    print("hoge");
//loading時、circularprogresIndicatorを出す（UIで実施）
    state = state.copyWith(updateLikeStatus: UpdateLikeStatus.loading);

//success時、hasUserLikedがtrue(いいねした) => like_count:-1 , 色：あり=>なし
//   〃　　　 hasUserLikedがfalse(いいねしていない) => like_count:+1 , 色：なし=>あり
//failure時、エラーを表示

    final post = state.posts[postIndex];

    if (state.posts[postIndex].likeButtonColor == Colors.red) {
      unLikePostUseCase?.call(post.id).then((_) {
        // いいねの状態を更新
        state = state.copyWith(updateLikeStatus: UpdateLikeStatus.success);

        // いいねの数を更新
        final updatedPostCount = post.likeCount - 1;

        // 更新されたポストを作成
        final updatedPost = Post(
          post.id,
          post.userId,
          post.text,
          post.userName,
          updatedPostCount,
          // いいねボタンの色を更新
          Colors.grey, // ここを変更する必要があるかもしれません
          post.createdAtText,
          post.profileImage,
        );

        // ポストのリストをコピー
        final posts = List<Post>.from(state.posts);
        // 更新されたポストをリストに置き換え
        posts[postIndex] = updatedPost;

        // 状態を更新
        state = state.copyWith(posts: posts);
      });
    } else {
      likePostUseCase?.call(post.id).then(
        (_) {
          state = state.copyWith(updateLikeStatus: UpdateLikeStatus.success);

          final updatedPostCount = post.likeCount + 1;

          final updatedPost = Post(
              post.id,
              post.userId,
              post.text,
              post.userName,
              updatedPostCount,
              Colors.red,
              post.createdAtText,
              post.profileImage);

          final posts = state.posts;
          posts[postIndex] = updatedPost;

          state = state.copyWith(updateLikeStatus: UpdateLikeStatus.success);
        },
        onError: (err) {
          state = state.copyWith(updateLikeStatus: UpdateLikeStatus.failure);
        },
      );
    }
  }
}
