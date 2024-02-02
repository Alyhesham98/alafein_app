import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:dropdown_button3/dropdown_button3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

import '../../../model/lookup_model.dart';

class EventOrganiserDropDown extends StatefulWidget {
  const EventOrganiserDropDown({super.key});

  @override
  State<EventOrganiserDropDown> createState() => _EventOrganiserDropDownState();
}

class _EventOrganiserDropDownState extends State<EventOrganiserDropDown> {
  // List<String> list = [
  //   "Option text here",
  //   "Option text here",
  //   "Option text here",
  // ];
  var selectedItem;

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context);
    return DropdownButtonHideUnderline(
      child: DropdownButton2<Category>(
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
          'Event type',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: kHintColor,
              fontFamily: StringConst.formulaFont,
              fontWeight: FontWeight.w300),
          overflow: TextOverflow.ellipsis,
        ),
        value: selectedItem,
        items: signupCubit.lookupModel?.category
            ?.map((item) => DropdownMenuItem<Category>(
                value: item,
                child: Text(
                  item.name ?? "category",
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
            signupCubit.selectedCategory = item;
          });
        },
      ),
    );
  }
}
