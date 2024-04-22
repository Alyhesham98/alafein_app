import 'package:share_plus/share_plus.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/header_event_image.dart';
import 'package:flutter/material.dart';

class CustomAppBarEventDeatils extends StatelessWidget {
  const CustomAppBarEventDeatils({
    super.key, required this.headerImgUrl, required this.eventId
  });

  final String headerImgUrl;
  final int eventId;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          child: HeaderEventImage(
            imageurl: headerImgUrl,
          ),
        ),
        Positioned(
          top: 30,
          left: 8,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 1.5)),
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: 8,
          child: GestureDetector(
            onTap: () {
              Share.share('Check out this event! \nI would like if you joined me there. \nhttps://alafeinapp.z19.web.core.windows.net/event_details_route/$eventId');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.white, width: 1.5)),
              child: const Icon(Icons.share),
            ),
          ),
        ),
      ],
    );
  }
}
