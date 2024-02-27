import 'package:alafein/core/presentation/routes/app_router.gr.dart';
import 'package:alafein/core/presentation/widgets/main_custom_button.dart';
import 'package:alafein/core/presentation/widgets/secondary_custom_button.dart';
import 'package:alafein/core/utility/assets_data.dart';
import 'package:alafein/core/utility/colors_data.dart';
import 'package:alafein/core/utility/strings.dart';
import 'package:alafein/features/auth/login/application/cubit/login_cubit.dart';
import 'package:alafein/features/auth/login/application/google_auth_cubit.dart';
import 'package:alafein/features/auth/login/application/google_auth_state.dart';
import 'package:alafein/features/auth/login/presentation/widgets/custom_login_main_text.dart';
import 'package:alafein/features/auth/login/presentation/widgets/email_field.dart';
import 'package:alafein/features/auth/login/presentation/widgets/password_field.dart';
import 'package:alafein/features/auth/login/presentation/widgets/platform_login_button.dart';
import 'package:alafein/features/main/main_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:svg_flutter/svg.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Size> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _heightAnimation = Tween<Size>(
            begin: const Size(double.infinity, 0),
            end: Size(double.infinity, 14.sw))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _heightAnimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.sw),
        child: SingleChildScrollView(
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginStateLoaded) {
                AutoRouter.of(context).replace(
                  OnboardingRoute(route: MainRoute()),
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<LoginCubit>();
              return Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      AssetsData.blueLogo,
                    ),
                    Gap(8.sw),
                    const CustomLoginMainText(
                      text: 'Let’s check if you have an account',
                    ),
                    Gap(6.sw),
                    const EmailField(),
                    Gap(6.sw),
                    const PasswordField(),
                    Gap(6.sw),
                    MainCustomButton(
                      buttonName: 'CONTINUE',
                      onPressed: () async {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.formKey.currentState!.save();
                          cubit.signIn();
                        }
                      },
                    ),
                    Gap(6.sw),
                    SecondaryCustomButton(
                      text: 'Skip',
                      onPressed: () async {
                        AutoRouter.of(context).replaceAll([MainRoute()]);
                      },
                    ),
                    Gap(4.sw),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: Container(
                    //         height: 0.2.sw,
                    //         color: kHintColor,
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //         horizontal: 2.sw,
                    //       ),
                    //       child: Text(
                    //         'or',
                    //         style: TextStyle(
                    //           fontFamily: StringConst.formulaFont,
                    //           color: kHintColor,
                    //           fontWeight: FontWeight.w300,
                    //           fontSize: 4.sw,
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Container(
                    //         height: 0.2.sw,
                    //         color: kHintColor,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.sw,
                      ),
                      child: Text(
                        'OR',
                        style: GoogleFonts.ubuntu(
                            fontSize: 16,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Gap(4.sw),
                    SecondaryCustomButton(
                      text: "Create New Account",
                      onPressed: () {
                        AutoRouter.of(context).push(const SignupRoute());
                      },
                    ),
                    Gap(4.sw),
                    PlatformCustomButton(
                      onPressed: () {},
                      platform: 'Apple',
                      image: AssetsData.apple,
                    ),
                    Gap(4.sw),
                    BlocConsumer<GoogleAuthCubit, GoogleAuthState>(
                      listener: (context, state) {
                        switch (state.runtimeType) {
                          case GoogleAuthLoadingState:
                            EasyLoading.show();
                            break;
                          case GoogleAuthInitialState:
                            EasyLoading.show();
                            break;
                          case GoogleAuthSuccessState:
                            {
                              EasyLoading.dismiss();
                              state is GoogleAuthSuccessState;

                              break;
                            }
                          case GoogleAuthFaildState :
                            final s=state as GoogleAuthFaildState;

                            EasyLoading.dismiss();
                            EasyLoading.showError(s.error);
                            break;
                        }
                      },
                      builder: (context, state) {
                        return PlatformCustomButton(
                          onPressed: () {
                            print("u contiue with google button");
                            // state is GoogleAuthLoadingState ? null : () => context.read<GoogleAuthCubit>().login();
                            context.read<GoogleAuthCubit>().login();
                            print("${state is GoogleAuthLoadingState}");
                          },
                          platform: 'Google',
                          image: AssetsData.google,
                        );
                      },
                    ),
                    Gap(4.sw),
                    PlatformCustomButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ));
                      },
                      platform: 'Facebook',
                      image: AssetsData.facebook,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
