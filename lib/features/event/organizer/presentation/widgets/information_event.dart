import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';

class InformationEvent extends StatelessWidget {
  const InformationEvent({
    super.key,
    required this.name,
    required this.date,
    required this.venue,
  });
  final String? name;
  final String? date;
  final String? venue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: homeLabelStyle.copyWith(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            date ?? '',
            style: secondaryTextStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Venue: ",
                style: secondaryTextStyle.copyWith(fontSize: 14),
              ),
              Text(
                venue ?? '',
                style: secondaryTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}