import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utility/assets_data.dart';
import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../../../auth/signup/widgets/signup_custom_text.dart';
import '../../../../create_event/organizer/presentation/widget/page_one.dart';
import '../../../../create_event/organizer/presentation/widget/page_three.dart';
import '../../../../create_event/organizer/presentation/widget/page_two.dart';
import '../../widgets/venue_profile_items.dart';

class VenueProfile extends StatefulWidget {
  const VenueProfile({super.key});

  @override
  State<VenueProfile> createState() => _VenueProfileState();
}

class _VenueProfileState extends State<VenueProfile>
    with SingleTickerProviderStateMixin {
  late int tabController;

  @override
  void initState() {
    super.initState();
    tabController = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Venue Profile",
          style: venueProfileTextStyle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.sw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(4.sw),
              VenueProfileItem(
                address: "address" ?? "",
                facebook: "getDeatils.venue?.facebook" ?? "",
                instagram: "getDeatils.venue?.instagram" ?? "",
                mapLink: "getDeatils.venue?.mapLink" ?? "",
                other: "getDeatils.venue?.other" ?? "",
                photo: "getDeatils.venue?.photo" ?? "",
                websiteURL: "getDeatils.venue?.websiteUrl" ?? "",
                name: "getDeatils.venue?.name" ?? "",
                size: size,
              ),
              Gap(8.sw),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: 1.seconds,
                    width: 80.screenWidth / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Branch",
                          style: index != tabController
                              ? branchStyle
                              : branchSelectedStyle,
                        ),
                        Container(
                          height: 5,
                          color: index == tabController
                              ? kPrimaryColor
                              : kHintColor,
                        )
                      ],
                    ),
                  ).animate().shimmer(duration: 2.seconds),
                ),
              ),
              Gap(4.sw),
              Expanded(
                child: PageView(
                  reverse: false,
                  onPageChanged: (index) {
                    setState(() {
                      tabController = index;
                    });
                  },
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: venueProfileTextStyle,
                          textAlign: TextAlign.start,
                        ),
                        Gap(2.sw),
                        Text(
                          "I want to attend different interesting events and have a good timeI want to attend different interesting events and have a good timeI want to attend different interesting events and have a good time",
                          style: descTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                        Gap(4.sw),
                        Text(
                          "Location",
                          style: venueProfileTextStyle,
                          textAlign: TextAlign.start,
                        ),
                        Gap(2.sw),
                        Row(
                          children: [
                            SizedBox(height: 24,width: 24,child: SvgPicture.string(AssetsData.mapMark ,color: kIconGrayColor,))
                          ],
                        ),
                        Gap(2.sw),
                        Text(
                          "Phone Number",
                          style: venueProfileTextStyle,
                          textAlign: TextAlign.start,
                        ),
                        Gap(2.sw),
                        Text(
                          "01069595665",
                          style: descTextStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    )
                  ],
                  // children: signupCubit.branches_pages,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
