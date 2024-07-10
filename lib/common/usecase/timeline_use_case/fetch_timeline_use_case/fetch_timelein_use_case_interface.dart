import 'package:nutritional_management/common/domain/model/post/post.dart';

abstract class FetchTimeLineUseCaseInterface {
  Future<List<Post>> call();
}
