import 'dart:developer';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/features/profile_page/presentation/widgets/custom_profile_list_item.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utility/theme.dart';
import '../widgets/profile_three_items.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Gap(16),
              const Text(
                'PROFILES',
                style: homeLabeProfileStyle,
              ),
              SessionManagement.getUserRole() != ""
                  ? const CustomProfileAppBarEvent(
                      title: "PERSONAL INFORMATION",
                      onTap: 1,
                    )
                  : const Gap(0),
              const Gap(16),
              const CustomProfileAppBarEvent(
                title: "CHANGE LANGUAGE",
                onTap: 2,
              ),
              const Gap(16),
              const CustomProfileAppBarEvent(
                title: "NOTIFICATIONS",
                onTap: 3,
              ),
              const Gap(16),
              ThreeItems(c: context),
              const Gap(16),
              if (SessionManagement.getUserRole() != "")
                const CustomProfileAppBarEvent(
                  title: "LOGOUT",
                  onTap: 4,
                  color: Colors.redAccent,
                )
              else
                const CustomProfileAppBarEvent(
                  title: "REGISTER",
                  onTap: 4,
                  color: Colors.redAccent,
                )
            ]),
          ),
        ),
      ],

      ///buttons
    );

    //  Center(
    //         child: InkWell(
    //             onTap: () {
    //               SessionManagement.signOut();
    //               AutoRouter.of(context).replaceAll([const LoginRoute()]);
    //             },
    //             child: const Text("Log ouuuut")),
    //       );

    //  BlocProvider(
    //   create: (context) => GetEventCubit()..getEventPagination(),
    //   child: Eventbody(size: size),
    // );
  }
}
