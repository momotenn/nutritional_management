import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutritional_management/common/components/post_list_item.dart';
import 'package:nutritional_management/features/timeline/presentation/timeline_presentation.dart';
import 'package:nutritional_management/features/timeline/presentation/view_model/timeline_view_model.dart';

class TimeLinePage extends HookConsumerWidget {
  const TimeLinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timeLinePresentationProvider);

    // useEffectで非同期処理を実行
    useEffect(() {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
        // 非同期処理を実行し、完了するまで待つ
        await ref
            .read(timeLinePresentationProvider.notifier)
            .didPresentedTimeLine();
      });
      // useEffectのクリーンアップ処理は不要なので、returnは不要
    }, []);

    // fetchTimeLineStatusに応じて状態を切り替えて返す
    switch (state.fetchTimeLineStatus) {
      case FetchTimeLineStatus.initial:
        return Container(); // FetchTimeLineStatus.initial の場合
      case FetchTimeLineStatus.loading:
        return Center(
            child:
                CircularProgressIndicator()); // FetchTimeLineStatus.loading の場合
      case FetchTimeLineStatus.failure:
        return Center(
            child: Text(
                'Failed to load timeline')); // FetchTimeLineStatus.failure の場合
      case FetchTimeLineStatus.success:
        return Scaffold(
            appBar: AppBar(
              title: Text("timeline"),
            ),
            body: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return PostListItem(
                      item: state.posts[index],
                      didTappedLikeButtonHandler: () async {
                        await ref
                            .read(timeLinePresentationProvider.notifier)
                            .didTappedLikeButton(index);
                      });
                })); // FetchTimeLineStatus.success の場合
      default:
        return Container();
    }
  }
}
