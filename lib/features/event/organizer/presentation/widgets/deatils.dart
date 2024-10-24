import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/deatils_items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import 'calender_details.dart';

class Deatils extends StatelessWidget {
  const Deatils({super.key, required this.date, required this.price, required this.postion, required this.location, required this.isFree, required this.eventName, required this.name});

  final String date;
  final num price;
  final String postion;
  final String? eventName;
  final String name;
  final String location;
  final bool isFree;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Details".tr(),
            style: homeLabelStyle,
          ),
          const Gap(16),
          Row(
            children: [
              CalenderDetails(
                icon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFF7C7C7C),
                ),
                text: date,
                location: location,
                eventName: eventName,
                name: name
              ),
              const Gap(22),
              if (!isFree)
                DeatilsItems(
                  icon: const Gap(0),
                  // const Icon(
                  //   Icons.attach_money_outlined,
                  //   color: Color(0xFF7C7C7C),
                  // ),
                  text: price.toString() + ' EGP',
                  location: '',
                  eventName: eventName,
                  name: name
                ),
            ],
          ),
          const Gap(16),
          Row(
            children: [
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(location));
                },
                child: DeatilsItems(
                    icon: const Icon(
                      Icons.location_on,
                      color: Color(0xFF7C7C7C),
                    ),
                    text: postion,
                    location: location,
                    eventName: eventName,
                    name: name
                ),
              ),
              const Icon(
                Icons.link,
                size: 15,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
