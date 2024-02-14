import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class VenueProfileItem extends StatelessWidget {
  const VenueProfileItem({
    super.key,
    required this.size,
    required this.name,
    required this.instagram,
    required this.facebook,
    required this.websiteURL,
    required this.other,
    required this.address,
    required this.mapLink,
    required this.photo,
  });

  final Size size;
  final String name;
  final String instagram;
  final String facebook;
  final String websiteURL;
  final String other;
  final String address;
  final String mapLink;
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 0,
      ),
      child: SizedBox(
        height: 111,
        child: Row(children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: CachedNetworkImage(
                imageUrl: photo,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Image.asset(
                  AssetsData.eventImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: homeLabelStyle,
                ),
                SizedBox(
                  height: 50,
                  child: ListView(scrollDirection: Axis.horizontal,
                      children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AssetsData.fasbookevent,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AssetsData.instagram,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AssetsData.youtupe,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AssetsData.wattsApp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AssetsData.net,
                        color: Colors.black,
                      ),
                    ),
                  ]),
                ),

              ],
            ),
          ),
        ]),
      ),
    );
  }
}
