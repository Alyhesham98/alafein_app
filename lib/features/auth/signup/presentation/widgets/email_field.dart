import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EmailField extends StatefulWidget {
  const EmailField({
    super.key,
  });

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
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
          signupCubit.email = value!;
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Can't be empty";
          } else if (!validateEmail(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
        cursorColor: Colors.black,
        key: const ValueKey('SignupEmail'),
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
          fillColor: Colors.white,
          label: const Text(
            'Email',
          ),
          labelStyle: const TextStyle(
              color: kHintColor,
              fontFamily: StringConst.formulaFont,
              fontWeight: FontWeight.w300),
          filled: true,
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
      ),
    );
  }

  bool validateEmail(String email) {
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';

    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }
}
