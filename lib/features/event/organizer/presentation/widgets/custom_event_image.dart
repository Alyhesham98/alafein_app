import 'package:alafein/core/utility/assets_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomEventImage extends StatelessWidget {
  const CustomEventImage({
    super.key,
    required this.imageurl,
  });

  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: CachedNetworkImage(
        imageUrl: imageurl,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Image.asset(
          AssetsData.eventImg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
