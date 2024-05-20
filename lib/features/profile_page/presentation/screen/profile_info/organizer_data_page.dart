import 'package:alafein/features/profile_page/presentation/screen/profile_info/profile_card_data.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/api/constants/api_caller_config.dart';
import '../../../../../core/utility/assets_data.dart';
import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../bloc/organizer_data_bloc.dart';
import '../../widgets/venue_profile_items.dart';
import 'organizer_profile_items.dart';

class OrganizerDataProfile extends StatefulWidget {
  const OrganizerDataProfile({
    super.key,
    required this.successState,
    required this.organizerPageBloc,
  });

  final OrganizerDataFetchingSuccessfulState successState;
  final OrganizerDataBloc organizerPageBloc;

  @override
  State<OrganizerDataProfile> createState() => _OrganizerDataProfileState();
}

class _OrganizerDataProfileState extends State<OrganizerDataProfile> {
  @override
  Widget build(BuildContext context) {
    final organizerData = widget.successState.organizerData;
    final userData = widget.successState.userData;
    print('Organizer Data User ${userData?.firstName}');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Organizer Profile',
          style: venueProfileTextStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.sw),
        child: ListView(
          children: [
            CardProfileItem(
              photo:
              '${APICallerConfiguration.baseImageUrl}${userData?.profilePicture}' ??
                  "",
              size: MediaQuery.of(context).size,
              firstName:  userData?.firstName ?? "",
              lastName:  userData?.lastName ?? "",
              email:  userData?.email ?? "",
            ),

            Gap(8.sw),
            // ListTile(
            //   title: Text(
            //     'Map Link: ${organizerData?.mapLink ?? "No map link"}',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     'Address: ${organizerData?.address ?? "No address"}',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     'Instagram: ${organizerData?.instagram ?? "No Instagram"}',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     'Facebook: ${organizerData?.facebook ?? "No Facebook"}',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     'Website URL: ${organizerData?.websiteURL ?? "No website"}',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     'Other: ${organizerData?.other ?? "No others"}',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     'Description: ${organizerData?.description ?? "No description"}',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            Text(
              "Description",
              style: venueProfileTextStyle,
              textAlign: TextAlign.start,
            ),
            Gap(2.sw),
            Text(
              '${organizerData?.description ?? "No description"}',
              style: descTextStyle,
              textAlign: TextAlign.justify,
            ),
            // ListTile(
            //   title: Text(
            //     'Category Name: ${organizerData?.category?.name ?? "No category name"}',
            //     style: TextStyle(color: Colors.black),
            //   ),
            // ),
            Gap(4.sw),
            Text(
              "Category Name",
              style: venueProfileTextStyle,
              textAlign: TextAlign.start,
            ),
            Gap(2.sw),
            Text(
              '${organizerData?.category?.name ?? "No category name"}',
              style: descTextStyle,
              textAlign: TextAlign.justify,
            ),
            Gap(2.sw),
            OrganizerProfileItem(
              address: organizerData?.websiteURL ?? "",
              facebook: organizerData?.facebook ?? "",
              instagram: organizerData?.instagram ?? "",
              other: organizerData?.other ?? "",
              photo:
              '${APICallerConfiguration.baseImageUrl}${organizerData?.category?.image}' ??
                  "",
              websiteURL: organizerData?.websiteURL ?? "",
              size: MediaQuery.of(context).size,
              youtube: '',
            ),
            // Gap(24),
            // SizedBox(
            //   width: 100,
            //   height: 100,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(17),
            //     child: CachedNetworkImage(
            //       imageUrl:
            //           '${APICallerConfiguration.baseImageUrl}${organizerData?.category?.image ?? ""}',
            //       fit: BoxFit.contain,
            //       errorWidget: (context, url, error) => Image.asset(
            //         AssetsData.eventImg,
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            // Gap(24),
          ],
        ),
      ),
    );
  }
}
