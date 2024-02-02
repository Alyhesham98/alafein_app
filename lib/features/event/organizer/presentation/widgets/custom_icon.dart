import 'package:alafein/core/utility/colors_data.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    this.onTap,
    this.icon,
  });
  final void Function()? onTap;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kDividerColor, width: 1.5),
        ),
        child: icon,
      ),
    );
  }
}
