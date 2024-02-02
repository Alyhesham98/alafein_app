import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class VenueDropDown extends StatefulWidget {
  const VenueDropDown({super.key});

  @override
  State<VenueDropDown> createState() => _VenueDropDownState();
}

class _VenueDropDownState extends State<VenueDropDown> {
  List<String> list = [
    "1",
    "2",
    "3",
  ];
  var selectedItem;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
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
        hint: const Text(
          'What type of events do you host ?',
          style: TextStyle(
              color: kHintColor,
              overflow: TextOverflow.ellipsis,
              fontFamily: StringConst.formulaFont,
              fontWeight: FontWeight.w300),
          overflow: TextOverflow.ellipsis,
        ),
        value: selectedItem,
        items: list
            .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.abhayaLibre(
                    color: kSemiBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 4.sw,
                  ),
                )))
            .toList(),
        onChanged: (item) {
          setState(() {
            selectedItem = item!;
          });
        },
      ),
    );
  }
}
