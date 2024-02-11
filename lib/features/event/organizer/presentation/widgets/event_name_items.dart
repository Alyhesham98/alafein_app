import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class EventName extends StatelessWidget {
  const EventName({
    super.key,
    required this.size,
    required this.imageurl,
    required this.name,
    // required this.onTap,
  });

  final Size size;
  final String imageurl;
  final String name;
  // final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(children: [
        CustomEventImage(
          imageurl: imageurl,
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .25,
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: homeLabelStyle,
              ),
            ),
            const Gap(2),
            Text(
              "Event organizer",
              style: secondaryTextStyle,
            ),
          ],
        ),
        const Gap(25),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIcon(
                icon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFF7C7C7C),
                ),
                onTap: () {},
              ),
              CustomIcon(
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: Color(0xFF7C7C7C),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
