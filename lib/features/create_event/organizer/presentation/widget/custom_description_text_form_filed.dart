import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomDescriptionTextFormField extends StatelessWidget {
  final String lable;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  const CustomDescriptionTextFormField({
    super.key,
    required this.lable,
    this.validator,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(bottom: 1.sw),
      child: TextFormField(
        style: GoogleFonts.abhayaLibre(
          color: kSemiBlack,
          fontWeight: FontWeight.w700,
          fontSize: 4.sw,
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onSaved: onSaved,
        validator: validator,
        cursorColor: Colors.black,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.bottom,
        maxLines: 8,
        minLines: 4,
        maxLength: 750,
        decoration: InputDecoration(
            counterText: "",
            isDense: true,
            constraints: const BoxConstraints(
                maxWidth: double.infinity, minWidth: double.infinity),
            contentPadding: EdgeInsets.all(4.sw),
            border: textFormFieldBorderStyle,
            enabledBorder: textFormFieldBorderStyle,
            errorBorder: textFormFieldBorderStyle,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1.5, color: kPrimaryColor),
            ),
            disabledBorder: textFormFieldBorderStyle,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            label: Text(
              lable,
            ),
            labelStyle: const TextStyle(
                color: kHintColor,
                fontFamily: StringConst.formulaFont,
                fontWeight: FontWeight.w300),
            filled: true,
            fillColor: Colors.white),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
      ),
    );
  }
}
