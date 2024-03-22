import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EventOrganizerWebsite extends StatefulWidget {
  const EventOrganizerWebsite({
    super.key,
  });

  @override
  State<EventOrganizerWebsite> createState() => _EventOrganizerWebsiteState();
}

class _EventOrganizerWebsiteState extends State<EventOrganizerWebsite> {
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
    final signupCubit = BlocProvider.of<SignupCubit>(context);

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
        onSaved: (value) {
          signupCubit.website = value!;
        },
        onChanged: (value) {
          signupCubit.website = value;
        },
        validator: (value) {
          if ((signupCubit.other == null || signupCubit.other.isEmpty) &&
              (signupCubit.instagram == null || signupCubit.instagram.isEmpty) &&
              (signupCubit.facebook == null || signupCubit.facebook.isEmpty) &&
              (signupCubit.website == null || signupCubit.website.isEmpty)) {
            return 'Please enter a valid Website';
          }
          return null;
        },
        cursorColor: Colors.black,
        key: const ValueKey('EventOrganizerWebsite'),
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
              'Website',
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
