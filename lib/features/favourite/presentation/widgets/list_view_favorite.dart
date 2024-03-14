import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_icon.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/information_event.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
// import 'package:alafein/features/favourite/presentation/widgets/list_view_favorite_items.dart';
import 'package:flutter/material.dart';

class ListViewEventFavorite extends StatelessWidget {
  const ListViewEventFavorite({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 3,
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xffECECEC),
          ),
          itemBuilder: (context, index) {
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
                        name: "Name",
                        date: "6/3/1999",
                        venue: "Opera",
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
      },
    );
  }
}
