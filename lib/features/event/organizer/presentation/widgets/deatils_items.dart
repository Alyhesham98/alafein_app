import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeatilsItems extends StatelessWidget {
  const DeatilsItems({
    super.key,
    required this.icon,
    required this.text,
    required this.location,
  });
  final Widget icon;
  final String text;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
          launchUrl(Uri.parse(location));
          },
          icon: icon,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: secondaryTextStyle,
        ),
      ],
    );
  }
}
