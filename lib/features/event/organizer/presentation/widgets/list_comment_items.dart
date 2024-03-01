import 'package:alafein/features/event/data/model/comments/comments.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/comment_items.dart';
import 'package:flutter/material.dart';

class ListCommetItems extends StatelessWidget {
  List<Comments> comments;

  ListCommetItems(this.comments, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      // scrollDirection: Axis.vertical,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) =>   Padding(
        padding: const EdgeInsets.only(left: 24, right: 16),
        child: CommentItems(comments[index]),
      ),
      separatorBuilder: (context, index) => Container(
        width: double.infinity,
        color: Colors.grey,
        height: 1.3,
      ),
      itemCount: comments.length,
    );
  }
}
