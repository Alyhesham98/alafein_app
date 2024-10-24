import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:alafein/features/event/organizer/repos/add_to_calender.dart';

class CalenderDetails extends StatelessWidget {
  const CalenderDetails({
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
  final String? eventName;
  final String name;

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        IconButton(
          onPressed: () {
            // launchUrl(Uri.parse(location));
            print(text);
            Add2Calendar.addEvent2Cal(
              buildEvent(text, location, eventName!, name),
            );
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
