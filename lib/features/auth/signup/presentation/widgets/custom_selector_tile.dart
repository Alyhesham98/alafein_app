import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class CustomSelectorTile extends StatelessWidget {
  final String titile;
  final String subtitile;
  final String image;
  final bool isSelected;
  final bool isEventHost;

  const CustomSelectorTile({
    super.key,
    required this.titile,
    required this.subtitile,
    required this.image,
    required this.isSelected,
    required this.isEventHost,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 15.sw,
          height: 15.sw,
          decoration: BoxDecoration(
              color: isSelected
                  ? isEventHost
                      ? kSecondaryColor
                      : kPrimaryColor
                  : kHintColor,
              shape: BoxShape.circle),
          child: Padding(
            padding: EdgeInsets.all(4.5.sw),
            child: SvgPicture.asset(
              image,
            ),
          ),
        ),
        Gap(5.sw),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  titile,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.anton(
                      color: isSelected
                          ? isEventHost
                              ? kSecondaryColor
                              : kPrimaryColor
                          : kHintColor,
                      fontSize: 4.sw,
                      fontWeight: FontWeight.w400),
                ),
                Gap(2.sw),
                if (isSelected)
                  SizedBox(
                      width: 5.sw,
                      height: 5.sw,
                      child: SvgPicture.asset(
                        AssetsData.checkMark,
                        colorFilter: ColorFilter.mode(
                            isSelected
                                ? isEventHost
                                    ? kSecondaryColor
                                    : kPrimaryColor
                                : kHintColor,
                            BlendMode.srcATop),
                      ))
              ],
            ),
            Gap(0.5.sw),
            Container(
              constraints: BoxConstraints(minWidth: 40.sw, maxWidth: 60.sw),
              height: 14.sw,
              child: Text(
                subtitile,
                style: secondaryTextStyle.copyWith(
                  fontSize: 3.7.sw,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
