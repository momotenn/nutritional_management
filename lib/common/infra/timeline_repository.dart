import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutritional_management/common/domain/infra_interface/timeline_repository_interface.dart';
import 'package:nutritional_management/common/domain/model/post/post.dart';

class TimeLineRepository implements TimeLineRepositoryInterface {
  @override
  Future<List<Post>> getAllPostsWithUserLikes(String currentUserId) async {
    try {
      final postsRef = FirebaseFirestore.instance.collection('posts');
      final querySnapshot = await postsRef.get();
      final postDocs = querySnapshot.docs;
      final posts = List<Post>.empty(growable: true);
      for (final postDoc in postDocs) {
        final userLikeRef = FirebaseFirestore.instance
            .collection('user_like_post')
            .where('user_id', isEqualTo: currentUserId)
            .where('post_id', isEqualTo: postDoc.id)
            .limit(1);
        final postDocData = postDoc.data();
        final userLikeDoc = await userLikeRef.get();
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(postDoc['userId'])
            .get();
        final userDocData = userDoc.data()!;
        final hasUserLiked = userLikeDoc.docs.isNotEmpty;
        final post = Post(
            id: postDoc.id,
            userName: userDocData['name'],
            userId: postDocData['userId'],
            text: postDocData['text'],
            userProfileData: userDocData['base64ImageData'],
            likeCount: postDocData['likeCount'],
            hasUserLiked: hasUserLiked,
            createdAt: postDocData['createdAt'].toDate());
        posts.add(post);
      }
      return posts;
    } catch (e) {
      print(e);
      throw e;
    }
  }

// 該当ポストのlike_countをインクリメント(+1)
// user_like_postsにデータを入れる
  @override
  Future<void> createLikePost(String postID, String userID) async {
    try {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        final postsRef = FirebaseFirestore.instance.collection('posts');

        final postDocRef = postsRef.doc(postID);

        final postDocSnapshot = await transaction.get(postDocRef);

        final postData = postDocSnapshot.data();

        final updatedLikeCount = postData?['like_count'] + 1;

        transaction.update(postDocRef, {'like_count': updatedLikeCount});

        final userLikePostRef =
            FirebaseFirestore.instance.collection("user_like_posts");
        transaction.set(userLikePostRef.doc(postID),
            {'post_id': postID, "user_id": userID});
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

// 該当ポストのlike_countをデクリメント(+1)
// user_like_postsからデータを削除
  @override
  Future<void> deleteLikePost(String postID, String userID) async {
    final postsRef = FirebaseFirestore.instance.collection('posts');

    FirebaseFirestore.instance.runTransaction((transaction) async {
      final postDocRef = postsRef.doc(postID);

      final postDocSnapshot = await transaction.get(postDocRef);

      final postData = postDocSnapshot.data();

      final updatedLikeCount = postData?['like_count'] - 1;

      transaction.update(postDocRef, {'like_count': updatedLikeCount});

      final userLikePostRef = await FirebaseFirestore.instance
          .collection("user_like_posts")
          .where("postID", isEqualTo: postID)
          .where("userID", isEqualTo: userID)
          .get();
      final userLikePostDoc = userLikePostRef.docs.first;
      transaction.delete(userLikePostDoc.reference);
    });
  }
}
