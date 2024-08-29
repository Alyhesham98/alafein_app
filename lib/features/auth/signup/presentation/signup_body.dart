import 'package:alafein/features/auth/signup/application/signup_cubit/signup_cubit.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/email_field.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/first_name_field.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/last_name_field.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/password_field.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/profile_picture.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/terms.dart';
import 'package:alafein/features/auth/signup/presentation/widgets/text_field_hint.dart';
import 'package:alafein/features/auth/signup/widgets/signup_custom_text.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/presentation/routes/app_router.gr.dart';
import '../../../../core/presentation/widgets/main_custom_button.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signupCubit = BlocProvider.of<SignupCubit>(context)..getLookup();
    return SingleChildScrollView(
      child: Form(
        key: signupCubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SignupTopCustomText(
              title: "Personal Information".tr(),
              subtitle: "Enter your personal information to proceed".tr(),
            ),
            Gap(4.sw),
            const ProfilePicture(),
            Gap(4.sw),
            const FirstNameField(),
            Gap(4.sw),
            const LastNameField(),
            Gap(2.sw),
            TextFieldHint(
                hint: 'Make sure it matches the name on your government ID'.tr()
            ),
            Gap(4.sw),
            const EmailField(),
            Gap(
              2.sw,
            ),
            TextFieldHint(
                hint: 'We will email you trip confirmations and receipts'.tr()
            ),
            Gap(4.sw),
            const PasswordField(),
            Gap(6.sw),
            const Terms(),
            Gap(24.sw),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.sw),
                child: MainCustomButton(
                  buttonName: 'Next'.tr(),
                  onPressed: () {
                    if (signupCubit.formKey.currentState!.validate()) {
                      signupCubit.formKey.currentState!.save();
                      AutoRouter.of(context)
                          .push(const SignupTypeSelectorRoute());
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
