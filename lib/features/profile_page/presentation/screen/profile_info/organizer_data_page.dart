import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/api/constants/api_caller_config.dart';
import '../../../../../core/utility/assets_data.dart';
import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../bloc/organizer_data_bloc.dart';

class OrganizerDataProfile extends StatefulWidget {
  const OrganizerDataProfile({
    Key? key,
    required this.successState,
    required this.organizerPageBloc,
  }) : super(key: key);

  final OrganizerDataFetchingSuccessfulState successState;
  final OrganizerDataBloc organizerPageBloc;

  @override
  State<OrganizerDataProfile> createState() => _OrganizerDataProfileState();
}

class _OrganizerDataProfileState extends State<OrganizerDataProfile> {
  @override
  Widget build(BuildContext context) {
    final organizerData = widget.successState.organizerData;
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
            Gap(4.sw),
            ListTile(
              title: Text(
                'PERSONAL INFORMATION',
                style: homeLabel4Style,
              ),
            ),
            ListTile(
              title: Text(
                'Map Link: ${organizerData?.mapLink ?? "No map link"}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Text(
                'Address: ${organizerData?.address ?? "No address"}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Text(
                'Instagram: ${organizerData?.instagram ?? "No Instagram"}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Text(
                'Facebook: ${organizerData?.facebook ?? "No Facebook"}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Text(
                'Website URL: ${organizerData?.websiteURL ?? "No website"}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Text(
                'Other: ${organizerData?.other ?? "No others"}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Text(
                'Description: ${organizerData?.description ?? "No description"}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              title: Text(
                'Category Name: ${organizerData?.category?.name ?? "No category name"}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Gap(24),
            SizedBox(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: CachedNetworkImage(
                  imageUrl:
                      '${APICallerConfiguration.baseImageUrl}${organizerData?.category?.image ?? ""}',
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) => Image.asset(
                    AssetsData.eventImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Gap(24),
          ],
        ),
      ),
    );
  }
}
