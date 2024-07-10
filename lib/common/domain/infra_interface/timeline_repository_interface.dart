import 'package:nutritional_management/common/domain/model/post/post.dart';

abstract class TimeLineRepositoryInterface {
  Future<List<Post>> getAllPostsWithUserLikes(String currentUserId);
  Future<void> createLikePost(String postID, String userID);
  Future<void> deleteLikePost(String postID, String userID);
}
