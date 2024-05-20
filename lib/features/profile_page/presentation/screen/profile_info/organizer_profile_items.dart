import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class OrganizerProfileItem extends StatelessWidget {
  const OrganizerProfileItem({
    super.key,
    required this.size,
    required this.instagram,
    required this.facebook,
    required this.websiteURL,
    required this.youtube,
    required this.other,
    required this.address,
    required this.photo,
  });

  final Size size;
  final String? instagram;
  final String? facebook;
  final String? websiteURL;
  final String? youtube;
  final String? other;
  final String? address;
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
                // Text(
                //   name,
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                //   style: homeLabelStyle,
                // ),
                SizedBox(
                  height: 50,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    Visibility(
                        visible: facebook != '' && facebook != null,
                        child: IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse(facebook!));
                          },
                          icon: SvgPicture.asset(
                            AssetsData.fasbookevent,
                          ),
                        )),
                    Visibility(
                      visible: instagram != '' && instagram != null,
                      child: IconButton(
                        onPressed: () {
                          launchUrl(Uri.parse(instagram!));

                        },
                        icon: SvgPicture.asset(
                          AssetsData.instagram,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: youtube != '' && youtube != null,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          AssetsData.youtupe,
                        ),
                      ),
                    ),
                    // Visibility(
                    //   visible: whatsapp != '' && whatsapp != null,
                    //   child: IconButton(
                    //     onPressed: () {
                    //       // whatsapp ?? _launchInBrowser("whatsapp://send?phone=+2$whatsapp&text= ");
                    //       String url='';
                    //       if (TargetPlatform.iOS==Theme.of(context).platform) {
                    //         url= "whatsapp://wa.me/$whatsapp/?text= ";
                    //       } else {
                    //         url= "https://api.whatsapp.com/send?phone=$whatsapp&text= ";
                    //       }
                    //       launchUrl(Uri.parse(url));
                    //     },
                    //     icon: SvgPicture.asset(
                    //       AssetsData.wattsApp,
                    //     ),
                    //   ),
                    // ),
                    Visibility(
                      visible: websiteURL != '' && websiteURL != null,
                      child: IconButton(
                        onPressed: () {
                          launchUrl(Uri.parse(websiteURL!));

                        },
                        icon: SvgPicture.asset(
                          AssetsData.net,
                          color: Colors.black,
                        ),
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
