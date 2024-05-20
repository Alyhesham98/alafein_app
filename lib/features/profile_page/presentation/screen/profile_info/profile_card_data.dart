import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CardProfileItem extends StatelessWidget {
  const CardProfileItem({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photo,
    required this.size,
  });

  final Size size;
  final String firstName;
  final String lastName;
  final String email;
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
                  "$firstName $lastName",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: homeLabelStyle,
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Visibility(
                        visible: email != '',
                        child: IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse(email));
                          },
                          icon: SvgPicture.asset(
                            AssetsData.net,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
