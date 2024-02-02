import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class VenuAddressField extends StatefulWidget {
  const VenuAddressField({
    super.key,
  });

  @override
  State<VenuAddressField> createState() => _VenuAddressFieldState();
}

class _VenuAddressFieldState extends State<VenuAddressField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(() {});
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(bottom: 1.sw),
      child: TextFormField(
        focusNode: _focusNode,
        style: GoogleFonts.abhayaLibre(
          color: kSemiBlack,
          fontWeight: FontWeight.w700,
          fontSize: 4.sw,
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a valid Address';
          }
          return null;
        },
        cursorColor: Colors.black,
        key: const ValueKey('VenuAddress'),
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
            constraints: BoxConstraints(
                maxHeight: 14.sw,
                minHeight: 14.sw,
                maxWidth: double.infinity,
                minWidth: double.infinity),
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
            label: const Text(
              'Venu Address',
            ),
            labelStyle: const TextStyle(
                color: kHintColor,
                fontFamily: StringConst.formulaFont,
                fontWeight: FontWeight.w300),
            filled: true,
            fillColor: Colors.white),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
      ),
    );
  }
}
