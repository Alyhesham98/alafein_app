import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:flutter/material.dart';

class CustomAppBarEventDeatils extends StatelessWidget {
  const CustomAppBarEventDeatils({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
          child: const CustomEventImage(
            imageurl: AssetsData.eventImg,
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
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white, width: 1.5)),
            child: const Icon(Icons.share),
          ),
        ),
      ],
    );
  }
}
