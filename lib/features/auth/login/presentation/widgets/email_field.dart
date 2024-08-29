import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/core/utility/theme.dart';
import 'package:alafein/features/auth/login/application/cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 4.sw,
            fontFamily: StringConst.formulaFont),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              !value.contains('@') &
                  !value.contains('.com') &
                  !value.contains('gmail') &
                  !value.contains('yahoo') &
                  !value.contains('outlook') &
                  !value.contains('hotmail') &
                  !value.contains('icloud') &
                  !value.contains('live')) {
            return 'Please enter a valid email';
          }
          return null;
        },
        cursorColor: Colors.black,
        onSaved: (newValue) {
          context.read<LoginCubit>().email = newValue!;
        },
        key: const ValueKey('SignInEmail'),
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          constraints: BoxConstraints(
              maxHeight: 14.sw,
              minHeight: 14.sw,
              maxWidth: double.infinity,
              minWidth: double.infinity),
          contentPadding: EdgeInsets.all(
            4.sw,
          ),
          border: textFormFieldBorderStyle,
          enabledBorder: textFormFieldBorderStyle,
          errorBorder: textFormFieldBorderStyle,
          focusedBorder: textFormFieldBorderStyle,
          disabledBorder: textFormFieldBorderStyle,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(
            'Email'.tr(),
          ),
          labelStyle: const TextStyle(
              color: kHintColor,
              fontFamily: StringConst.formulaFont,
              fontWeight: FontWeight.w300),
          filled: false,
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
      ),
    );
  }
}
