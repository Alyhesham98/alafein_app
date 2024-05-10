import 'package:alafein/core/api/constants/api_caller_config.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/event/data/model/comments/comments.dart';
import 'package:alafein/features/event/organizer/presentation/widgets/custom_event_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CommentItems extends StatelessWidget {
  Comments comments;
    CommentItems(this.comments, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            children: [

              SizedBox(
                width: 14.sw,
                height: 6.sh,
                child: CustomEventImage(
                  imageurl: "${APICallerConfiguration.baseImageUrl}${comments.Photo}",
                ),
              ),
              const Gap(5),
              Text(
                "${comments.FirstName} ${comments.LastName}",
                style: homeLabel3Style,
              ),
            ],
          ),
          const Gap(8),
          Text(
            "${comments.Comment}",
            style: eventcomment.copyWith(height: 1.8),
          ),
        ],
      ),
    );
  }
}
