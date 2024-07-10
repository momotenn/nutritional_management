import 'package:nutritional_management/common/domain/infra_interface/timeline_repository_interface.dart';
import 'package:nutritional_management/common/domain/infra_interface/user_local_repository_interface.dart';
import 'package:nutritional_management/common/usecase/timeline_use_case/un_like_post_use_case/unlike_post_use_case_interface.dart';

class UnLikePostUseCase implements UnLikePostUseCaseInterface {
  final TimeLineRepositoryInterface timeLineRepository;
  final UserLocalRepositoryInterface userLocalRepository;

  UnLikePostUseCase(this.timeLineRepository, this.userLocalRepository);

//いいねを解除＝＞いいねの数をー１、userID,postIDが削除される

  @override
  Future<void> call(String postID) async {
    try {
      final currentUserID = await userLocalRepository.getUserID();
      if (currentUserID != null) {
        final result = timeLineRepository.deleteLikePost(postID, currentUserID);
        return result;
      } else {
        return Future.error(Error());
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
