import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SquareIconButton extends StatelessWidget {
  final String icon;
  final Color color;
  final VoidCallback onPressed;

  const SquareIconButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(17.0),
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(17.0),
        onTap: onPressed,
        child: SizedBox(
          width: 33.0,
          height: 33.0,
          child: Center(
              child: SvgPicture.asset(
            icon,
            color: Colors.white,
            fit: BoxFit.fill,
            width: 20,
            height: 20,
          )),
        ),
      ),
    );
  }
}
