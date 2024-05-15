import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alafein/features/event/data/model/event_datils/event_deatils_model/venue.dart';

import '../../../../profile_page/presentation/screen/profile_info/organizer_info.dart';
import '../../../../profile_page/presentation/screen/profile_info/venue_info.dart';
class EventDeatilsItem extends StatelessWidget {
  const EventDeatilsItem({
    super.key,
    required this.size,
    required this.name,
    required this.instagram,
    required this.facebook,
    required this.websiteURL,
    required this.whatsapp,
    required this.other,
    required this.address,
    required this.mapLink,
    required this.photo,
    this.venueID,
    this.organizerID
  });

  final Size size;
  final String name;
  final String instagram;
  final String facebook;
  final String websiteURL;
  final String whatsapp;
  final String other;
  final String address;
  final String mapLink;
  final String photo;
  final int? venueID;
  final int? organizerID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // CustomEventImage(
          //   imageurl: photo,
          // ),
          GestureDetector(
            onTap: () {
              if(venueID != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => VenueInfoPage(venueID: venueID),
                    ));
              } else{
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => OrganizerInfoPage(organizerID: organizerID),
                    ));
              }
            },
            child: CustomEventImage(
              imageurl: photo,
            ),
          ),

          SizedBox(
            width: size.width * 0.03,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .4,
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: homeLabelStyle,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        address,
                        maxLines: 1,
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(mapLink));
                      },
                      child: const Icon(
                        Icons.link,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        launchUrl(Uri.parse(facebook));
                      },
                      icon: SvgPicture.asset(
                        AssetsData.fasbookevent,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        String url = '';
                        if (Theme.of(context).platform == TargetPlatform.iOS) {
                          url = "whatsapp://wa.me/$whatsapp/?text= ";
                        } else {
                          url = "https://api.whatsapp.com/send?phone=$whatsapp&text= ";
                        }
                        launchUrl(Uri.parse(url));
                      },
                      icon: SvgPicture.asset(
                        AssetsData.wattsApp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        launchUrl(Uri.parse(websiteURL));
                      },
                      icon: SvgPicture.asset(
                        AssetsData.net,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
