import 'package:alafein/core/utility/assets_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeaderEventImage extends StatelessWidget {
  const HeaderEventImage({
    super.key,
    required this.imageurl,
  });

  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2/3,
      child: CachedNetworkImage(
        imageUrl: imageurl,
        fit: BoxFit.fitWidth,
        errorWidget: (context, url, error) => Image.asset(
          AssetsData.headerImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
