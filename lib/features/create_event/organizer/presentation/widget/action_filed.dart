import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:flutter/material.dart';

class ActionField extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const ActionField(
      {super.key, required this.title, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1.25,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFECECEC),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                child: Text(
                  title,
                  // style: TextStyle(
                  //   color: const Color(0xFF5E5E5E),
                  //   fontSize: 16.sw,
                  //   fontFamily: 'Formula Condensed',
                  //   fontWeight: FontWeight.w300,
                  //   height: 0.09,
                  //   letterSpacing: 0.64,
                  // ),
                  style: const TextStyle(
                    color: kHintColor,
                    fontFamily: StringConst.formulaFont,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Icon(
              icon,
              color: kHintColor,
            ),
          ],
        ),
      ),
    );
  }
}
