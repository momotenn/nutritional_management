import 'package:nutritional_management/common/domain/infra_interface/timeline_repository_interface.dart';
import 'package:nutritional_management/common/domain/infra_interface/user_local_repository_interface.dart';
import 'package:nutritional_management/common/usecase/timeline_use_case/like_post_use_case/like_post_use_case_interface.dart';

class LikePostUseCase implements LikePostUseCaseInterface {
  final TimeLineRepositoryInterface timeLineRepository;
  final UserLocalRepositoryInterface userLocalRepository;

  LikePostUseCase(this.timeLineRepository, this.userLocalRepository);

//いいねを押した＝＞いいねの数を＋１、userID,postIDが追加される

  @override
  Future<void> call(String postID) async {
    try {
      final currentUserID = await userLocalRepository.getUserID();
      if (currentUserID != null) {
        final result = timeLineRepository.createLikePost(postID, currentUserID);
        return result;
      } else {
        return Future.error(Error());
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
