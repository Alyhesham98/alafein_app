import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 24,
      ),
      child: SizedBox(
        height: 111,
        child: Row(children: [
          CustomEventImage(
            imageurl: photo,
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: homeLabelStyle,
                ),
              ),
              Row(
                children: [
                  Text(
                    address,
                    style: secondaryTextStyle,
                  ),
                  InkWell(
                    onTap: (){

                      launchUrl(Uri.parse(mapLink));
                    },
                    child: const Icon(
                      Icons.link,
                      size: 15,
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
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: SvgPicture.asset(
                  //     AssetsData.youtupe,
                  //   ),
                  // ),
                  IconButton(
                    onPressed: () {
                      String url='';
                      if (TargetPlatform.iOS==Theme.of(context).platform) {
                        url= "whatsapp://wa.me/$whatsapp/?text= ";
                      } else {
                        url= "https://api.whatsapp.com/send?phone=$whatsapp&text= ";
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
        ]),
      ),
    );
  }
}
