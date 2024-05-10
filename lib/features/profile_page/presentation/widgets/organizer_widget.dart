import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';

class TempWidget extends StatelessWidget {
  const TempWidget({super.key, this.input});

  final input;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kDividerColor, width: 1.5),
      ),
      child: Row(
        children: [
          Text(
            input,
            style: secondaryTextStyle,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}