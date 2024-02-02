import 'package:alafein/features/favourite/presentation/widgets/list_view_favorite_items.dart';
import 'package:flutter/material.dart';

class ListViewEventFavorite extends StatelessWidget {
  const ListViewEventFavorite({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 3,
      separatorBuilder: (context, index) => Container(
        width: double.infinity,
        height: 1,
        color: const Color(0xffECECEC),
      ),
      itemBuilder: (context, index) {
        return ListEventFavoriteItems(size: size);
      },
    );
  }
}
