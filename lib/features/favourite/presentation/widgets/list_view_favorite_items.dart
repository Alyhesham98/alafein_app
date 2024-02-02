import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_icon.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/information_event.dart';
import 'package:flutter/material.dart';

class ListEventFavoriteItems extends StatelessWidget {
  const ListEventFavoriteItems({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const EventDeatils(),
        //     ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: SizedBox(
          height: 100,
          child: Row(children: [
            const CustomEventImage(
              imageurl: AssetsData.eventImg,
            ),
            SizedBox(
              width: size.width * 0.05,
            ),
            const Expanded(
              child: Row(
                children: [
                  InformationEvent(
                    name: "",
                    date: "",
                    venue: "",
                  ),
                  CustomIcon(
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Color(0xFF7C7C7C),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
