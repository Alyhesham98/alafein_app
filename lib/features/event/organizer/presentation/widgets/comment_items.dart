import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CommentItems extends StatelessWidget {
  const CommentItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  AssetsData.eventImg,
                ),
              ),
              Gap(5),
              Text(
                "Jane Doe",
                style: homeLabel3Style,
              ),
            ],
          ),
          const Gap(8),
          Text(
            "Ireally appreciate the insights and perspective shared in this article. It's definitely given me something to think about.",
            style: eventcomment.copyWith(height: 1.8),
          ),
        ],
      ),
    );
  }
}
