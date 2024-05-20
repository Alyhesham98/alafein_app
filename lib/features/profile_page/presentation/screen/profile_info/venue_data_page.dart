import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/api/constants/api_caller_config.dart';
import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';

import '../../bloc/venue_data_bloc.dart';
import '../../widgets/venue_profile_items.dart';
import 'branch_data_page.dart';

class VenueDataProfile extends StatefulWidget {
  final String? photo;
  const VenueDataProfile(
      {super.key, required this.successState, required this.venueDataBloc, this.photo});

  final VenueDataFetchingSuccessfulState successState;
  final VenueDataBloc venueDataBloc;

  @override
  State<VenueDataProfile> createState() => _VenueDataProfileState();
}

class _VenueDataProfileState extends State<VenueDataProfile>
    with SingleTickerProviderStateMixin {
  List<Widget> pages = [];
  late int tabController;

  @override
  void initState() {
    super.initState();
    tabController = 0;
    widget.successState.venueData?.branches?.forEach((element) {
      pages.add(BranchDataPage(
        branch: element,
        successState: widget.successState,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = widget.successState.venueData;
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
              address: uiState?.websiteURL ?? "",
              facebook: uiState?.facebook ?? "",
              instagram: uiState?.instagram ?? "",
              other: uiState?.other ?? "",
              photo:
                  widget.photo ??
                      "",
              websiteURL: uiState?.websiteURL ?? "",
              name: uiState?.venueName ?? "",
              size: size,
              youtube: '',
              whatsapp: uiState?.phoneNumber ?? '',
            ),
            Gap(8.sw),
            SizedBox(
              height: 35,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // Ensuring uiState and branches are not null
                  if (uiState != null && uiState!.branches != null && index < uiState!.branches!.length) {
                    return AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: 80.screenWidth / 3,
                      child: Column(
                        // Adjusting crossAxisAlignment to ensure content fits
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Wrapping Text widget with Flexible to prevent overflow
                          Flexible(
                            child: Text(
                              uiState!.branches![index].name ?? '',
                              style: index != tabController ? branchStyle : branchSelectedStyle,
                              // Setting textAlign to center to keep the text centered
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // Removing Gap widget as it might contribute to overflow
                          Container(
                            height: 5,
                            color: index == tabController ? kPrimaryColor : kHintColor,
                          )
                        ],
                      ),
                    ).animate().shimmer(duration: Duration(seconds: 2));
                  } else {
                    // Returning an empty Container if data is null or index is out of bounds
                    return Container();
                  }
                },
                separatorBuilder: (context, index) {
                  // Adjusting separator height to prevent unnecessary overflow
                  return SizedBox(height: 5);
                },
                itemCount: uiState?.branches?.length ?? 0,
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

                children: pages,
                // children: signupCubit.branches_pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
