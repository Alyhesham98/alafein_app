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
    return CachedNetworkImage(
      imageUrl: imageurl,
      fit: BoxFit.contain,
      width: 120,
      height: 120,
      errorWidget: (context, url, error) => Image.asset(
        AssetsData.eventImg,
        fit: BoxFit.cover,
      ),
    );
  }
}
