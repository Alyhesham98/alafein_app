import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';

class DeatilsItems extends StatelessWidget {
  const DeatilsItems({
    super.key,
    required this.icon,
    required this.text,
  });
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
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
