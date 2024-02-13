import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_appbar.dart';
import 'package:alafein/features/favourite/presentation/widgets/list_view_favorite.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          const CustomAppBarEvent(
            title1: "FAVOURITE EVENTS",
            title2: "Here's what you've liked so far", hasIcon: false,
          ),
          const Gap(10),
          ListViewEventFavorite(
            size: size,
          ),
          Image.asset(
            AssetsData.bottomBanner,
          ),
        ],
      ),
    );
  }
}
