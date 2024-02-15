import 'dart:ffi';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/profile_page/presentation/widgets/custom_profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../bloc/profile_page_bloc.dart';
import '../../model/profile_page_ui_model.dart';

class AudienceProfile extends StatelessWidget {
  const AudienceProfile({super.key, required this.successState, required this.profilePageBloc});

  final ProfilePageFetchingSuccessfulState successState;
  final ProfilePageBloc profilePageBloc;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 50, 24, 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'PERSONAL INFORMATION',
                          style: homeLabeProfileStyle,
                        ),
                        InkWell(
                          onTap: () {
                            //Call  the update user info function in the bloc
                            // get the event ProfilePageEditEvent ()
                            profilePageBloc.add(ProfilePageEditEvent());
                          },
                          child: const Text(
                            'Edit profile',
                            style: personalInfoLabelPrimary,
                          ),
                        ),
                      ],
                    ),
                    const Gap(40),
                    const Text(
                      'PROFILE PICTURE',
                      style: homeLabel4Style,
                    ),
                    Container(
                      width: 27.sw,
                      height: 27.sw,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  successState.profilePage.photo != null
                                      ? successState.profilePage.photo
                                      : "")),
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 0, color: Colors.transparent),
                          color: kProfilePicBackgroundColor),
                      child: null,
                    ),
                    const Gap(24),
                    const Text(
                      'PERSONAL INFORMATION',
                      style: homeLabel4Style,
                    ),
                    const Gap(16),
                    CustomProfileAppBarEvent(
                      title: successState.profilePage.firstName,
                      onTap: null,
                    ),
                    const Gap(16),
                    CustomProfileAppBarEvent(
                      title: successState.profilePage.lastName,
                      onTap: null,
                    ),
                    const Gap(16),
                    CustomProfileAppBarEvent(
                      title: successState.profilePage.email,
                      onTap: null,
                    ),
                    const Gap(16),
                    CustomProfileAppBarEvent(
                      title: successState.profilePage.phone == null
                          ? "No Data"
                          : successState.profilePage.phone,
                      // title: "01022971429",
                      onTap: null,
                    ),
                    const Gap(24),
                    const Text(
                      'SECURITY',
                      style: homeLabel4Style,
                    ),
                    const Gap(16),
                    const CustomProfileAppBarEvent(
                      title: "••••••••",
                      onTap: null,
                    )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
