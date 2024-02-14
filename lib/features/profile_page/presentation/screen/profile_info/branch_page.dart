import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/utility/assets_data.dart';
import '../../../../../core/utility/colors_data.dart';
import '../../../../../core/utility/theme.dart';
import '../../../../event/organizer/presentation/widgets/information_event.dart';

class BranchPage extends StatelessWidget {
  BranchPage({super.key, required this.tabId, required this.size});

  final int tabId;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              "I want to attend different interesting events and have a good time I want to attend different interesting events and have a good timeI want to attend different interesting events and have a good time",
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
                  "Cairo,Egypt",
                  style: descTextGrayStyle,
                  textAlign: TextAlign.start,
                ),
                InkWell(
                    child: IconButton(
                        onPressed: () {},
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
            Text(
              "01069595665",
              style: descTextStyle,
              textAlign: TextAlign.start,
            ),
            Gap(4.sw),
            Text(
              "Schedule",
              style: venueProfileTextStyle,
              textAlign: TextAlign.start,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const EventDeatils(),
                    //     ));
                  },
                  child: Padding(
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
                              imageUrl: '',
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
                        const Expanded(
                          child: Row(
                            children: [
                              InformationEvent(
                                name: "Name",
                                date: "6/3/1999",
                                venue: "Opera",
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Divider(
                  color: kDividerColor,
                ),
              ],
            ),
            Gap(4.sw),
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
                          imageUrl: '',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset(
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
                  itemCount: 5),
            ),
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
                    return SizedBox(
                      width: 107,
                      height: 48,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(17),
                        child: CachedNetworkImage(
                          imageUrl: '',
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Image.asset(
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
                  itemCount: 5),
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
