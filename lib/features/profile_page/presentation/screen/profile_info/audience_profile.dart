import 'dart:ffi';

import 'package:alafein/core/local_data/session_management.dart';
import 'package:alafein/features/profile_page/presentation/widgets/custom_profile_list_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';

class AudienceProfile extends StatelessWidget {
  const AudienceProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                                onTap: () {},
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
                                image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "https://th.bing.com/th/id/R.3bf6defde5c52b2dd385ed4b3d18818c?rik=XZ4f8hPBaB2gLg&pid=ImgRaw&r=0")),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 0, color: Colors.transparent),
                                color: kProfilePicBackgroundColor),
                            child: null,
                          ),
                          const Gap(24),
                          const Text(
                            'PERSONAL INFORMATION',
                            style: homeLabel4Style,
                          ),
                          const Gap(16),
                          const CustomProfileAppBarEvent(
                            title: "Ahmed",
                            onTap: null,
                          ),
                          const Gap(16),
                          const CustomProfileAppBarEvent(
                            title: "Ehab",
                            onTap: null,
                          ),
                          const Gap(16),
                          const CustomProfileAppBarEvent(
                            title: "Ahmed@gmail.com",
                            onTap: null,
                          ),
                          const Gap(16),
                          const CustomProfileAppBarEvent(
                            title: "01069595665",
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

            ///buttons
          );
        }
    }


