import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nutritional_management/features/timeline/presentation/view_model/timeline_view_model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({
    Key? key,
    required this.item,
    required this.didTappedLikeButtonHandler,
  }) : super(key: key);

  final Post item;
  final Future<void> Function() didTappedLikeButtonHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // 上揃えにする
            children: [
              Image(
                image: item.profileImage.image,
                width: 50,
                height: 50,
              ),
              SizedBox(width: 8), // 少し隙間を開ける
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(item.userName),
                      SizedBox(width: 8),
                      Text(item.createdAtText),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(item.text),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await didTappedLikeButtonHandler();
                        },
                        icon: Icon(Icons.favorite_border),
                        color: item.likeButtonColor,
                      ),
                      Text("${item.likeCount}"),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
