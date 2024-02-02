import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.size,
    required this.text,
  });

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Description",
            style: homeLabelStyle,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: Text(
              text,
              style: secondaryTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
