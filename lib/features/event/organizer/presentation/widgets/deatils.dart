import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/deatils_items.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Deatils extends StatelessWidget {
  const Deatils({
    super.key,
    required this.date,
    required this.price,
    required this.postion, required this.location,
  });
  final String date;
  final num price;
  final String postion;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Details",
            style: homeLabelStyle,
          ),
          const Gap(16),
          Row(
            children: [
              DeatilsItems(
                icon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFF7C7C7C),
                ),
                text: date, location: '',
              ),
              const Gap(42),
              DeatilsItems(
                icon: SvgPicture.asset(
                  AssetsData.svgIcFavorite,
                  color: const Color(0xFF7C7C7C),
                ),
                text: price.toString(), location: '',
              ),
            ],
          ),
          const Gap(16),
          Row(
            children: [
              DeatilsItems(
                icon: const Icon(
                  Icons.location_on,
                  color: Color(0xFF7C7C7C),
                ),
                text: postion, location:location ,
              ),
              InkWell(
                onTap: (){
                  launchUrl(Uri.parse(location));
                },
                child: const Icon(
                  Icons.link,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
