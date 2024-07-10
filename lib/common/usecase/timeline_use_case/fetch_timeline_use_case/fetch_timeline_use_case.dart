import 'package:nutritional_management/common/domain/infra_interface/timeline_repository_interface.dart';
import 'package:nutritional_management/common/domain/infra_interface/user_local_repository_interface.dart';
import 'package:nutritional_management/common/domain/model/post/post.dart';
import 'package:nutritional_management/common/usecase/timeline_use_case/fetch_timeline_use_case/fetch_timelein_use_case_interface.dart';
import 'package:nutritional_management/features/register/presentation/register_presentation.dart';

class FetchTimeLineUseCase implements FetchTimeLineUseCaseInterface {
  final TimeLineRepositoryInterface timeLineRepository;
  final UserLocalRepositoryInterface userLocalRepository;

  FetchTimeLineUseCase(this.timeLineRepository, this.userLocalRepository);

  @override
  Future<List<Post>> call() async {
    try {
      final currentUserID = await userLocalRepository.getUserID();
      if (currentUserID != null) {
        final posts =
            await timeLineRepository.getAllPostsWithUserLikes(currentUserID);

        return posts;
      } else {
        return Future.error(Error());
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
