
import 'package:alafein/features/profile_page/presentation/bloc/profile_page_bloc.dart';
import 'package:alafein/features/profile_page/presentation/screen/profile_info/branch_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../model/Profile.dart';

import '../../../../../core/api/constants/api_caller_config.dart';
import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';

import '../../widgets/venue_profile_items.dart';

class VenueProfile extends StatefulWidget {
  const VenueProfile(
      {super.key, required this.successState, required this.profilePageBloc});

  final ProfilePageFetchingSuccessfulState successState;
  final ProfilePageBloc profilePageBloc;

  @override
  State<VenueProfile> createState() => _VenueProfileState();
}

class _VenueProfileState extends State<VenueProfile>
    with SingleTickerProviderStateMixin {
  List<Widget> pages = [];
  late int tabController;

  @override
  void initState() {
    super.initState();
    tabController = 0;
    widget.successState.profilePage?.venue?.branches?.forEach((element) {
      pages.add(BranchPage(branch: element,successState: widget.successState,));
    });
  }

  @override
  Widget build(BuildContext context) {
    final uiState = widget.successState.profilePage?.venue;
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
                  '${APICallerConfiguration.baseImageUrl}${uiState?.venueImage}' ??
                      "",
              websiteURL: uiState?.websiteURL ?? "",
              name: uiState?.venueName ?? "",
              size: size, youtube: '', whatsapp:uiState?.phoneNumber?? '',
            ),
            Gap(8.sw),
            SizedBox(
              height: 35,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final branch = uiState!.branches?[index];
                    final isSelected = index == tabController;
                    return _buildBranchWidget(branch, isSelected);
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      color: kHintColor,
                    );
                  },
                  itemCount: uiState?.branches?.length ?? 0),
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
Widget _buildBranchWidget(Branches? branch, bool isSelected) {
  const maxNameLength = 10; // Define the maximum length for branch names
  final branchName = branch?.name ?? '';
  final truncatedName = branchName.length > maxNameLength
      ? '${branchName.substring(0, maxNameLength)}...' // Truncate long names
      : branchName;

  return AnimatedContainer(
    duration: const Duration(seconds: 1),
    width: 150.screenWidth / 2,
    child: Column(
      children: [
        Text(
          truncatedName,
          style: isSelected ? branchSelectedStyle : branchStyle,
        ),
        Gap(2.sw),
        Container(
          height: 5,
          color: isSelected ? kPrimaryColor : kHintColor,
        )
      ],
    ),
  ).animate().shimmer(duration: Duration(seconds: 2));
}
