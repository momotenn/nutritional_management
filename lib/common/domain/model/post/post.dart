class Post {
  final String id;
  final String userId;
  final String text;
  final String userName;
  final String userProfileData;
  final int likeCount;
  final bool hasUserLiked;
  final DateTime createdAt;
  Post(
      {required this.id,
      required this.userName,
      required this.userId,
      required this.text,
      required this.userProfileData,
      required this.likeCount,
      required this.hasUserLiked,
      required this.createdAt});
}
