import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  const CustomDropdown(
      {super.key,
      required this.hint,
      this.value,
      required this.items,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        dropdownElevation: 1,
        scrollbarAlwaysShow: true,
        buttonHeight: 14.sw,
        dropdownPadding: const EdgeInsets.only(left: 0),
        dropdownDecoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        buttonDecoration: BoxDecoration(
            border: Border.all(width: 1, color: kDividerColor),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        icon: SizedBox(
          width: 16.sw,
          height: 16.sw,
          child: Padding(
            padding: EdgeInsets.all(4.sw),
            child: SvgPicture.asset(
              AssetsData.arrowDown,
              height: 6.sw,
              width: 6.sw,
              colorFilter:
                  const ColorFilter.mode(kPersonGreyColor, BlendMode.srcATop),
            ),
          ),
        ),
        isExpanded: true,
        hint: Text(
          hint,
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: kHintColor,
              fontFamily: StringConst.formulaFont,
              fontWeight: FontWeight.w300),
          overflow: TextOverflow.ellipsis,
        ),
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
