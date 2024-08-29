import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/profile_page/presentation/widgets/custom_profile_list_item.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/utility/theme.dart';
import '../widgets/profile_three_items.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final DateTime targetDate = DateTime(2024, 6, 26);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Gap(16),
              Text(
                'Profile'.tr().toUpperCase(),
                style: homeLabeProfileStyle,
              ),
              SessionManagement.getUserRole() != ""
                  ? CustomProfileAppBarEvent(
                title: "Personal Information".tr().toUpperCase(),
                onTap: 1,
              )
                  : const Gap(0),
              const Gap(16),
              CustomProfileAppBarEvent(
                title: "Change Language".tr().toUpperCase(),
                onTap: 2,
              ),
              const Gap(16),
              CustomProfileAppBarEvent(
                title: "Notifications".tr().toUpperCase(),
                onTap: 3,
              ),
              const Gap(16),
              ThreeItems(c: context),
              const Gap(16),
              if (SessionManagement.getUserRole() != "")
                CustomProfileAppBarEvent(
                  title: "Logout".tr().toUpperCase(),
                  onTap: 4,
                  color: Colors.redAccent,
                )
              else
                CustomProfileAppBarEvent(
                  title: "Register or Logout".tr().toUpperCase(),
                  onTap: 4,
                  color: Colors.redAccent,
                ),
              if (SessionManagement.getUserRole() != "")
                CustomProfileAppBarEvent(
                  title: "Delete Account".tr().toUpperCase(),
                  onTap: 5,
                  color: Colors.redAccent,
                ),
            ]),
          ),
        ),
      ],
    );
  }
}
