import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:alafein/features/event/organizer/repos/add_to_calender.dart';
import 'package:url_launcher/url_launcher.dart';

class DeatilsItems extends StatelessWidget {
  const DeatilsItems({
    super.key,
    required this.icon,
    required this.text,
    required this.name,
    required this.eventName,
    required this.location,
  });
  final Widget icon;
  final String text;
  final String location;
  final String eventName;
  final String name;

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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text.length > 35
                ? '${text.substring(0, 30)}...'
                : text,
          ),
        ),
      ],
    );
  }
}
