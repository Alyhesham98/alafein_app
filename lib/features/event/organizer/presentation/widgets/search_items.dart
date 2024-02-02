import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

class SearchItems extends StatelessWidget {
  const SearchItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kDividerColor, width: 1.5),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AssetsData.search,
                    color: const Color(0xFF7C7C7C),
                  ),
                  const Gap(16),
                  Text(
                    "Search",
                    style: secondaryTextStyle,
                  ),
                ],
              ),
            ),
          ),
          const Gap(16),
          CustomIcon(
            onTap: () {},
            icon: SvgPicture.asset(
              AssetsData.svgIcEventicon,
              color: const Color(0xFF7C7C7C),
            ),
          ),
        ],
      ),
    );
  }
}
