import 'dart:ffi';

import 'package:alafein/features/profile_page/presentation/screen/profile_info/branch_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';

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
      body: Padding(
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
            SizedBox(
              height: 35,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (c, i) {
                    return AnimatedContainer(
                      duration: 1.seconds,
                      width: 80.screenWidth / 3,
                      child: Column(
                        children: [
                          Text(
                            "Branch",
                            style: i != tabController
                                ? branchStyle
                                : branchSelectedStyle,
                          ),
                          Gap(2.sw),
                          Container(
                            height: 5,
                            color:
                                i == tabController ? kPrimaryColor : kHintColor,
                          )
                        ],
                      ),
                    ).animate().shimmer(duration: 2.seconds);
                  },
                  separatorBuilder: (c, i) {
                    return Container(
                      color: kHintColor,
                    );
                  },
                  itemCount: 3),
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
                  BranchPage(tabId: tabController, size: size),
                  BranchPage(tabId: tabController, size: size),
                  BranchPage(tabId: tabController, size: size),
                ],
                // children: signupCubit.branches_pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
