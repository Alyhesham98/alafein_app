import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/api/constants/api_caller_config.dart';
import '../../../../../core/utility/assets_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../../../event/organizer/presentation/widgets/information_event.dart';
import '../../bloc/profile_page_bloc.dart';
import '../../model/Profile.dart';

class BranchPage extends StatelessWidget {
  const BranchPage(
      {super.key, required this.branch, required this.successState});

  final Branches branch;
  final ProfilePageFetchingSuccessfulState successState;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var uiState = successState.profilePage?.venue;
    List<Widget> pages = [];

    uiState?.schedule?.forEach((element) {
      pages.add(ScheduleListItem(
        size: size,
        image: element.poster ?? '',
        name: element.name ?? '',
        date: element.date?.join(" , ") ?? '',
        venue: uiState.venueName ?? "",
      ));
    });
    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: venueProfileTextStyle,
              textAlign: TextAlign.start,
            ),
            Gap(2.sw),
            Text(
              uiState?.venueDescription ?? '',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsData.location,
                  width: 24,
                  height: 24,
                ),
                Text(
                  branch.address ?? '',
                  style: descTextGrayStyle,
                  textAlign: TextAlign.start,
                ),
                InkWell(
                    child: IconButton(
                        onPressed: () {
                          launchUrl(Uri.parse(branch.mapLink!));
                        },
                        icon: Image.asset(
                          AssetsData.externalLink,
                          width: 16,
                          height: 16,
                        ))),
              ],
            ),
            Gap(2.sw),
            Text(
              "Phone Number",
              style: venueProfileTextStyle,
              textAlign: TextAlign.start,
            ),
            Gap(2.sw),
            InkWell(
              onTap: () {
                launch("tel://${uiState.phoneNumber}");
              },
              child: Text(
                uiState!.phoneNumber ?? '',
                style: descTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Gap(4.sw),
            Text(
              "Schedule",
              style: venueProfileTextStyle,
              textAlign: TextAlign.start,
            ),
            Column(
              children: pages,
            ),
            Gap(4.sw),
            Visibility(
              visible: uiState.photos!.isEmpty,
              child: Column(
                children: [
                  Text(
                    "Photos",
                    style: venueProfileTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  Gap(2.sw),
                  SizedBox(
                    height: 56,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, i) {
                          return SizedBox(
                            width: 56,
                            height: 56,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(17),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${APICallerConfiguration.baseImageUrl}${uiState.photos?[i]}",
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AssetsData.eventImg,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (c, i) {
                          return const SizedBox(
                            width: 16,
                          );
                        },
                        itemCount: uiState.photos?.length ?? 0),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: uiState.facilities!.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(4.sw),
                  Text(
                    "Facilities",
                    style: venueProfileTextStyle,
                    textAlign: TextAlign.start,
                  ),
                  Gap(2.sw),
                  SizedBox(
                    height: 48,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, i) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(17),
                            child: SvgPicture.network("${APICallerConfiguration.baseImageUrl}${uiState.facilities?[i].imagePath}",width: 107,height: 48,),
                          );
                        },
                        separatorBuilder: (c, i) {
                          return const SizedBox(
                            width: 16,
                          );
                        },
                        itemCount: uiState.facilities?.length ?? 0),
                  ),
                ],
              ),
            ),
            Gap(4.sw),
            Image.asset(AssetsData.bottomBanner),
            Gap(8.sw),
          ],
        ),
      ),
    );
  }
}

class ScheduleListItem extends StatelessWidget {
  const ScheduleListItem({
    super.key,
    required this.size,
    required this.image,
    required this.name,
    required this.date,
    required this.venue,
  });

  final Size size;
  final String image;
  final String name;
  final String date;
  final String venue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: SizedBox(
        height: 100,
        child: Row(children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Image.asset(
                  AssetsData.eventImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
            child: Row(
              children: [
                InformationEvent(
                  name: name,
                  date: date,
                  venue: venue,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
