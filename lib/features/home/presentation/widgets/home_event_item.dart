import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeEventItem extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  const HomeEventItem({
    super.key,
    required this.image,
    required this.name,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 180,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                image,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset(AssetsData.eventImg),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Image.asset(
                  AssetsData.music,
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
          const Gap(8),
          Text(
            name,
            style: homeLabel2Style,
          ),
          Text(date, style: secondaryTextStyle)
        ],
      ),
    );
  }
}
