import 'package:alafein/features/event/organizer/presentation/widgets/comment_items.dart';
import 'package:flutter/material.dart';

class ListCommetItems extends StatelessWidget {
  const ListCommetItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.only(left: 24, right: 16),
        child: CommentItems(),
      ),
      separatorBuilder: (context, index) => Container(
        width: double.infinity,
        color: Colors.grey,
        height: 1.3,
      ),
      itemCount: 3,
    );
  }
}
